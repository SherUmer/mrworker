import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mr_worker/Aut/AboutPage.dart';
import 'package:mr_worker/Database.dart';
import 'package:mr_worker/Screens/emergencyScreen.dart';
import 'package:mr_worker/emergencyServices.dart';
import 'package:mr_worker/home_widgets/categoryPage.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../authScreen.dart';
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
            child: Text(''),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const categoryPage(),
                ),
              );
            },
            title: const Text(
              'Listing',
              style: TextStyle(color: Colors.black),
            ),
            leading: const FaIcon(FontAwesomeIcons.servicestack),
            iconColor: Colors.black,
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const EmergencyScreen(),
                ),
              );
            },
            title: const Text(
              'Emergency Services',
              style: TextStyle(color: Colors.black),
            ),
            leading: const Icon(Icons.emergency_sharp),
            iconColor: Colors.black,
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
            title: const Text(
              'About Us',
              style: TextStyle(color: Colors.black),
            ),
            leading: const FaIcon(FontAwesomeIcons.addressCard),
            iconColor: Colors.black,
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ContactPage(),
                ),
              );
            },
            title: const Text(
              'Contact us',
              style: TextStyle(color: Colors.black),
            ),
            leading: const FaIcon(FontAwesomeIcons.phone),
            iconColor: Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5.0, right: 5.0),
            child: Divider(
              color: Theme.of(context).primaryColor,
              thickness: 1.0,
            ),
          ),
          (dbclass.isLoggedIn == false)
              ? ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AuthScreen(),
                      ),
                    );
                  },
                  title: const Text(
                    "Login",
                    style: TextStyle(color: Colors.black),
                  ),
                  leading: const FaIcon(FontAwesomeIcons.unlock),
                  iconColor: Colors.black,
                )
              : ListTile(
                  onTap: () async {
                    await dbclass.logOut();
                    (dbclass.isLoggedIn == false)
                        ? Navigator.pop(context)
                        : Navigator.pop(context);
                  },
                  title: const Text(
                    'Logout',
                    style: TextStyle(color: Colors.black),
                  ),
                  leading: const FaIcon(FontAwesomeIcons.lock),
                  iconColor: Colors.black,
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
