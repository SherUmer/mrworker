// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:whatsapp_unilink/whatsapp_unilink.dart';
//
// class Filterdetailpage extends StatelessWidget {
//   const Filterdetailpage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: const Color(0xFFEBECED),
//           foregroundColor: Colors.black,
//           title: const Text('Account Details'),
//         ),
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             ClipOval(
//               child: CachedNetworkImage(
//                 imageUrl:
//                     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcThLKOwJf6YWKVyYIJg9z-Tuk4xeZz9Rus7qg&usqp=CAU',
//                 width: 300,
//                 height: 270,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             Container(
//               alignment: Alignment.center,
//               child: const Text(
//                 'Hassan Baiga',
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
//               ),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             const Text(
//               'Account Details',
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Table(
//                 defaultColumnWidth: const IntrinsicColumnWidth(),
//                 border: TableBorder.all(color: Colors.black),
//                 children: const [
//                   TableRow(children: [
//                     Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: Text(
//                         'Name',
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: Text('Khurshid'),
//                     ),
//                   ]),
//                   TableRow(children: [
//                     Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: Text(
//                         'Email',
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: Text('deshdrama@gmail.com'),
//                     ),
//                   ]),
//                   TableRow(children: [
//                     Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: Text(
//                         'City',
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: Text('Islamabad'),
//                     ),
//                   ]),
//                   TableRow(children: [
//                     Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: Text(
//                         'Area',
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: Text('G-12,G-13'),
//                     ),
//                   ]),
//                   TableRow(children: [
//                     Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: Text(
//                         'Category',
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: Text('Developer'),
//                     ),
//                   ]),
//                   TableRow(children: [
//                     Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: Text(
//                         'Speciality',
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: Text('App Developer'),
//                     ),
//                   ]),
//                   TableRow(children: [
//                     Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: Text(
//                         'About',
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: Text(
//                           'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.'),
//                     ),
//                   ]),
//                 ],
//               ),
//             ),
//             Container(
//               height: 70,
//               width: MediaQuery.of(context).size.width,
//               decoration: BoxDecoration(
//                 color: Colors.grey.shade300,
//                 border: Border.all(color: Colors.black),
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   const Padding(
//                     padding: EdgeInsets.only(left: 18),
//                     child:
//                         FaIcon(FontAwesomeIcons.facebook, color: Colors.blue),
//                   ),
//                   const VerticalDivider(),
//                   InkWell(
//                       onTap: () {
//                         launchWhatsApp();
//                       },
//                       child: const FaIcon(
//                         FontAwesomeIcons.whatsapp,
//                         color: Colors.green,
//                       )),
//                   const VerticalDivider(),
//                   Padding(
//                     padding: const EdgeInsets.only(right: 18.0),
//                     child: GestureDetector(
//                         onTap: _callNumber,
//                         child: const FaIcon(
//                           FontAwesomeIcons.phone,
//                           color: Colors.blueAccent,
//                         )),
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// _callNumber() async {
//   const number = '03126550536'; //set the number here
//   bool? res = await FlutterPhoneDirectCaller.callNumber(number);
// }
//
// launchWhatsApp() async {
//   const link = WhatsAppUnilink(
//     phoneNumber: '+923126550536',
//     text: "Hey! I'm inquiring about the Service which You Provide",
//   );
//   await launch('$link');
// }
