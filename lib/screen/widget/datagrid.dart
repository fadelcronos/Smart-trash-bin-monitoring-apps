import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:signIn/screen/widget/air_log/air_log.dart';
import 'package:signIn/screen/widget/air_quality/bar_chart_odor.dart';
import 'package:signIn/screen/widget/fill_level/bar_chart.dart';
import 'package:signIn/screen/widget/manage_user/manage_user.dart';
import 'package:signIn/screen/widget/register_form/register_form.dart';

import 'custom_panel.dart';
import 'fill_log/fill_log.dart';

class GridDashboard extends StatelessWidget {
  final String roles;
  GridDashboard({this.roles});
  @override
  Widget build(BuildContext context) {
    List<Item> listItem = [
      new Item(
          title: 'Fill Level',
          subtitle: 'subtitle item 1',
          event: 'event item 1',
          icon: FontAwesomeIcons.fill,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CustomPanel(
                          appbar: 'Fill Level',
                          image: 'assets/images/fill_level.png',
                          subtitle: 'Fill Level Sensor',
                          content: [BarChartCustom()],
                        )));
          }),
      new Item(
          title: 'Odor Sensor',
          subtitle: 'subtitle item 2',
          event: 'event item 2',
          icon: FontAwesomeIcons.wind,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CustomPanel(
                          appbar: 'Air Quality',
                          image: 'assets/images/air_quality.png',
                          subtitle: 'Methane Gas Level Sensor',
                          content: [
                            BarOdor(),
                          ],
                        )));
          }),
      new Item(
          title: 'Fill Level Log',
          subtitle: 'subtitle item 3',
          event: 'event item 3',
          icon: FontAwesomeIcons.history,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CustomPanel(
                          appbar: 'Fill Level Log',
                          image: 'assets/images/fill_log.png',
                          subtitle: 'Fill Level History Log',
                          content: [FillLog()],
                        )));
          }),
      new Item(
          title: 'Air Quality Log',
          subtitle: 'subtitle item 4',
          event: 'event item 4',
          icon: FontAwesomeIcons.calendar,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CustomPanel(
                          appbar: 'Air Quality History',
                          image: 'assets/images/air_log.png',
                          subtitle: 'Air Quality History Log',
                          content: [AirLog()],
                        )));
          }),
      new Item(
          title: 'Manage User',
          subtitle: 'subtitle item 4',
          event: 'event item 4',
          icon: FontAwesomeIcons.usersCog,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CustomPanel(
                          appbar: 'Manage User',
                          image: 'assets/images/img3.png',
                          subtitle: 'User Account Management',
                          content: [RegisForm()],
                        )));
          }),
    ];

    if (roles == 'Admin') {
      return Flexible(
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          childAspectRatio: 1,
          padding: EdgeInsets.only(left: 16, right: 16),
          children: listItem.map((item) {
            return GestureDetector(
              child: Container(
                decoration: BoxDecoration(color: Colors.green[600], borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      child: Icon(
                        item.icon,
                        size: 60,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      item.title,
                      style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              onTap: item.onPressed,
            );
          }).toList(),
        ),
      );
    } else {
      listItem.length = 2;
      return Flexible(
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          childAspectRatio: 1,
          padding: EdgeInsets.only(left: 16, right: 16),
          children: listItem.map((item) {
            return GestureDetector(
              child: Container(
                decoration: BoxDecoration(color: Colors.green[600], borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      child: Icon(
                        item.icon,
                        size: 60,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      item.title,
                      style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              onTap: item.onPressed,
            );
          }).toList(),
        ),
      );
    }
  }
}

class Item {
  String title;
  String subtitle;
  String event;
  IconData icon;
  Function onPressed;

  Item({this.title, this.subtitle, this.event, this.icon, this.onPressed});
}
