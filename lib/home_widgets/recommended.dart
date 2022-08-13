import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mr_worker/home_widgets/categoryPage.dart';
import 'package:provider/provider.dart';

import '../Database.dart';
import '../Details/DetailPage2.dart';

class Recommended extends StatelessWidget {
  const Recommended({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Top Recommendations',
                style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold),
              ),
              InkWell(
                onTap: () {
                  print('List of All Registered Workers.');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const categoryPage(

                        )),);
                },
                child: Text(
                  'View All',
                  style: GoogleFonts.montserrat(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFFa51b1f)),
                ),
              )
            ],
          ),
        ),
        Consumer<DataBase>(
          builder: (context, value, child) {
            return value.mapRecommendation.isEmpty && !value.errorRecommendation
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Colors.black12,
                      backgroundColor: Colors.black12,
                    ),
                  )
                : value.errorRecommendation
                    ? Text(
                        'Oops, something went wrong .${value.errorMessageRecommendation}',
                        textAlign: TextAlign.center,
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
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
                            child: Card(
                              child: ListTile(
                                leading: CachedNetworkImage(
                                  imageUrl: map['image'],
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    width: 50.0,
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  placeholder: (context, url) =>
                                      const CircularProgressIndicator(
                                    color: Colors.black12,
                                    backgroundColor: Colors.black12,
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                                title: Text(
                                  map['name'],
                                  style: GoogleFonts.ubuntu(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                trailing: Text(map['speciality']),
                                subtitle: Text(map['city']),
                              ),
                            ),
                            //
                            // SizedBox(
                            //   width: 300,
                            //   height: 300,
                            //   child: Card(
                            //     clipBehavior: Clip.antiAliasWithSaveLayer,
                            //     shape: RoundedRectangleBorder(
                            //       borderRadius: BorderRadius.circular(10.0),
                            //     ),
                            //     elevation: 5,
                            //     margin: const EdgeInsets.all(10),
                            //     child: Column(
                            //       children: [
                            //         SizedBox(
                            //           width: 335,
                            //           height: 200,
                            //           child: Image.network(
                            //             map['image'],
                            //             fit: BoxFit.cover,
                            //           ),
                            //         ),
                            //         Padding(
                            //           padding: const EdgeInsets.only(top: 8.0),
                            //           child: Container(
                            //             alignment: Alignment.center,
                            //             child: Text(
                            //               map['name'],
                            //               style: GoogleFonts.ubuntu(
                            //                   fontSize: 16.0,
                            //                   fontWeight: FontWeight.bold,
                            //                   color: Colors.black),
                            //             ),
                            //           ),
                            //         ),
                            //         Padding(
                            //           padding: const EdgeInsets.all(8.0),
                            //           child: Row(
                            //             children: [Text(map['speciality'])],
                            //           ),
                            //         ),
                            //         Padding(
                            //           padding: const EdgeInsets.all(8.0),
                            //           child: Row(
                            //             children: [
                            //               const Icon(
                            //                 Icons.location_on,
                            //                 color: Colors.black,
                            //               ),
                            //               Text(map['city'])
                            //             ],
                            //           ),
                            //         )
                            //       ],
                            //     ),
                            //   ),
                            // ),
                            //
                          );
                        },
                      );
          },
        ),
      ],
    );
  }
}
