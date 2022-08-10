import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class GetHired extends StatelessWidget {
  const GetHired({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 3,
                    child: CachedNetworkImage(
                        imageUrl:
                            'https://bingo-agency.com/mrworker/img/logo_extended.png'),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Become MrWorker and get yourself available to the largest Database of Pakistan.',
                      style: GoogleFonts.montserrat(),
                      softWrap: true,
                    ),
                  ),
                )
              ],
            ),
            ElevatedButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(
                  const Color(0xFFa51b1f),
                ),
              ),
              onPressed: () {
                print('Registration Page!');
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Register Today', style: GoogleFonts.montserrat()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
