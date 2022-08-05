import 'package:cached_network_image/cached_network_image.dart';
import 'package:dynamic_fa_icons/dynamic_fa_icons.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:mr_worker/Aut/SettingPage.dart';
import 'package:mr_worker/Database.dart';
import 'package:mr_worker/Details/DetailPage2.dart';
import 'package:mr_worker/Details/detailpage.dart';
import 'package:mr_worker/Register.dart';
import 'package:mr_worker/widgets/worker_drawer.dart';
import 'package:provider/provider.dart';
import 'Details/DetailPage3.dart';
import 'data/network_type.dart';

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
              style: const TextStyle(color: Colors.black),
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
            decoration: const BoxDecoration(color: const Color(0xffEAEBED)),
            child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Column(children: [
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
                                                  content:
                                                      SingleChildScrollView(
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

                                                            Navigator.of(
                                                                    context)
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
                                                            Navigator.of(
                                                                    context)
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
                                                            Navigator.of(
                                                                    context)
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
                                                            Navigator.of(
                                                                    context)
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
                                                            Navigator.of(
                                                                    context)
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
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                        ),
                                                        ListTile(
                                                          title: const Text(
                                                              'Azad Kashmir'),
                                                          onTap: () {
                                                            dbclass.SetCityForSearchbar(
                                                                'Azad kashmir');
                                                            Navigator.of(
                                                                    context)
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
                                                            Navigator.of(
                                                                    context)
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
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ));
                                            });
                                      },
                                      child:

                                          // FutureBuilder(
                                          //   future: dbclass.getCity(),
                                          //   builder: (context, snapshot) {
                                          //     if (snapshot.hasData) {
                                          //       return Text(
                                          //           snapshot.data.toString());
                                          //     } else {
                                          //       return Text('Select City ?? ');
                                          //     }
                                          //   },
                                          // ),

                                          Consumer<DataBase>(
                                              builder: (context, value, child) {
                                        return Text(
                                            dbclass.initial_city.toString());
                                      }),
                                    )

                                    //              Consumer<DataBase>(
                                    //              builder: (context, value, child) {
                                    // return Text(dbclass.Cityname.toString(),style: TextStyle(
                                    //   fontWeight: FontWeight.bold
                                    // ),);}),
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
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 150,
                    child: Consumer<DataBase>(
                      builder: (context, value, child) {
                        return value.mapCategory.isEmpty && !value.errorCategory
                            ? const Center(child: CircularProgressIndicator())
                            : value.errorCategory
                                ? Text(
                                    'Oops, something went wrong .${value.errorMessageCategory}',
                                    textAlign: TextAlign.center,
                                  )
                                : ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount:
                                        value.mapCategory['categories'].length,
                                    itemBuilder: (context, index) {
                                      return TempCard1(
                                          map: value.mapCategory['categories']
                                              [index]);
                                    },
                                  );
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        'Popular',
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 150,
                    child: RefreshIndicator(
                      onRefresh: () async {},
                      child: Consumer<DataBase>(
                        builder: (context, value, child) {
                          return value.mapPopular.isEmpty && !value.errorPopular
                              ? const Center(child: CircularProgressIndicator())
                              : value.errorPopular
                                  ? Text(
                                      'Oops, something went wrong .${value.errorMessagePopular}',
                                      textAlign: TextAlign.center,
                                    )
                                  : ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount:
                                          value.mapPopular['popular'].length,
                                      itemBuilder: (context, index) {
                                        return TempCard(
                                            map: value.mapPopular['popular']
                                                [index]);
                                      },
                                    );
                        },
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        'Recommend for You',
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 350,
                    child: RefreshIndicator(
                      onRefresh: () async {},
                      child: Consumer<DataBase>(
                        builder: (context, value, child) {
                          return value.mapRecommendation.isEmpty &&
                                  !value.errorRecommendation
                              ? const Center(child: CircularProgressIndicator())
                              : value.errorRecommendation
                                  ? Text(
                                      'Oops, something went wrong .${value.errorMessageRecommendation}',
                                      textAlign: TextAlign.center,
                                    )
                                  : ListView.builder(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: value
                                          .mapRecommendation['service_search']
                                          .length,
                                      itemBuilder: (context, index) {
                                        return TempCard2(
                                            map: value.mapRecommendation[
                                                'service_search'][index]);
                                      },
                                    );
                        },
                      ),
                    ),
                  ),
                ])),
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
                          )));
            }
            if (i == 2) {
              print('Setting');
              {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingPage()));
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
        ));
  }
}

class Person {
  final String name, services;

  Person(
    this.name,
    this.services,
  );
}

class TempCard extends StatelessWidget {
  const TempCard({Key? key, required this.map}) : super(key: key);
  final Map<String, dynamic> map;

  @override
  Widget build(BuildContext context) {
    // var item = Icons.+map['icon'].toString();
    // var item = map['icon'].entries.elementAt(map['icon']);

    // print(item);

    return Container(
      width: 150,
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          // color: Color(int.parse(map['color'])),
          border: Border.all(color: Colors.black12)),
      child: Padding(
        padding: const EdgeInsets.only(top: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // FaIcon(FontAwesomeIcons.computer,size: 40.0,color: Colors.black),
            FaIcon(
              DynamicFaIcons.getIconFromName(map['icon']),
              size: 40.0,
              color: Color(int.parse(map['color'])),
            ),
            Text(map['title'], style: const TextStyle(color: Colors.black)),
          ],
        ),
      ),
    );
  }
}

class TempCard1 extends StatelessWidget {
  const TempCard1({Key? key, required this.map}) : super(key: key);
  final Map<String, dynamic> map;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(map['name'].toString());
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) =>
                detailpage3(curl: map['name'].toString()),
          ),
        );
      },
      child: Container(
        width: 150,
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
            border: Border.all(color: Colors.black12)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // FaIcon(FontAwesomeIcons.computer,size: 40.0,color: Colors.black),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: FaIcon(
                  DynamicFaIcons.getIconFromName(map['icon']),
                  size: 40.0,
                  color: Color(int.parse(map['color'])),
                ),
              ),
              Expanded(
                  child: Center(
                      child: Text(map['title'],
                          style: const TextStyle(color: Colors.black)))),
            ],
          ),
        ),
      ),
    );
  }
}

class TempCard2 extends StatelessWidget {
  const TempCard2({Key? key, required this.map}) : super(key: key);
  final Map<String, dynamic> map;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return DetailPage2(map: map);
            },
          ),
        );
      },
      child: SizedBox(
        width: 300,
        height: 300,
        child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Column(
            children: [
              SizedBox(
                width: 335,
                height: 200,
                child: Image.network(
                  map['image'],
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    map['name'],
                    style: GoogleFonts.ubuntu(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [Text(map['speciality'])],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: Colors.black,
                    ),
                    Text(map['city'])
                  ],
                ),
              )
            ],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 5,
          margin: const EdgeInsets.all(10),
        ),
      ),
    );
  }
}
