
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mr_worker/Database.dart';
import 'package:mr_worker/Home.dart';
import 'package:provider/provider.dart';
class Register extends StatelessWidget {
  Register({Key? key}) : super(key: key);


  @override



    Widget build(BuildContext context) {

    Map<String, dynamic> map;
    String message;
    var dbclass = context.read<DataBase>();
    context.read<DataBase>().fetchCategory;




    var nameController = TextEditingController();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var PhoneNumberController = TextEditingController();
    var AboutController = TextEditingController();
    var facebookController =TextEditingController();
    var whatsappController = TextEditingController();
    var CategoryController =TextEditingController(text: dbclass.selectedvalue);
    var CityController = TextEditingController(text: dbclass.selectedCity);
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50),
              Container(
                alignment: Alignment.center,
                child: Text("Hello, Let's Get Started...",style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),),
              ),
              Container(
                alignment:Alignment.center ,
                child: CachedNetworkImage(imageUrl: 'https://bingo-agency.com/mrworker/img/slider%20copy.png',height: 150,)
              ),
              SizedBox(
                height: 50,
              ),
    InkWell(
      onTap: ()async{
        var pickedFile = await ImagePicker().pickImage(
          source: ImageSource.gallery);
        // var cropped =await ImageCropper().cropImage(sourcePath: pickedFile!.path,
        // aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),compressQuality: 100,
        // maxHeight: 70,
        // maxWidth: 100,
        // compressFormat: ImageCompressFormat.jpg);
        dbclass.setProfileImage(File(pickedFile!.path));
      },
      child:Consumer<DataBase>(builder: (context, value, child) {
        return value.Profilepicture != null
            ? Container(
          width: double.infinity,
          height: 200,
          child: CircleAvatar(
            child: ClipOval(
              child: Image.file(
            value.Profilepicture!,
            fit: BoxFit.cover,
                    width: 200,


          ),
                ),
        ),
            )
            : Stack(
          alignment: Alignment.center,
          children: [
            Container(
                width: double.infinity,
                height: 200,
                child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://cdn2.vectorstock.com/i/1000x1000/17/61/male-avatar-profile-picture-vector-10211761.jpg "
                    ))),
            Container(
              width: 100,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: Colors.black),


              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Edit', style: TextStyle(color: Colors.white),),
                    Icon(Icons.edit, color: Colors.white,)

                  ],
                ),
              ),
            )
          ],
        );
      }),),
              SizedBox(height: 20,),
              Container(
                alignment: Alignment.center,
                child: TextFormField(validator: (value){
                  if(value == null){
                    return 'Please Fill this Field,its Necessary';
                  }
                },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person_rounded),
                      hintText: 'What people Call You',
                      focusColor: Colors.lightBlue,
                      fillColor: Colors.black,
                      labelText: 'Name',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black12)
                    )


                  ),
                  keyboardType: TextInputType.name,
                  controller: nameController,


                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                child: TextFormField(
                  validator: (value){
                    if (value == null){
                      return 'Enter Your Email';
                    }
                  },
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.mail),

                      hintText: 'Enter Your Email Address',
                      focusColor: Colors.lightBlue,
                      fillColor: Colors.black,
                      labelText: 'Email',
                      border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black12)
                )
                  ),
                  keyboardType: TextInputType.name,
                  controller: emailController,


                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                child: TextFormField(
                  validator: (value){
                    if( value == null || value.length <7){
                      return 'Invalid Password';
                    }
                  },
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),

                      hintText: 'Set Your  Password',
                      focusColor: Colors.lightBlue,
                      fillColor: Colors.black,
                      labelText: 'Password',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black12)
                      )
                  ),
                  keyboardType: TextInputType.name,
                  controller: passwordController,


                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                child: TextFormField(
                  validator: (value){
                    if (value == null || value.length<11){
                      return 'Enter Corrent Phone Number';
                    }
                  },
                  decoration: InputDecoration(

                      prefixIcon: Icon(Icons.phone),
                      hintText: 'Enter Your PhoneNumber',
                      focusColor: Colors.lightBlue,
                      fillColor: Colors.black,
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black12)
                      )
                  ),
                  keyboardType: TextInputType.number,
                  controller: PhoneNumberController,


                ),
              ),
              SizedBox(height: 10,),
              Container(
                alignment: Alignment.center,
                child: TextFormField(
                  validator: (value){
                    if(value == null || value.length <11){
                      return 'Please Enter valid Phone Number';
                    }
                  },
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.whatsapp),
                      hintText: 'Enter Your Whatsapp Number',
                      focusColor: Colors.lightBlue,
                      fillColor: Colors.black,
                      labelText: 'Whatsapp Number',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black12)
                      )
                  ),
                  keyboardType: TextInputType.number,
                  controller: whatsappController,


                ),
              ),
              SizedBox(height: 10,),
              InkWell(onTap: (){
                showDialog(context: context, builder: (BuildContext context){
                  return AlertDialog(
                      title: Text('Select Categories'),
                      content: Consumer<DataBase>(
                          builder: (context, value, child) {
                            print('your value bring print hre !!! '+value.mapCategory.toString());
                            return value.mapCategory.isEmpty && !value.errorCategory
                                ? const Center(child: CircularProgressIndicator())
                                : value.errorCategory
                                ? Text(
                              'Oops, something went wrong .${value.errorMessageCategory}',
                              textAlign: TextAlign.center,
                            )
                                : Container(
                              height: 300,
                              width: 300,

                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: value.mapCategory['categories'].length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title: Text(value.mapCategory['categories'][index]['title']),
                                    onTap: (){

                                      dbclass.setCategory(value.mapCategory['categories'][index]['title']);
                                      Navigator.of(context).pop();
                                    },
                                  );},
                              ),
                            );


                          }));
                  // return AlertDialog(
                  //   title: Text('Select Services'),
                  //   content: SingleChildScrollView(
                  //
                  //     child: ListBody(
                  //       children: [
                  //         ListTile(
                  //           title:Text('electrican'),
                  //         ),
                  //         ListTile(
                  //           title:Text('electrican'),
                  //         ),
                  //         ListTile(
                  //           title:Text('electrican'),
                  //         )
                  //
                  //
                  //       ],
                  //
                  //     ),
                  //   ),
                  // );
                });
              },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(8)
                  ),
                    height: MediaQuery.of(context).size.height*0.1,
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Consumer<DataBase>(builder: (context, dbData, child) {
                          return Text(
                            dbData.selectedvalue.toString(),
                          );
                        }),
                          Icon(Icons.arrow_drop_down),
                        ],
                      ),
                    )
                ),
              ),
              SizedBox(height: 10,),
              InkWell(
                onTap: (){
                  showDialog(context: context, builder: (BuildContext context){
                    return AlertDialog(
                        title: Text('Select City'),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: [
                              ListTile(
                                title: Text('Islamabad'),
                                onTap: (){

                                  dbclass.setCity('Islamabad');
                                  Navigator.of(context).pop();
                                },
                              ),
                              ListTile(
                                title: Text('Lahore'),
                                onTap: (){

                                  dbclass.setCity('Lahore');
                                  Navigator.of(context).pop();
                                },
                              ),
                              ListTile(
                                title: Text('Peshawar'),
                                onTap: (){

                                  dbclass.setCity('Peshawar');
                                  Navigator.of(context).pop();
                                },
                              ),
                              ListTile(
                                title: Text('karachi'),
                                onTap: (){

                                  dbclass.setCity('Karachi');
                                  Navigator.of(context).pop();
                                },
                              ),
                              ListTile(
                                title: Text('Quetta'),
                                onTap: (){

                                  dbclass.setCity('Quetta');
                                  Navigator.of(context).pop();
                                },
                              ),
                              ListTile(
                                title: Text('Azad Kashmir'),
                                onTap: (){

                                  dbclass.setCity('Azad kashmir');
                                  Navigator.of(context).pop();
                                },
                              ),
                              ListTile(
                                title: Text('rawalpindi'),
                                onTap: (){

                                  dbclass.setCity('Rawalpindi');
                                  Navigator.of(context).pop();
                                },
                              ),







                            ],
                          ),
                        ));
                    // return AlertDialog(
                    //   title: Text('Select Services'),
                    //   content: SingleChildScrollView(
                    //
                    //     child: ListBody(
                    //       children: [
                    //         ListTile(
                    //           title:Text('electrican'),
                    //         ),
                    //         ListTile(
                    //           title:Text('electrican'),
                    //         ),
                    //         ListTile(
                    //           title:Text('electrican'),
                    //         )
                    //
                    //
                    //       ],
                    //
                    //     ),
                    //   ),
                    // );
                  });
                },
                child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(8)
                    ),
                    height: MediaQuery.of(context).size.height*0.1,
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Consumer<DataBase>(builder: (context, dbData, child) {
                          return Text(
                            dbData.selectedCity.toString(),
                          );
                        }),
                          Icon(Icons.arrow_drop_down),
                        ],
                      ),
                    )
                ),
              ),


              SizedBox(height: 10,),
              Container(
                alignment: Alignment.center,
                child: TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.facebook),
                      hintText: 'Enter Your Facebook Link',
                      focusColor: Colors.lightBlue,
                      fillColor: Colors.black,
                      labelText: 'Facebook link',
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black12)
                      )
                  ),
                  keyboardType: TextInputType.name
                  ,
                  controller: facebookController,


                ),
              ),
              SizedBox(height: 10,),



              TextField(
                maxLines: 5,
                controller: AboutController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 30),
                  hintText: 'Bio',
                  hintStyle: TextStyle(
                    height: 2.8,
                  ),
                  prefixIcon: Icon(Icons.chrome_reader_mode),
                  fillColor: Colors.grey[200],
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(),
                  ),
                ),
              ),

              Container(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  Home()));
                    var name = nameController.text.toString();
                    var email = emailController.text.toString();
                    var password = passwordController.text.toString();
                    var phone = PhoneNumberController.text.toString();
                    var Bio =AboutController.text.toString();
                    var speciality =CategoryController.text.toString();
                    var facebook =facebookController.text.toString();
                    var whatsapp = whatsappController.text.toString();
                    var city =CityController.text.toString();


                    await dbclass.uploadImage(name,email,password,phone,Bio,speciality,facebook,whatsapp,city);


                  },



                  child: Text('Register'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey
                  ),
                ),
              ),



            ],
          ),
        ),

      );
    }
  }


