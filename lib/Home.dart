import 'package:flutter/material.dart';
import 'package:mr_worker/Database.dart';
import 'package:mr_worker/Details/widgets/Worker_Drawer.dart';
import 'package:mr_worker/home_widgets/bottomNav.dart';
import 'package:mr_worker/home_widgets/emergencyServices.dart';
import 'package:mr_worker/home_widgets/getHired.dart';
import 'package:mr_worker/home_widgets/rightProfileIcon.dart';
import 'package:mr_worker/home_widgets/searchCityBar.dart';
import 'package:mr_worker/home_widgets/topBanner.dart';
import 'package:provider/provider.dart';
import 'home_widgets/home_popular.dart';
import 'home_widgets/recommended.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<DataBase>().fetchPopular;
    context.read<DataBase>().fetchCategory;
    context.read<DataBase>().fetchRecommendation;
    context.read<DataBase>().getCity();
    context.read<DataBase>().checkAuth();

    var dbclass = context.read<DataBase>();

    return Scaffold(
      drawer: const Worker_Drawer(),
      appBar: AppBar(
        backgroundColor: const Color(0xffEBECED),
        title: const Padding(
          padding: EdgeInsets.only(left: 60),
          child: Text(
            'Mr.Worker',
            style: TextStyle(color: Colors.black),
          ),
        ),
        actions: const [
          RightProfileIcon(),
        ],
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            TopBanner(),
            SearchCityBar(),
            SizedBox(
              height: 10,
            ),
            Home_Popular(),
            SizedBox(
              height: 10,
            ),
            Recommended(),
            SizedBox(
              height: 10,
            ),
            GetHired(),
            SizedBox(
              height: 10,
            ),
            EmergencyServices(),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNav(),
    );
  }
}
