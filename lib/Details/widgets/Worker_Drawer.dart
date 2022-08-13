import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mr_worker/Aut/AboutPage.dart';
import 'package:mr_worker/Database.dart';
import 'package:mr_worker/emergencyServices.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../contact.dart';

class Worker_Drawer extends StatelessWidget {
  const Worker_Drawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dbclass = context.read<DataBase>();
    dbclass.checkAuth();
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/logo.png'),
              ),
            ),
            child: Text('Mr worker'),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AboutPage(),
                ),
              );
            },
            title: const Text('Our Services'),
            leading: const FaIcon(FontAwesomeIcons.servicestack),
          ),
          const Divider(),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const EmergencyServices(),
                ),
              );
            },
            title: const Text('Emergency Services'),
            leading: const Icon(Icons.emergency_sharp),
          ),
          const Divider(),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AboutPage(),
                ),
              );
            },
            title: const Text('About Us'),
            leading: const FaIcon(FontAwesomeIcons.addressCard),
          ),
          const Divider(),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ContactPage(),
                ),
              );
            },
            title: const Text('Contact us'),
            leading: const FaIcon(FontAwesomeIcons.phone),
          ),
          const Divider(),
          (dbclass.isLoggedIn == false)
              ? const ListTile(
                  title: Text("Login"),
                  leading: FaIcon(FontAwesomeIcons.unlock),
                )
              : const ListTile(
                  title: Text('Logout'),
                  leading: FaIcon(FontAwesomeIcons.lock),
                ),
          const Divider(),
          //
          // Padding(
          //   padding: const EdgeInsets.all(20.0),
          //   child: Shimmer.fromColors(
          //     baseColor: Colors.grey.shade800,
          //     highlightColor: Colors.yellow,
          //     child: Container(
          //       height: 150,
          //       width: MediaQuery.of(context).size.width,
          //       decoration: BoxDecoration(
          //           border: Border.all(color: Colors.black),
          //           borderRadius: BorderRadius.circular(20),
          //           color: Colors.white38),
          //       child: Column(
          //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //         crossAxisAlignment: CrossAxisAlignment.center,
          //         children: [
          //           Container(
          //             alignment: Alignment.center,
          //             child: const Text('Login'),
          //           ),
          //           const Text('Or'),
          //           Container(
          //             alignment: Alignment.center,
          //             child: const Text('Signup'),
          //           )
          //         ],
          //       ),
          //     ),
          //   ),
          // )
          //
        ],
      ),
    );
  }
}
