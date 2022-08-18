import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mr_worker/Database.dart';
import 'package:provider/provider.dart';

class ProjectDetails extends StatelessWidget {
  const ProjectDetails({Key? key, required this.user_id}) : super(key: key);
  final String user_id;

  @override
  Widget build(BuildContext context) {
    var dbclass = context.read<DataBase>();
    dbclass.fetchProjects(user_id);
    return Scaffold(
      floatingActionButton: ElevatedButton(
        child: const Text('Add Projects'),
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          primary: Theme.of(context).primaryColor,
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      appBar: AppBar(
        title: const Text('Projects'),
        backgroundColor: const Color(0xFFEBECED),
        foregroundColor: Colors.black,
      ),
      body: Consumer<DataBase>(
        builder: (context, value, child) {
          return value.mapProjects.isEmpty && !value.errorProjects
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.black12,
                    backgroundColor: Colors.black12,
                  ),
                )
              : value.errorProjects
                  ? const Text(
                      'No Records found.',
                      textAlign: TextAlign.center,
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: value.mapProjects['projects'].length,
                      itemBuilder: (context, index) {
                        var map = value.mapProjects['projects'][index];
                        String primaryImage = map['primary_image'];

                        return Card(
                          child: ListTile(
                            onTap: () async {
                              await showDialog(
                                  context: context,
                                  builder: (_) => imageDialog(
                                      map['title'].toString(),
                                      map['project_images'],
                                      context));
                            },
                            leading: CachedNetworkImage(
                              width: 60,
                              height: 50,
                              imageUrl: primaryImage,
                              fit: BoxFit.cover,
                            ),
                            title: Text(map['title'].toString()),
                          ),
                        );
                      },
                    );
        },
      ),
    );
  }
}

Widget imageDialog(text, list, context) {
  final List<dynamic> finalList = list;
  print(finalList.toString());
  return Dialog(
    // backgroundColor: Colors.transparent,
    // elevation: 0,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$text',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.close_rounded),
                color: Theme.of(context).primaryColor,
              ),
            ],
          ),
        ),
        SizedBox(
            width: 220,
            height: 200,
            child: CarouselSlider.builder(
              itemCount: finalList.length,
              itemBuilder: (context, itemIndex, realIndex) {
                // return Text(itemIndex.toString());
                return CachedNetworkImage(
                  width: 220,
                  height: 200,
                  imageUrl: finalList[itemIndex]['image_link'],
                  fit: BoxFit.cover,
                );
              },
              options: CarouselOptions(
                autoPlay: true,
              ),
            )
            //here !

            ),
      ],
    ),
  );
}
