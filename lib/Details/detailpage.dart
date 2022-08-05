import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mr_worker/Database.dart';
import 'package:mr_worker/Details/Detailpage1.dart';
import 'package:provider/provider.dart';
class detailpage extends StatelessWidget {
  final String curl;

  const detailpage({Key? key, required this.curl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var db = context.read<DataBase>();
    final String city;
    city = db.initial_city.toString();
    context.read<DataBase>().Search(curl, city);

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white54),
      body: 


         Consumer<DataBase>(
        builder: (context, value, child) {
      print('printing value');
      print(value.toString());
      return value.mapSearch.isEmpty && !value.errorSearch
          ? const Center(child: CircularProgressIndicator())
          : value.errorSearch
          ? Text(
        'Oops, something went wrong .${value.errorMessageSearch}',
        textAlign: TextAlign.center,
      ) : ListView.builder(
        shrinkWrap: true,
        itemCount: value.mapSearch['service_search'].length,
        itemBuilder: (context, index) {
          print('we are here !');
          return SearchCard(
              map: value.mapSearch['service_search']
              [index]);
        },
      );
    },
    )




    );


    }
}
class SearchCard extends StatelessWidget {
  const SearchCard({Key? key, required this.map}) : super(key: key);

  final Map<String, dynamic> map;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return DetailPage1(map: map);
            },
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: Stack(
          children: [
            Row(
              children: [
                Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(map['image']),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        map['city'],
                        style: GoogleFonts.ubuntu(
                            fontSize: 12.0,

                            color: Colors.black),
                      ),
                      SizedBox(height: 10,),
                      Text(
                        map['name'],
                        style: GoogleFonts.ubuntu(
                            fontSize: 16.0,

                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on_outlined,
                            color: Colors.black,
                          ),
                          Expanded(
                            child: Text(
                              map['area'],
                              maxLines: 1,
                              style: GoogleFonts.ubuntu(
                                  fontSize: 12.0,
                                  color:
                                  Colors.black),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text(
                  map['phone'] ,
                  style: GoogleFonts.ubuntu(
                      fontSize: 16.0,

                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}