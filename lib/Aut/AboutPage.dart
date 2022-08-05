
import 'package:flutter/material.dart';
class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white54,
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://bingo-agency.com/mrworker/img/about_handyman_services.jpeg')
              )
            ),
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('About',style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.bold),)
            ],
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('MrWorker is a web portal where you can find any type of Professional for your Services We also provide different type of services in different cities of Pakistan through our Certified Professionals',style: TextStyle(fontSize: 16),),
          )
        ],
      ),
    );
  }
}
