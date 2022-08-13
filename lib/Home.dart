import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mr_worker/Aut/Login.dart';
import 'package:mr_worker/Aut/Profilepage.dart';
import 'package:mr_worker/Aut/SettingPage.dart';
import 'package:mr_worker/Database.dart';
import 'package:mr_worker/Details/detailpage.dart';
import 'package:mr_worker/Details/widgets/Worker_Drawer.dart';
import 'package:mr_worker/Register.dart';
import 'package:mr_worker/home_widgets/bottomNav.dart';
import 'package:mr_worker/home_widgets/emergencyServices.dart';
import 'package:mr_worker/home_widgets/getHired.dart';
import 'package:mr_worker/home_widgets/rightProfileIcon.dart';
import 'package:provider/provider.dart';
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
        backgroundColor: const Color(0xffEBECED),
        title: const Padding(
          padding: EdgeInsets.only(left: 60),
          child: Text(
            'Mr.Worker',
            style: TextStyle(color: Colors.black),
          ),
        ),
        actions: const [
          RightProfileIcon(),
        ],
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Image.asset('assets/update.png',
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.contain),
                  ],
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.all(4),
              width: MediaQuery.of(context).size.width * 0.96,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                      color: Color(0xffd4d4d9),
                      spreadRadius: 0.5,
                      blurRadius: 5.0),
                ],
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(8.0),
                    bottomRight: Radius.circular(8.0)),
                border: Border.all(
                  color: Colors.black12,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.search),
                      SizedBox(
                        height: 50,
                        width: 200,
                        child: NetworkTypeAheadPage(),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Color(0xFFa51b1f),
                      ),
                      InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                    title: const Text('Select City'),
                                    content: SingleChildScrollView(
                                      child: ListBody(
                                        children: [
                                          ListTile(
                                            title: const Text('Get From Gps'),
                                            trailing:
                                                const Icon(Icons.gps_fixed),
                                            onTap: () {
                                              dbclass.getPermission();
                                              dbclass.getCityLocation();
                                              dbclass.SetCityForSearchbar(
                                                  dbclass.Cityname.toString());

                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          ListTile(
                                            title: const Text('Islamabad'),
                                            onTap: () {
                                              dbclass.SetCityForSearchbar(
                                                  'Islamabad');
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          ListTile(
                                            title: const Text('Lahore'),
                                            onTap: () {
                                              dbclass.SetCityForSearchbar(
                                                  'Lahore');
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          ListTile(
                                            title: const Text('Peshawar'),
                                            onTap: () {
                                              dbclass.SetCityForSearchbar(
                                                  'Peshawar');
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          ListTile(
                                            title: const Text('karachi'),
                                            onTap: () {
                                              dbclass.SetCityForSearchbar(
                                                  'karachi');
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          ListTile(
                                            title: const Text('Quetta'),
                                            onTap: () {
                                              dbclass.SetCityForSearchbar(
                                                  'Quetta');
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          ListTile(
                                            title: const Text('Azad Kashmir'),
                                            onTap: () {
                                              dbclass.SetCityForSearchbar(
                                                  'Azad kashmir');
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          ListTile(
                                            title: const Text('rawalpindi'),
                                            onTap: () {
                                              dbclass.SetCityForSearchbar(
                                                  'Rawalpindi');
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          ListTile(
                                            title: const Text('Abbotabad'),
                                            onTap: () {
                                              dbclass.SetCityForSearchbar(
                                                  'Abbotabad');
                                              Navigator.of(context).pop();
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
                              dbclass.initial_city.toString(),
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFFa51b1f)),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Home_Popular(),
            const SizedBox(
              height: 10,
            ),
            const Recommended(),
            const SizedBox(
              height: 10,
            ),
            const GetHired(),
            const SizedBox(
              height: 10,
            ),
            const EmergencyServices(),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNav(),
    );
  }
}
