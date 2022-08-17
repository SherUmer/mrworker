import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

import '../Database.dart';

class DetailPage2 extends StatelessWidget {
  DetailPage2({Key? key, required this.map}) : super(key: key);
  launchWhatsApp() async {
    final link = WhatsAppUnilink(
      phoneNumber: "+92" + map['whatsapp'],
      text:
          "Hey! I'm inquiring about the Services which you provid on Mr.Worker",
    );
// Convert the WhatsAppUnilink instance to a string.
// Use either Dart's string interpolation or the toString() method.
// The "launch" method is part of "url_launcher".
    await launch('$link');
  }

  Map<String, dynamic> map;
  @override
  Widget build(BuildContext context) {
    String tags = map['tags'];
    List<String> tlist = tags.split(",");
    var dbclass = context.read<DataBase>();
    dbclass.fetchProjects(map['id']);

    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xFFEBECED),
          foregroundColor: Colors.black),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 222, 218, 218),
              ),
              child: Column(
                children: [
                  Card(
                    child: ListTile(
                      leading: CachedNetworkImage(
                        imageUrl: map['image'],
                        imageBuilder: (context, imageProvider) => Container(
                          width: 50.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: imageProvider, fit: BoxFit.cover),
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
                      trailing: SizedBox(
                        width: 150,
                        child: Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(1.0),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                    Colors.white,
                                  ),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.green),
                                ),
                                onPressed: () {
                                  print('123');
                                },
                                child: const Padding(
                                  padding: EdgeInsets.all(3.0),
                                  child: Icon(FontAwesomeIcons.whatsapp),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 1.0,
                            ),
                            Container(
                              margin: const EdgeInsets.all(1.0),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                    Colors.white,
                                  ),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.blue),
                                ),
                                onPressed: () {
                                  print('123');
                                },
                                child: const Padding(
                                  padding: EdgeInsets.all(3.0),
                                  child: Icon(FontAwesomeIcons.phone),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      subtitle: Text(map['city']),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: tlist.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Text(
                                '#' + tlist[index].toString(),
                              ),
                            ),
                          );
                        }),
                  ),
                  Card(
                    margin: const EdgeInsets.all(3.0),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Name'),
                          Text(map['name'].toString())
                        ],
                      ),
                    ),
                  ),
                  Card(
                    margin: const EdgeInsets.all(3.0),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Phone'),
                          Text(map['Phone'].toString())
                        ],
                      ),
                    ),
                  ),
                  Card(
                    margin: const EdgeInsets.all(3.0),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('City'),
                          Text(map['city'].toString())
                        ],
                      ),
                    ),
                  ),
                  Card(
                    margin: const EdgeInsets.all(3.0),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: const [
                              Icon(Icons.location_on),
                              Text('Area'),
                            ],
                          ),
                          Text(
                            map['area'].toString(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    margin: const EdgeInsets.all(3.0),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Category'),
                          Text(map['speciality'].toString())
                        ],
                      ),
                    ),
                  ),
                  Card(
                    margin: const EdgeInsets.all(3.0),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Email'),
                          Text(map['email'].toString())
                        ],
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Container(
                  //     alignment: Alignment.topLeft,
                  //     child: Text(
                  //       map['name'].toString(),
                  //       style: const TextStyle(
                  //           fontSize: 15,
                  //           fontWeight: FontWeight.bold,
                  //           color: Colors.black),
                  //     ),
                  //   ),
                  // ),
                  Card(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: const Text(
                              'About',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              map['about'].toString(),
                              style: const TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Card(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: const Text(
                              'Projects',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Consumer<DataBase>(
                            builder: (context, value, child) {
                              return value.mapProjects.isEmpty &&
                                      !value.errorProjects
                                  ? const Center(
                                      child: CircularProgressIndicator(
                                        color: Colors.black12,
                                        backgroundColor: Colors.black12,
                                      ),
                                    )
                                  : value.errorProjects
                                      ? Text(
                                          'Oops, something went wrong .${value.errorMessageProjects}',
                                          textAlign: TextAlign.center,
                                        )
                                      : ListView.builder(
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: value
                                              .mapProjects['projects'].length,
                                          itemBuilder: (context, index) {
                                            var map = value
                                                .mapProjects['projects'][index];
                                            String primaryImage =
                                                map['primary_image'];

                                            return ListTile(
                                              onTap: () async {
                                                await showDialog(
                                                    context: context,
                                                    builder: (_) => imageDialog(
                                                        'Project Gallery',
                                                        primaryImage,
                                                        context));
                                              },
                                              leading: CachedNetworkImage(
                                                width: 70,
                                                height: 70,
                                                imageUrl: primaryImage,
                                                fit: BoxFit.cover,
                                              ),
                                              title:
                                                  Text(map['title'].toString()),
                                            );

                                            //
                                            // return InkWell(
                                            //   onTap: () {
                                            //     // print(
                                            //     //     map['name'].toString());
                                            //     // Navigator.of(context).push(
                                            //     //   MaterialPageRoute(
                                            //     //     builder: (BuildContext
                                            //     //     context) =>
                                            //     //         detailpage3(
                                            //     //             curl: map[
                                            //     //             'name']
                                            //     //                 .toString()),
                                            //     //   ),
                                            //     // );
                                            //   },
                                            //   child: Container(
                                            //     // width: 150,
                                            //     // margin: const EdgeInsets.all(4),
                                            //     margin:
                                            //         const EdgeInsets.only(
                                            //             right: 6.0,
                                            //             left: 4.0),
                                            //     // padding: const EdgeInsets.all(4),
                                            //     decoration: BoxDecoration(
                                            //         borderRadius:
                                            //             const BorderRadius
                                            //                 .only(
                                            //           topRight:
                                            //               Radius.circular(
                                            //                   8.0),
                                            //           bottomRight:
                                            //               Radius.circular(
                                            //                   8.0),
                                            //         ),
                                            //         color: Colors.white,
                                            //         boxShadow: const [
                                            //           BoxShadow(
                                            //               color: Color(
                                            //                   0xffd4d4d9),
                                            //               spreadRadius: 0.5,
                                            //               blurRadius: 2.0),
                                            //         ],
                                            //         border: Border.all(
                                            //             color: Colors
                                            //                 .black12)),
                                            //     child: Container(
                                            //       padding:
                                            //           const EdgeInsets.only(
                                            //               top: 5.0),
                                            //       child: Column(
                                            //         mainAxisAlignment:
                                            //             MainAxisAlignment
                                            //                 .start,
                                            //         children: [
                                            //           Padding(
                                            //             padding:
                                            //                 const EdgeInsets
                                            //                         .only(
                                            //                     top: 8.0,
                                            //                     bottom: 8.0,
                                            //                     left: 18.0,
                                            //                     right:
                                            //                         18.0),
                                            //             child:
                                            //                 CachedNetworkImage(
                                            //               imageUrl:
                                            //                   primary_image,
                                            //               height: 70,
                                            //               width: MediaQuery.of(
                                            //                           context)
                                            //                       .size
                                            //                       .width /
                                            //                   3,
                                            //               fit: BoxFit.cover,
                                            //             ),
                                            //           ),
                                            //         ],
                                            //       ),
                                            //     ),
                                            //   ),
                                            // );
                                            //
                                          },
                                        );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget imageDialog(text, path, context) {
  return Dialog(
    // backgroundColor: Colors.transparent,
    // elevation: 0,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$text',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.close_rounded),
                color: Theme.of(context).primaryColor,
              ),
            ],
          ),
        ),
        SizedBox(
          width: 220,
          height: 200,
          child: CachedNetworkImage(
            imageUrl: '$path',
            fit: BoxFit.cover,
          ),
        ),
      ],
    ),
  );
}
