import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/widget/search_widget.dart';
import 'package:flutter_application_2/model/hero_hr.dart';
import 'package:flutter_application_2/Pages/all_heros_page.dart';
import 'package:flutter_application_2/data/hero_data.dart';
import 'package:flutter_application_2/main.dart';
import 'dart:convert';
import 'package:flutter_application_2/flutter_rating_bar/lib/rating_bar.dart';

class HeroProfilePage extends StatefulWidget {
  HeroProfilePage(this.hero);

  final HeroHr hero;
  @override
  _HeroProfilePageState createState() => _HeroProfilePageState();
}

class _HeroProfilePageState extends State<HeroProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              height: 180,
              decoration: BoxDecoration(color: Colors.grey[300]),
              child: Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Center(
                    child: Image.memory(
                      base64Decode(widget.hero.urlImage),
                      fit: BoxFit.cover,
                      width: 50,
                      height: 50,
                    ),
                  ),
                  Align(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    alignment: Alignment.topLeft,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(shrinkWrap: true, children: <Widget>[
                ListTile(
                  title: Text("Hero Name"),
                  subtitle: Text(widget.hero.name),
                ),
                ListTile(
                  title: Text("Description"),
                  subtitle: Text(widget.hero.description),
                ),
                ListTile(
                  title: Text("Powers"),
                  subtitle: Text(widget.hero.powers),
                ),
                RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    //hero.toJson()
                    // print(widget.hero.toJson('rate'));

                    //
                  },
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
