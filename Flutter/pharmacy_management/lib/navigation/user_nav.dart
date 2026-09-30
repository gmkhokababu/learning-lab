import 'package:flutter/material.dart';
import 'package:pharmacy_management/admin/dashboard.dart';
import 'package:pharmacy_management/admin/product_list_damage.dart';
import 'package:pharmacy_management/admin/product_list_return.dart';
import 'package:pharmacy_management/admin/purchase_report.dart';
import 'package:pharmacy_management/admin/sales.dart';
import 'package:pharmacy_management/admin/sales_reports.dart';
import 'package:pharmacy_management/admin/show_damage_list.dart';
import 'package:pharmacy_management/main.dart';
import 'package:pharmacy_management/user/user_screen.dart';

class UserNav extends StatelessWidget {
  const UserNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(accountName: Text(""), accountEmail: Text("")),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => UserScreen()));
              },
            ),
            // ListTile(
            //   leading: Icon(Icons.shopping_cart),
            //   title: Text("Sale"),
            //   onTap: () {
            //     Navigator.push(
            //         context, MaterialPageRoute(builder: (context) => Sales()));
            //   },
            // ),
            // ListTile(
            //   leading: Icon(Icons.report),
            //   title: Text("Sales Report"),
            //   onTap: () {
            //     Navigator.push(
            //         context, MaterialPageRoute(builder: (context) => SalesReports()));
            //   },
            // ),
            // ListTile(
            //   leading: Icon(Icons.report),
            //   title: Text("Purchase Report"),
            //   onTap: () {
            //     Navigator.push(
            //         context, MaterialPageRoute(builder: (context) => PurchaseReport()));
            //   },
            // ),
            // ListTile(
            //   leading: Icon(Icons.assignment_return),
            //   title: Text("Return"),
            //   onTap: () {
            //     Navigator.push(
            //         context, MaterialPageRoute(builder: (context) => ProductListReturn()));
            //   },
            // ),
            // ListTile(
            //   leading: Icon(Icons.water_damage),
            //   title: Text("Damage"),
            //   onTap: () {
            //     Navigator.push(
            //         context, MaterialPageRoute(builder: (context) => ProductListDamage()));
            //   },
            // ),
            // ListTile(
            //   leading: Icon(Icons.water_damage),
            //   title: Text("Damage List"),
            //   onTap: () {
            //     Navigator.push(
            //         context, MaterialPageRoute(builder: (context) => ShowDamageList()));
            //   },
            // ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Log out"),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MyApp()));
              },
            ),
          ],
        ));
  }
}
