import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mr_worker/Database.dart';
import 'package:provider/provider.dart';

import '../Details/DetailPage2.dart';
import '../Details/DetailPage3.dart';
class categoryPage extends StatelessWidget {
  const categoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var db =context.read<DataBase>();
    context.read<DataBase>().ViewAll;
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white54,


      ),
      body: SingleChildScrollView(
        child: Consumer<DataBase>(
          builder: (context, value, child) {
            return value.mapViewmore.isEmpty && !value.errorViewmore
                ? const Center(
              child: CircularProgressIndicator(
                color: Colors.black12,
                backgroundColor: Colors.black12,
              ),
            )
                : value.errorViewmore
                ? Text(
              'Oops, something went wrong .${value.errorMessageViewmore}',
              textAlign: TextAlign.center,
            ): ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount:
              value.mapViewmore['view more'].length,
              itemBuilder: (context, index) {
                var map =
                value.mapViewmore['view more'][index];
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
      ),
    );
  }
}

// class Category_page extends StatelessWidget {
//   Map<String, dynamic> map;
//    Category_page({Key? key, required this.map}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 50,
//       child:Text(map['speciality'].toString())
//     );
//   }
// }
