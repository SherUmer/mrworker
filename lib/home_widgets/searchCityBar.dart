import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../Database.dart';
import '../data/network_type.dart';

class SearchCityBar extends StatelessWidget {
  const SearchCityBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dbclass = context.read<DataBase>();
    return Container(
      margin: const EdgeInsets.all(4),
      width: MediaQuery.of(context).size.width * 0.96,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
              color: Color(0xffd4d4d9), spreadRadius: 0.5, blurRadius: 5.0),
        ],
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(8.0), bottomRight: Radius.circular(8.0)),
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
                                    trailing: const Icon(Icons.gps_fixed),
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
                                      dbclass.SetCityForSearchbar('Islamabad');
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  ListTile(
                                    title: const Text('Lahore'),
                                    onTap: () {
                                      dbclass.SetCityForSearchbar('Lahore');
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  ListTile(
                                    title: const Text('Peshawar'),
                                    onTap: () {
                                      dbclass.SetCityForSearchbar('Peshawar');
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  ListTile(
                                    title: const Text('karachi'),
                                    onTap: () {
                                      dbclass.SetCityForSearchbar('karachi');
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  ListTile(
                                    title: const Text('Quetta'),
                                    onTap: () {
                                      dbclass.SetCityForSearchbar('Quetta');
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
                                      dbclass.SetCityForSearchbar('Rawalpindi');
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  ListTile(
                                    title: const Text('Abbotabad'),
                                    onTap: () {
                                      dbclass.SetCityForSearchbar('Abbotabad');
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
    );
  }
}
