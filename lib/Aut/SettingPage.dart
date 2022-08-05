import 'package:flutter/material.dart';
import 'package:mr_worker/Aut/Profilepage.dart';
import 'package:mr_worker/Database.dart';
import 'package:provider/provider.dart';
class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dbclass = context.read<DataBase>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white54,
        title: Text('Settings',style: TextStyle(fontWeight: FontWeight.bold),
        ),


      ),
      body:ListView(scrollDirection: Axis.vertical,
        children: [
          ListTile(
            onTap: (){
              dbclass.id.toString();
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => profilepage(id: dbclass.id)));

            },
            title: Text('Update Account'),
            leading: Icon(Icons.person),
            subtitle: Text('view or edit Account'),
          ),
          Divider(),
          ListTile(
            title: Text('Change Password'),
            leading: Icon(Icons.key),
            subtitle: Text('Update your password'),
          ),
          Divider(),
          ListTile(
            title: Text('Logout'),
            leading: Icon(Icons.logout),

          ),


        ],
      )



      // Column(
      //   mainAxisAlignment: MainAxisAlignment.start,
      //   children: [
      //     Container(
      //       height:100,
      //       width: MediaQuery.of(context).size.width,
      //       decoration: BoxDecoration(
      //         border: Border.all(color: Colors.black)
      //
      //       ),
      //       child: Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: InkWell(
      //           onTap: (){
      //
      //           },
      //           child: Row(
      //             mainAxisAlignment: MainAxisAlignment.start,
      //             children: [
      //               CircleAvatar(backgroundColor: Colors.grey,
      //                 child:Icon( Icons.person,color: Colors.white,)
      //               ),
      //               VerticalDivider(),
      //               Padding(
      //                 padding: const EdgeInsets.only(left: 20.0),
      //                 child: Text('Update Account',style: TextStyle(fontWeight: FontWeight.bold),),
      //               )
      //             ],
      //           ),
      //         ),
      //       ),
      //     ),
      //     SizedBox(height: 20,),
      //     Container(
      //       height:100,
      //       width: MediaQuery.of(context).size.width,
      //       decoration: BoxDecoration(
      //           border: Border.all(color: Colors.black)
      //
      //       ),
      //       child: Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.start,
      //           children: [
      //             CircleAvatar(backgroundColor: Colors.grey,
      //                 child:Icon( Icons.key,color: Colors.white,)
      //             ),
      //             VerticalDivider(),
      //             Padding(
      //               padding: const EdgeInsets.only(left: 20.0),
      //               child: Text('Change Password',style: TextStyle(fontWeight: FontWeight.bold),),
      //             )
      //           ],
      //         ),
      //       ),
      //     ),
      //     SizedBox(height: 20,),
      //     Container(
      //       height:100,
      //       width: MediaQuery.of(context).size.width,
      //       decoration: BoxDecoration(
      //           border: Border.all(color: Colors.black)
      //
      //       ),
      //       child: Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.start,
      //           children: [
      //             CircleAvatar(backgroundColor: Colors.grey,
      //                 child:Icon( Icons.logout,color: Colors.white,)
      //             ),
      //             VerticalDivider(),
      //             Padding(
      //               padding: const EdgeInsets.only(left: 20.0),
      //               child: Text('Logout',style: TextStyle(fontWeight: FontWeight.bold),),
      //             )
      //           ],
      //         ),
      //       ),
      //     )
      //
      //
      //   ],
      // ),

    );
  }
}
