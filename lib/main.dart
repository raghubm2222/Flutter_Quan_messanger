import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'Constants.dart';

void main() {
  runApp(QuanMessages());
}

class QuanMessages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Roboto'),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

List<Widget> widgets = messagesList
    .map(
      (messagesList) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(messagesList.profilepic),
              radius: 30,
            ),
            Text(
              messagesList.name,
              style: TextStyle(
                fontSize: 15,
                wordSpacing: 1.5,
                color: Colors.white,
              ),
            ),
            IconButton(
                icon: Icon(
                  Icons.phone,
                  color: Colors.blue,
                ),
                onPressed: () {
                  _launchURL();
                })
          ],
        ),
      ),
    )
    .toList();
_launchURL() async {
  try {
    await launch("+919108276851");
  } catch (e) {
    print(e);
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(50)),
          width: 200,
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FaIcon(
                FontAwesomeIcons.facebookMessenger,
                color: Colors.white,
              ),
              FaIcon(
                FontAwesomeIcons.userAlt,
                color: Colors.white,
              ),
            ],
          ),
        ),
        backgroundColor: Color(0xff121212),
        body: Column(
          children: [
            Container(
              color: Colors.black,
              padding: EdgeInsets.only(top: 30, left: 10, right: 10),
              height: size.height * 0.3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Good Morning, Raghu',
                        style: TextStyle(color: Colors.white60),
                      ),
                      Text(
                        'Your messages',
                        style: TextStyle(
                          fontFamily: "Akaya",
                          fontSize: 35,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: Icon(
                      Icons.music_note_outlined,
                      color: Colors.white70,
                      size: 50,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Waiting for Messages',
                      style: TextStyle(
                        color: Colors.white70,
                        wordSpacing: 2.0,
                        fontSize: 16,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: widgets,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
