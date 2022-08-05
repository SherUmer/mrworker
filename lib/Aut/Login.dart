import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mr_worker/Database.dart';
import 'package:mr_worker/Register.dart';
import 'package:mr_worker/Home.dart';
import 'package:provider/provider.dart';

class Mylogin extends StatelessWidget {
  const Mylogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Map<String, dynamic> map;
    String message;
    var dbclass = context.read<DataBase>();
    var PhoneController = TextEditingController();

    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return Scaffold(

      body:  Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 35.0),
              child: CachedNetworkImage(imageUrl: 'https://bingo-agency.com/mrworker/img/slider%20copy.png'),
            ),

            // Container(
            //   padding: EdgeInsets.only(left: 35, top: 130),
            //   child: Text(
            //     'Welcome\nBack',
            //     style: TextStyle(color: Colors.black38, fontSize: 33),
            //   ),
            // ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 35, right: 35),
                      child: Column(
                        children: [
                          TextField(
                            style: TextStyle(),

                            controller: PhoneController,
    keyboardType: TextInputType.number,

                            decoration: InputDecoration(

                              prefixIcon: Icon(Icons.call),
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: "Phone Number",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextField(
                            style: TextStyle(),
                            obscureText: true,
                            controller: passwordController,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock),
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: "Password",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Sign in',
                                style: TextStyle(
                                    fontSize: 27, fontWeight: FontWeight.w700),
                              ),
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Color(0xff4c505b),
                                child: IconButton(
                                    color: Colors.white,
                                    onPressed: () async {
                                      var phone = PhoneController.text.toString();
                                      var password = passwordController.text.toString();
                                      print(phone +'Printing email');
                                      print(password +'Printing password');
                                      //print
                                      var userclass = await dbclass.userLogin(phone, password);
                                      userclass;
                                      map = await dbclass.mapLogin;
                                      message = await dbclass.mapLogin['message'].toString();
                                      //checking map if its empty or shit
                                      if (map.isEmpty) {
                                        print('map is empty');
                                        await showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                            title: Text('Warning', style: GoogleFonts.ubuntu()),
                                            content: FutureBuilder(
                                              future: dbclass.userLogin(phone, password),
                                              builder: (context, snapshot) {
                                                if (snapshot.hasData) {
                                                  return Text(
                                                    snapshot.data.toString(),
                                                    softWrap: true,
                                                    style: GoogleFonts.ubuntu(
                                                        color: Theme.of(context).primaryColor,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 16.0),
                                                  );
                                                } else {
                                                  return const SizedBox(
                                                    height: 100,
                                                    child: Center(
                                                      child: CircularProgressIndicator(),
                                                    ),
                                                  );
                                                }
                                              },
                                            ),
                                            actions: <Widget>[
                                              FlatButton(
                                                onPressed: () {
                                                  Navigator.of(context, rootNavigator: true)
                                                      .pop(); // dismisses only the dialog and returns nothing
                                                },
                                                child: Text(
                                                  'Try again',
                                                  style: GoogleFonts.ubuntu(),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      } else {
                                        if (message.isNotEmpty && message == 'True') {
                                          //shared prefs !!!

                                          print('True');
                                          Navigator.of(context).pushReplacement(
                                              MaterialPageRoute(
                                                  builder: (BuildContext context) =>
                                                   Home()));
                                        } else if (message.isNotEmpty && message == 'False') {
                                          print('False');
                                          await showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                              title: Text(
                                                'Warning',
                                                style: GoogleFonts.ubuntu(),
                                              ),
                                              content: Text(
                                                'Invalid Credentials,Login Failed',
                                                style: GoogleFonts.ubuntu(),
                                              ),
                                              actions: <Widget>[
                                                FlatButton(
                                                  onPressed: () {
                                                    Navigator.of(context, rootNavigator: true)
                                                        .pop(); // dismisses only the dialog and returns nothing
                                                  },
                                                  child: Text(
                                                    'Try again',
                                                    style: GoogleFonts.ubuntu(),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        }
                                      }
                                      // print(emailController.text);
                                      // print(passwordController.text);
                                    },

                                    icon: Icon(
                                      Icons.arrow_forward,
                                    )),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {

                                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                                      builder: (BuildContext context) => Register()));                                },
                                child: Text(
                                  'Sign Up',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Color(0xff4c505b),
                                      fontSize: 18),
                                ),
                                style: ButtonStyle(),
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Forgot Password',
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Color(0xff4c505b),
                                      fontSize: 18,
                                    ),
                                  )),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),);


  }
}
