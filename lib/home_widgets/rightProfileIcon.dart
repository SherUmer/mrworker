import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mr_worker/Details/DetailPage2.dart';
import 'package:mr_worker/Details/projectDetails.dart';
import 'package:provider/provider.dart';
import '../Aut/Profilepage.dart';
import '../Database.dart';
import '../authScreen.dart';

class RightProfileIcon extends StatelessWidget {
  const RightProfileIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<DataBase>().checkAuth();
    var dbclass = context.read<DataBase>();

    if (dbclass.isLoggedIn == true) {
      print('you are logged in');
    } else {
      print('false');
    }

    return Consumer<DataBase>(builder: (context, val, child) {
      print(val.isLoggedIn);
      if (val.isLoggedIn == false) {
        return Padding(
          padding: const EdgeInsets.all(1.0),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AuthScreen()),
              );
            },
            child: CircleAvatar(
              radius: 50.0,
              backgroundColor: Colors.black12,
              child: ClipOval(
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: "https://teamworkpk.com/img/avatardefault.png",
                  width: 50,
                  height: 50,
                ),
              ),
            ),
          ),
        );
      } else {
        return CircleAvatar(
          radius: 50.0,
          backgroundColor: Colors.black12,
          child: InkWell(
            onTap: () async {
              var id = dbclass.id.toString();
              print(id);
              showDialog<void>(
                barrierDismissible: true,
                context: context,
                builder: (BuildContext context) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 50, right: 50),
                        child: Container(
                          padding: const EdgeInsets.all(3.0),
                          width: MediaQuery.of(context).size.width / 3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(color: Colors.black12, spreadRadius: 2),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () async {
                                  await dbclass.UserDetail(dbclass.id);
                                  Map<String, dynamic> userMap =
                                      dbclass.mapUserDetail['user_detail'][0];
                                  print(' Profile Page');
                                  Navigator.of(context).pop();
                                  print(userMap);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailPage2(
                                        map: userMap,
                                      ),
                                    ),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Icon(FontAwesomeIcons.user,
                                          size: 16.0,
                                          color:
                                              Theme.of(context).primaryColor),
                                      Text(
                                        'Profile',
                                        style: GoogleFonts.montserrat(
                                            color: Colors.black,
                                            fontSize: 16.0),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  var id = dbclass.id.toString();
                                  Navigator.of(context).pop();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => profilepage(
                                        id: id,
                                      ),
                                    ),
                                  );
                                  print(' Profile Page');
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Icon(FontAwesomeIcons.edit,
                                          size: 16.0,
                                          color:
                                              Theme.of(context).primaryColor),
                                      Text(
                                        'Edit Profile',
                                        style: GoogleFonts.montserrat(
                                            color: Colors.black,
                                            fontSize: 16.0),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  var id = dbclass.id.toString();
                                  print(' Projects');
                                  Navigator.of(context).pop();
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ProjectDetails(user_id: id),
                                    ),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Icon(FontAwesomeIcons.image,
                                          size: 16.0,
                                          color:
                                              Theme.of(context).primaryColor),
                                      Text(
                                        'Projects',
                                        style: GoogleFonts.montserrat(
                                            color: Colors.black,
                                            fontSize: 16.0),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const Divider(),
                              GestureDetector(
                                onTap: () {
                                  dbclass.removeUser();
                                  dbclass.logOut();
                                  Navigator.of(context).pop();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Icon(FontAwesomeIcons.lock,
                                          size: 16.0,
                                          color:
                                              Theme.of(context).primaryColor),
                                      Text(
                                        ' Logout',
                                        style: GoogleFonts.montserrat(
                                            color: Colors.black,
                                            fontSize: 16.0),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  );
                },
              );
            },
            child: ClipOval(
              child: CachedNetworkImage(
                imageUrl: dbclass.image,
                fit: BoxFit.cover,
                width: 50,
                height: 50,
              ),
            ),
          ),
        );
      }
    });

    // return FutureBuilder(
    //     future: dbclass.checkAuth(),
    //     builder: (context, snapshot) {
    //       if (snapshot.hasData && snapshot.data == true) {
    //         return (snapshot.data == false)
    //             ? Padding(
    //                 padding: const EdgeInsets.all(10.0),
    //                 child: InkWell(
    //                   onTap: () {
    //                     Navigator.push(
    //                       context,
    //                       MaterialPageRoute(
    //                           builder: (context) => const AuthScreen()),
    //                     );
    //                   },
    //                   child: CircleAvatar(
    //                     backgroundColor: Colors.grey,
    //                     child: CachedNetworkImage(
    //                       fit: BoxFit.cover,
    //                       imageUrl:
    //                           "https://teamworkpk.com/img/avatardefault.png",
    //                     ),
    //                   ),
    //                 ),
    //               )
    //             : CircleAvatar(
    //                 radius: 50.0,
    //                 child: ClipOval(
    //                   child: CachedNetworkImage(
    //                     imageUrl: dbclass.image,
    //                     fit: BoxFit.cover,
    //                     width: 50,
    //                     height: 50,
    //                   ),
    //                 ),
    //               );
    //
    //         // Consumer<DataBase>(builder: (context, value, child) {
    //         //         print('printing your image !');
    //         //         print(value.image);
    //         //
    //         //       });
    //       } else {
    //         return Container();
    //       }
    //     });

    //
    //
    // return InkWell(
    //   onTap: () async {
    //     if (dbclass.isLoggedIn == false) {
    //       print('user cannot register yet');
    //       Navigator.push(
    //         context,
    //         MaterialPageRoute(builder: (context) => const AuthScreen()),
    //       );
    //     } else {
    //       var id = dbclass.id.toString();
    //       Navigator.push(
    //         context,
    //         MaterialPageRoute(
    //           builder: (context) => profilepage(
    //             id: id,
    //           ),
    //         ),
    //       );
    //     }
    //   },
    //   child: Padding(
    //     padding: const EdgeInsets.only(right: 8.0),
    //     child: CircleAvatar(
    //       child: Consumer<DataBase>(
    //         builder: (context, value, child) {
    //           return value.Profilepicture != null
    //               ? CircleAvatar(
    //                   child: ClipOval(
    //                     child: Image.file(
    //                       value.Profilepicture!,
    //                       fit: BoxFit.cover,
    //                       width: 50,
    //                     ),
    //                   ),
    //                 )
    //               : CircleAvatar(
    //                   radius: 50,
    //                   child: CachedNetworkImage(
    //                     fit: BoxFit.cover,
    //                     imageUrl:
    //                         "https://teamworkpk.com/img/avatardefault.png",
    //                   ),
    //                 );
    //         },
    //       ),
    //     ),
    //   ),
    // );
  }

  Widget popUpBox(text, context) {
    // final List<dynamic> finalList = list;
    // print(finalList.toString());
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
            child: Container(
              child: Center(
                child: Text('123'),
              ),
            ),
            //here !
          ),
        ],
      ),
    );
  }
}
