import 'package:employee_management/model/voucher.dart';
import 'package:employee_management/navigation/user_nav.dart';
import 'package:flutter/material.dart';
import 'package:employee_management/ipconfig/ipconfig.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ShowVoucherStatusScreen extends StatefulWidget {
  @override
  _ShowVoucherStatusScreenState createState() => _ShowVoucherStatusScreenState();
}

class _ShowVoucherStatusScreenState extends State<ShowVoucherStatusScreen> {
  late Future<List<Voucher>> _voucherList;

  @override
  void initState() {
    super.initState();
    _voucherList = _fetchVouchers();
  }

  Future<List<Voucher>> _fetchVouchers() async {
    final url = '${Ipconfig().ip}getAllRequestVoucher';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => Voucher.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load vouchers');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: UserNav(),
      appBar: AppBar(
        title: Text('Voucher Status'),
        backgroundColor: Colors.blueAccent,
      ),
      body: FutureBuilder<List<Voucher>>(
        future: _voucherList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No vouchers found'));
          } else {
            return ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final voucher = snapshot.data![index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    title: Text(voucher.heading),
                    subtitle: Text('Amount: ${voucher.ammount}'),
                    trailing: Text(voucher.status),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VoucherDetailScreen(voucher: voucher),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

class VoucherDetailScreen extends StatelessWidget {
  final Voucher voucher;

  VoucherDetailScreen({required this.voucher});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Voucher Details'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Voucher Head: ${voucher.heading}', style: TextStyle(fontSize: 20)),
            SizedBox(height: 8),
            Text('Description: ${voucher.description}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text('Amount: ${voucher.ammount}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text('Status: ${voucher.status}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text('Requester ID: ${voucher.requesterId}', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
