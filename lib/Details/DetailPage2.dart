import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

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

    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xFFEBECED),
          foregroundColor: Colors.black),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
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
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: const Text(
                              'There are no Projects added yet!',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  //
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Row(
                  //     children: [
                  //       Padding(
                  //         padding: const EdgeInsets.only(left: 20.0),
                  //         child: ElevatedButton(
                  //           style: ElevatedButton.styleFrom(
                  //             primary: Colors.grey,
                  //             elevation: 5.0,
                  //           ),
                  //           onPressed: () => launch("tel:" + map['phone']),
                  //           child: Row(
                  //             children: const [
                  //               FaIcon(
                  //                 FontAwesomeIcons.phone,
                  //                 color: Colors.blue,
                  //               ),
                  //               Text(
                  //                 'Call Now',
                  //                 style: TextStyle(
                  //                   fontWeight: FontWeight.bold,
                  //                   color: Colors.black,
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //       ),
                  //       Padding(
                  //         padding: const EdgeInsets.only(left: 40.0),
                  //         child: ElevatedButton(
                  //           style: ElevatedButton.styleFrom(
                  //             primary: Colors.grey,
                  //             elevation: 5.0,
                  //           ),
                  //           onPressed: () async {
                  //             await launchWhatsApp();
                  //           },
                  //           child: Row(
                  //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //             children: const [
                  //               FaIcon(
                  //                 FontAwesomeIcons.whatsapp,
                  //                 color: Colors.green,
                  //               ),
                  //               Text(
                  //                 'Whatsapp Now',
                  //                 style: TextStyle(
                  //                   fontWeight: FontWeight.bold,
                  //                   color: Colors.black,
                  //                 ),
                  //               )
                  //             ],
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  //
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
