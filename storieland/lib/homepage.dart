import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:storieland/anthor.dart';
import 'package:url_launcher/url_launcher.dart';
import 'book_detail.dart';
import 'constants.dart';
import 'data.dart';

class Bookstore extends StatefulWidget {
  @override
  _BookstoreState createState() => _BookstoreState();
}

class _BookstoreState extends State<Bookstore> {
  late Filter selectedFilter;

  List<Book> books = getBookList();
  List<Author> authors = getAuthorList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // background
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/SL_123020_39360_14.jpg"),
          fit: BoxFit.cover,
        )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 48,
            ),
            Container(
              padding: EdgeInsets.only(top: 16, left: 16, right: 16),
              decoration: BoxDecoration(
                color: Color.fromARGB(0, 163, 101, 75),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(40),
                ),
              ),
              // title
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "StorieLand",
                    style: GoogleFonts.chicle(
                      color: Color.fromARGB(255, 26, 56, 112),
                      fontWeight: FontWeight.w900,
                      fontSize: 40,
                      height: 1,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 75),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                  ),
                ],
              ),
            ),
            // first list the big list stories
            Expanded(
              child: Container(
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: buildBooks(),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(0, 243, 238, 236),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Sleeping Stories",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 6, 7, 7),
                            shadows: [
                              Shadow(
                                color: Color.fromARGB(255, 155, 133, 133)
                                    .withOpacity(0.5),
                                offset: Offset(2, 2),
                                blurRadius: 4,
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 8,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // the second list the Authors
                  Container(
                    height: 100,
                    margin: EdgeInsets.only(bottom: 25),
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      children: buildAuthors(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 25,
        decoration: BoxDecoration(
          color: Color.fromARGB(0, 248, 248, 250),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                launch(
                    'https://doc-hosting.flycricket.io/storieland-privacy-policy/c066ef4d-3df8-4560-9d41-935662fe0bac/privacy');
              },
              child: Text(
                'Privacy Policy',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(width: 20),
            GestureDetector(
              onTap: () {
                launch(
                    'https://doc-hosting.flycricket.io/storieland-terms-conditions/9b8ede84-57e2-46d0-9dad-2e55f2e8d043/terms');
              },
              child: Text(
                'Terms & Conditions',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFilter(Filter item) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedFilter = item;
        });
      },
      child: Container(
        height: 50,
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                width: 30,
                height: 3,
                color:
                    selectedFilter == item ? kPrimaryColor : Colors.transparent,
              ),
            ),
            Center(
              child: Text(
                item.name,
                style: GoogleFonts.catamaran(
                  color:
                      selectedFilter == item ? kPrimaryColor : Colors.grey[400],
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 3,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

// click in the list first going the book detail
  List<Widget> buildBooks() {
    List<Widget> list = [];
    for (var i = 0; i < books.length; i++) {
      list.add(buildBook(books[i], i));
    }
    return list;
  }

  Widget buildBook(Book book, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BookDetail(book: book)),
        );
      },
      child: Container(
        margin:
            EdgeInsets.only(right: 32, left: index == 0 ? 16 : 0, bottom: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                      spreadRadius: 15,
                      blurRadius: 20,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                margin: EdgeInsets.only(
                  bottom: 20,
                  top: 30,
                ),
                child: Hero(
                  tag: book.title,
                  child: Image.asset(
                    book.image,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
            Text(
              book.title,
              style: GoogleFonts.rubik(
                fontSize: 22,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

// click the second list go to the author stories
  List<Widget> buildAuthors() {
    List<Widget> list = [];
    for (var i = 0; i < authors.length; i++) {
      list.add(buildAuthor(context, authors[i], i));
    }
    return list;
  }

  Widget buildAuthor(BuildContext context, Author author, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Authordetail(author: author),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.only(right: 16, left: index == 0 ? 16 : 0),
        width: 255,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Card(
              elevation: 4,
              margin: EdgeInsets.all(0),
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: Container(
                width: 75,
                height: 75,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(author.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  author.fullname,
                  style: GoogleFonts.catamaran(
                    fontSize: 16,
                    color: Color.fromARGB(255, 5, 5, 5),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
