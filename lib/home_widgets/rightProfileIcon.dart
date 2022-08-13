import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Aut/Login.dart';
import '../Aut/Profilepage.dart';
import '../Database.dart';

class RightProfileIcon extends StatelessWidget {
  const RightProfileIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dbclass = context.read<DataBase>();
    return InkWell(
      onTap: () async {
        if (dbclass.id == "") {
          print('user cannot register yet');
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Mylogin()),
          );
        } else {
          var id = dbclass.id.toString();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => profilepage(
                id: id,
              ),
            ),
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: CircleAvatar(
          child: Consumer<DataBase>(
            builder: (context, value, child) {
              return value.Profilepicture != null
                  ? CircleAvatar(
                      child: ClipOval(
                        child: Image.file(
                          value.Profilepicture!,
                          fit: BoxFit.cover,
                          width: 50,
                        ),
                      ),
                    )
                  : CircleAvatar(
                      radius: 50,
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl:
                            "https://teamworkpk.com/img/avatardefault.png",
                      ),
                    );
            },
          ),
        ),
      ),
    );
  }
}
