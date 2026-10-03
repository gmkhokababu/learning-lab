import 'dart:convert';

import 'package:employee_management/ipconfig/ipconfig.dart';
import 'package:employee_management/model/voucher.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class AdminVoucherRequestScreen extends StatefulWidget {
  @override
  _AdminVoucherRequestScreenState createState() => _AdminVoucherRequestScreenState();
}

class _AdminVoucherRequestScreenState extends State<AdminVoucherRequestScreen> {
  List<Voucher> _vouchers = [];
  bool _isLoading = true;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _fetchVouchers();
  }

  Future<void> _fetchVouchers() async {
    final url = '${Ipconfig().ip}getAllRequestVoucher';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        setState(() {
          _vouchers = data.map((e) => Voucher.fromJson(e)).toList();
          _isLoading = false;
        });
      } else {
        setState(() {
          _hasError = true;
          _isLoading = false;
        });
        throw Exception('Failed to load vouchers');
      }
    } catch (e) {
      setState(() {
        _hasError = true;
        _isLoading = false;
      });
    }
  }

  Future<void> _updateVoucherStatus(int id, String status) async {
    final url = '${Ipconfig().ip}rejectLeave/$id/$status';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        setState(() {
          _vouchers = _vouchers.where((voucher) => voucher.voucherNumber != id).toList();
        });
      } else {
        throw Exception('Failed to update voucher status');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to update voucher status')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Voucher Requests'),
        backgroundColor: Colors.blueAccent,
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _hasError
          ? Center(child: Text('Failed to load vouchers'))
          : _vouchers.isEmpty
          ? Center(child: Text('No data found'))
          : ListView.builder(
        itemCount: _vouchers.length,
        itemBuilder: (context, index) {
          final voucher = _vouchers[index];
          return ListTile(
            title: Text(voucher.heading),
            subtitle: Text('Amount: \$${voucher.ammount}'),
            onTap: () => _showVoucherDetails(voucher),
          );
        },
      ),
    );
  }

  void _showVoucherDetails(Voucher voucher) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(voucher.heading),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Amount: \$${voucher.ammount}'),
              SizedBox(height: 8),
              Text('Description: ${voucher.description}'),
              SizedBox(height: 8),
              Text('Status: ${voucher.status}'),
              SizedBox(height: 8),
              Text('Requester ID: ${voucher.requesterId}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                _updateVoucherStatus(voucher.voucherNumber, 'accepted');
                Navigator.of(context).pop();
              },
              child: Text('Accept', style: TextStyle(color: Colors.green)),
            ),
            TextButton(
              onPressed: () {
                _updateVoucherStatus(voucher.voucherNumber, 'rejected');
                Navigator.of(context).pop();
              },
              child: Text('Reject', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }
}
