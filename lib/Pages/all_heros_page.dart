import 'package:flutter/material.dart';
import 'package:flutter_application_2/data/hero_data.dart';
import 'package:flutter_application_2/widget/search_widget.dart';
import 'package:flutter_application_2/model/hero_hr.dart';
import 'package:flutter_application_2/main.dart';
import 'package:flutter_application_2/Pages/hero_profile_page.dart';
import 'package:flutter_application_2/flutter_rating_bar/lib/rating_bar.dart';
import 'dart:convert';

class AllHerosPage extends StatefulWidget {
  @override
  AllHerosPageState createState() => AllHerosPageState();
}

class AllHerosPageState extends State<AllHerosPage>  with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late List<HeroHr> heros;
  String query = '';
  bool isSwitched = false;

  bool isFiltered = false;

  @override
  void initState() {
    super.initState();

    heros = listOfHeros;
    if (isSwitched) {
      heros.sort((a, b) => a.powers.compareTo(b.powers));
    } else {
      heros.sort((a, b) => a.name.compareTo(b.name));
    }

    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      value: 1.0,
      vsync: this,
    );

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

    bool get _status {
    final AnimationStatus status = _controller.status;
    return status == AnimationStatus.completed ||
        status == AnimationStatus.forward;
  }


  @override
  Widget build(BuildContext context) => 
    Scaffold(
      appBar: AppBar(
        title: Text(
          MyApp.title,
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'serif',
              fontWeight: FontWeight.bold,
              fontSize: 40),
        ),
        actions: <Widget>[
          getAnimatedIcon(AnimatedIcons.ellipsis_search),
        ],
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          isFiltered ? Visibility(child: buildSearch(),visible: true,) : Visibility(child: buildSearch(),visible: false,),
          isFiltered ? Visibility(child: buildToggle(isSwitched),visible: true,) : Visibility(child: buildToggle(isSwitched),visible: false,),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,

              //=========
              //in case we use data table we need to change item count to 1 since we are going to include all list once
              //=========
              // itemCount: 1,
              itemCount: heros.length,
              itemBuilder: (context, index) {
                final hero = heros[index];
                return Card(
                  elevation: 6,
                  margin: EdgeInsets.all(10),
                  shadowColor: Colors.lightGreen,
                  child:
              //=========
              //in case we you want to see the rating comment out the list tile 
              //=========
                    ListTile(
                      onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => HeroProfilePage(
                                hero,
                              )));
                      },
                      title: Text(hero.name),
                      subtitle: Text(hero.powers),
                      isThreeLine: true,
                      leading: 
                      Image.memory(
                        base64Decode(hero.urlImage),
                        fit: BoxFit.cover,
                        width: 50,
                        height: 50,
                      ),
                    ),
                  
                  //========
                  //i tried to fit the rating in here but I couldn't 
                  //=======
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: DataTable(

                  //   columns:

                  //    <DataColumn>[
                  //     DataColumn(
                  //       label: Text("Hero Name"),
                  //       numeric: false,
                  //       onSort: (i, b) {
                  //         print("$i $b");
                  //         setState(() {
                  //           heros.sort((a, b) => a.name.compareTo(b.name));
                  //         });
                  //       },
                        
                  //     ),
                  //     DataColumn(
                  //       label: Text("Powers"),
                  //       numeric: false,
                  //     ),
                  //     DataColumn(
                  //       label: Text("Rating"),
                  //       numeric: false,
                  //     ),
                  //   ],
                  //   rows: heros
                  //       .map(
                  //         (hero) => DataRow(
                  //           cells: [
                  //             DataCell(
                  //               Flexible(

                  //                 child:
                  //                 Text(hero.name),

                  //               ),

                  //               showEditIcon: false,
                  //               placeholder: false,
                  //               onTap: () {
                  //                 Navigator.of(context).push(
                  //                     MaterialPageRoute(
                  //                         builder: (BuildContext context) =>
                  //                             HeroProfilePage(
                  //                               hero,
                  //                             )));
                  //               },
                  //             ),
                  //             DataCell(
                  //               Flexible(
                  //                 child:
                  //                  Text(hero.powers),
                  //               ),

                  //               showEditIcon: false,
                  //               placeholder: false,
                  //               onTap: () {
                  //                 Navigator.of(context).push(
                  //                     MaterialPageRoute(
                  //                         builder: (BuildContext context) =>
                  //                             HeroProfilePage(
                  //                               hero,
                  //                             )));
                  //               },
                  //             ),

                  //             DataCell(
                  //               Flexible(

                  //                 child:

                  //               RatingBar.builder(
                  //               initialRating: 3,
                  //               minRating: 1,
                  //               direction: Axis.horizontal,
                  //               allowHalfRating: true,
                  //               itemCount: 5,
                  //               itemPadding:
                  //                   EdgeInsets.symmetric(horizontal: 4.0),
                  //               itemBuilder: (context, _) => Icon(
                  //                 Icons.star,
                  //                 color: Colors.amber,
                  //               ),
                  //               onRatingUpdate: (rating) {
                  //                 //hero.toJson()
                  //               },
                  //             ) ,)

                  //             ),

                  //           ],
                  //         ),
                  //       )
                  //       .toList(),
                  // ),
                  // )
                      
                );
              },
            ),
          ),
        ],
      ),
    );

  Widget buildSearch() => SearchWidget(
      text: query,
      hintText: 'Search',
      onChanged: searchHero,
      );

  Widget buildToggle(bool iSwitched) => SwitchListTile(
        title: Text("Sort By Power"),
        value: isSwitched,
        onChanged: (value) {
          setState(() {
            isSwitched = value;
            if (isSwitched) {
              this.heros.sort((a, b) => a.powers.compareTo(b.powers));
            } else {
              this.heros.sort((a, b) => a.name.compareTo(b.name));
            }
          });
        },
        activeTrackColor: Colors.lightGreenAccent,
        activeColor: Colors.green,
      );

  void searchHero(String query) {
    final heros = listOfHeros.where((hero) {
      final heroLower = hero.name.toLowerCase();
      final powersLower = hero.powers.toLowerCase();
      final searchLower = query.toLowerCase();

      return heroLower.contains(searchLower) ||
          powersLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.heros = heros;
      if (isSwitched) {
        this.heros.sort((a, b) => a.powers.compareTo(b.powers));
      } else {
        this.heros.sort((a, b) => a.name.compareTo(b.name));
      }
    });
  }

  void _changed(bool visibility) {
    setState(() {
      isFiltered = visibility;
    });
  }

  Widget getAnimatedIcon(AnimatedIconData iconData) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        child: Row(
          children: <Widget>[
            IconButton(
              onPressed: () {
                _controller.fling(velocity: _status ? -2.0 : 2.0);
                             
                // do something
                if (isFiltered) {
                  _changed(false);
                  isFiltered = false;
                   query = '';
                   heros = listOfHeros;
                } else {
                  _changed(false);
                  isFiltered = true;
                   query = '';
                   heros = listOfHeros;

                }
              
              },
              icon: AnimatedIcon(
                icon: iconData,
                color: Colors.white,
                progress: _controller.view,
              ),
            ),
            
          ],
        ),
      ),
    );
  }

}
