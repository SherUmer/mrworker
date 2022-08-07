import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mr_worker/Aut/AboutPage.dart';
import 'package:mr_worker/Database.dart';
import 'package:provider/provider.dart';


class Worker_Drawer extends StatelessWidget {
  const Worker_Drawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dbclass = context.read<DataBase>();
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              child: Text('Mr worker'),
              decoration: BoxDecoration(
                  image:
                  DecorationImage(image: AssetImage('assets/logo.png')))),
          ListTile(
              title: Text('Our Services'),
              leading: FaIcon(FontAwesomeIcons.servicestack)),
          Divider(),
          ListTile(
              title: Text('Emergency Services'),
              leading: Icon(Icons.emergency_sharp)),
          Divider(),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutPage()),
              );
            },
            child: ListTile(
                title: Text('About Us'),
                leading: FaIcon(FontAwesomeIcons.addressCard)),
          ),
          Divider(),
          ListTile(
              title: Text('Contact us'),
              leading: FaIcon(FontAwesomeIcons.phone)),
          Divider(),
          (dbclass.name == 'null')
              ? Container()
              : ListTile(
              title: Text('Logout'),
              leading: FaIcon(FontAwesomeIcons.lock)),
          Divider(),
        ],
      ),
    );
  }
}