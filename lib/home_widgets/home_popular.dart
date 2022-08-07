import 'package:dynamic_fa_icons/dynamic_fa_icons.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mr_worker/Database.dart';
import 'package:provider/provider.dart';

class Home_Popular extends StatelessWidget {
  const Home_Popular({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: RefreshIndicator(
        onRefresh: () async {},
        child: Consumer<DataBase>(
          builder: (context, value, child) {
            return value.mapPopular.isEmpty && !value.errorPopular
                ? const Center(child: CircularProgressIndicator())
                : value.errorPopular
                    ? Text(
                        'Oops, something went wrong .${value.errorMessagePopular}',
                        textAlign: TextAlign.center,
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: value.mapPopular['popular'].length,
                        itemBuilder: (context, index) {
                          var map = value.mapPopular['popular'][index];
                          return Container(
                            width: 150,
                            margin: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.white,
                                // color: Color(int.parse(map['color'])),
                                border: Border.all(color: Colors.black12)),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 32.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  // FaIcon(FontAwesomeIcons.computer,size: 40.0,color: Colors.black),
                                  FaIcon(
                                    DynamicFaIcons.getIconFromName(map['icon']),
                                    size: 40.0,
                                    color: Color(int.parse(map['color'])),
                                  ),
                                  Text(map['title'],
                                      style:
                                          const TextStyle(color: Colors.black)),
                                ],
                              ),
                            ),
                          );
                        },
                      );
          },
        ),
      ),
    );
  }
}
