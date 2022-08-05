import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mr_worker/Database.dart';
import 'package:provider/provider.dart';

import 'Aut/Profilepage.dart';
class User extends StatelessWidget {
  const User({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    var dbclass = context.read<DataBase>();

    return Scaffold(



      appBar: AppBar(


        title: const Text('Account',style: TextStyle(color: Colors.black),),backgroundColor: Colors.grey,



        actions: [
          InkWell(onTap: () async {
    // String id = await id;
    print("manage ads were tapped on id=" +
    dbclass.id.toString());
    Navigator.of(context).push(
    MaterialPageRoute(
    builder: (BuildContext context) =>
    profilepage(id: dbclass.id),
    ),
    );
    },
              child: Icon(Icons.settings))],

      ),
      body: Center(
    child:
      Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: FutureBuilder(
                future: dbclass.getImage(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    print('your printed data is : ');
                    print(snapshot.data);
                    return Container(
                      padding: const EdgeInsets.all(20.0),
                      child: CachedNetworkImage(
                        imageUrl: snapshot.data,
                        fit: BoxFit.fill,
                      ),
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              child: FutureBuilder(
                future: dbclass.getName(),
                initialData: const Text('Loading Name ... '),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  print(snapshot.data.toString() + 'is your data ');
                  if (snapshot.hasData) {
                    return Center(child: Text(snapshot.data.toString()));
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              child: FutureBuilder(
                future: dbclass.getEmail(),
                initialData: const Text('Loading Email ... '),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  // print(snapshot.data.toString() + 'is your data ');
                  if (snapshot.hasData) {
                    return Center(child: Text(snapshot.data.toString()));
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),

          ],
        ),
      ),    ));
  }
}
