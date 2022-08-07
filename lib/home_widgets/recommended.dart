import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../Database.dart';
import '../Details/DetailPage2.dart';

class Recommended extends StatelessWidget {
  const Recommended({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: RefreshIndicator(
        onRefresh: () async {},
        child: Consumer<DataBase>(
          builder: (context, value, child) {
            return value.mapRecommendation.isEmpty && !value.errorRecommendation
                ? const Center(child: CircularProgressIndicator())
                : value.errorRecommendation
                    ? Text(
                        'Oops, something went wrong .${value.errorMessageRecommendation}',
                        textAlign: TextAlign.center,
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            value.mapRecommendation['service_search'].length,
                        itemBuilder: (context, index) {
                          var map =
                              value.mapRecommendation['service_search'][index];
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
                        },
                      );
          },
        ),
      ),
    );
  }
}
