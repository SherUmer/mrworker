import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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

    return FutureBuilder(
        future: dbclass.checkAuth(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data == true) {
            return (snapshot.data == false)
                ? Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AuthScreen()),
                        );
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.grey,
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl:
                              "https://teamworkpk.com/img/avatardefault.png",
                        ),
                      ),
                    ),
                  )
                : CircleAvatar(
                    radius: 50.0,
                    child: CachedNetworkImage(
                      imageUrl: dbclass.image,
                      fit: BoxFit.cover,
                      width: 50,
                      height: 50,
                    ),
                  );

            // Consumer<DataBase>(builder: (context, value, child) {
            //         print('printing your image !');
            //         print(value.image);
            //
            //       });
          } else {
            return Container();
          }
        });

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
}
