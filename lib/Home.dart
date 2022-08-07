import 'package:cached_network_image/cached_network_image.dart';
import 'package:dynamic_fa_icons/dynamic_fa_icons.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:mr_worker/Aut/SettingPage.dart';
import 'package:mr_worker/Database.dart';
import 'package:mr_worker/Details/DetailPage2.dart';
import 'package:mr_worker/Details/detailpage.dart';
import 'package:mr_worker/Details/widgets/Worker_Drawer.dart';
import 'package:mr_worker/Register.dart';
import 'package:mr_worker/home_widgets/home_categories.dart';
import 'package:provider/provider.dart';
import 'Details/DetailPage3.dart';
import 'data/network_type.dart';
import 'home_widgets/home_popular.dart';
import 'home_widgets/recommended.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<DataBase>().fetchPopular;
    context.read<DataBase>().fetchCategory;
    context.read<DataBase>().fetchRecommendation;
    context.read<DataBase>().getCity();

    var dbclass = context.read<DataBase>();

    return Scaffold(
      drawer: const Worker_Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.white54,
        title: const Padding(
          padding: EdgeInsets.only(left: 60),
          child: Text(
            'Mr.Worker',
            style: TextStyle(color: Colors.black),
          ),
        ),
        actions: [
          InkWell(
            // onTap: (){

            onTap: () async {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Register()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: CircleAvatar(
                  child: Consumer<DataBase>(builder: (context, value, child) {
                return value.Profilepicture != null
                    ? CircleAvatar(
                        child: ClipOval(
                          child: Image.file(
                            value.Profilepicture!,
                            fit: BoxFit.cover,
                            width: 50,
                          ),
                        ),
                      )
                    : CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl:
                            "https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png?20150327203541",
                      );
              })),
            ),
          )
        ],
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(color: Color(0xffEAEBED)),
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(alignment: Alignment.bottomCenter, children: [
                      Image.asset('assets/update.png',
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.contain),
                      Container(
                          margin: const EdgeInsets.all(4),
                          width: MediaQuery.of(context).size.width * 0.96,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.black12)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.search),
                                  SizedBox(
                                      height: 50,
                                      width: 200,
                                      child: NetworkTypeAheadPage()),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Icon(Icons.location_on),
                                  InkWell(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                                title:
                                                    const Text('Select City'),
                                                content: SingleChildScrollView(
                                                  child: ListBody(
                                                    children: [
                                                      ListTile(
                                                        title: const Text(
                                                            'Get From Gps'),
                                                        trailing: const Icon(
                                                            Icons.gps_fixed),
                                                        onTap: () {
                                                          dbclass
                                                              .getPermission();
                                                          dbclass
                                                              .getCityLocation();
                                                          dbclass.SetCityForSearchbar(
                                                              dbclass.Cityname
                                                                  .toString());

                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                      ),
                                                      ListTile(
                                                        title: const Text(
                                                            'Islamabad'),
                                                        onTap: () {
                                                          dbclass
                                                              .SetCityForSearchbar(
                                                                  'Islamabad');
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                      ),
                                                      ListTile(
                                                        title: const Text(
                                                            'Lahore'),
                                                        onTap: () {
                                                          dbclass
                                                              .SetCityForSearchbar(
                                                                  'Lahore');
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                      ),
                                                      ListTile(
                                                        title: const Text(
                                                            'Peshawar'),
                                                        onTap: () {
                                                          dbclass
                                                              .SetCityForSearchbar(
                                                                  'Peshawar');
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                      ),
                                                      ListTile(
                                                        title: const Text(
                                                            'karachi'),
                                                        onTap: () {
                                                          dbclass
                                                              .SetCityForSearchbar(
                                                                  'karachi');
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                      ),
                                                      ListTile(
                                                        title: const Text(
                                                            'Quetta'),
                                                        onTap: () {
                                                          dbclass
                                                              .SetCityForSearchbar(
                                                                  'Quetta');
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                      ),
                                                      ListTile(
                                                        title: const Text(
                                                            'Azad Kashmir'),
                                                        onTap: () {
                                                          dbclass
                                                              .SetCityForSearchbar(
                                                                  'Azad kashmir');
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                      ),
                                                      ListTile(
                                                        title: const Text(
                                                            'rawalpindi'),
                                                        onTap: () {
                                                          dbclass
                                                              .SetCityForSearchbar(
                                                                  'Rawalpindi');
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                      ),
                                                      ListTile(
                                                        title: const Text(
                                                            'Abbotabad'),
                                                        onTap: () {
                                                          dbclass
                                                              .SetCityForSearchbar(
                                                                  'Abbotabad');
                                                          Navigator.of(context)
                                                              .pop();
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ));
                                          });
                                    },
                                    child: Consumer<DataBase>(
                                        builder: (context, value, child) {
                                      return Text(
                                          dbclass.initial_city.toString());
                                    }),
                                  )
                                ],
                              ),
                            ],
                          )),
                    ]),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      'Categories',
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Home_Categories(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      'Popular',
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Home_Popular(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      'Recommend for You',
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Recommended(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int i) {
          if (i == 1) {
            print('Workers');
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const detailpage(
                  curl: '',
                ),
              ),
            );
          }
          if (i == 2) {
            print('Setting');
            {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingPage(),
                ),
              );
            }
          }
        },
        backgroundColor: Colors.white,
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Workers',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

class Person {
  final String name, services;

  Person(
    this.name,
    this.services,
  );
}
