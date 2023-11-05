import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:storieland/constants.dart';
import 'package:storieland/data.dart';

class Authordetail extends StatelessWidget {
  final Author author;

  Authordetail({required this.author});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: Hero(
              tag: author.fullname,
              child: Image.asset(author.image, fit: BoxFit.fitWidth),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 48,
              left: 32,
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  height: 42,
                  width: 42,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(0, 255, 255, 255),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.arrow_back,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: size.height * 0.6,
              padding: EdgeInsets.only(top: 64),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(
                        right: 32,
                        left: 32,
                        bottom: 16,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            author.fullname,
                            style: GoogleFonts.chicle(
                              fontSize: 30,
                              color: const Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.w500,
                              height: -0.5,
                              shadows: [
                                Shadow(
                                  color: Color.fromARGB(255, 2, 2, 2)
                                      .withOpacity(0.5),
                                  offset: Offset(2, 2),
                                  blurRadius: 2,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 12,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              physics: BouncingScrollPhysics(),
                              child: Text(
                                author.description,
                                style: GoogleFonts.catamaran(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.only(
                  left: 32, bottom: (size.height * 0.5) - (75 / 2)),
              child: Card(
                elevation: 4,
                margin: EdgeInsets.all(0),
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
