import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:signIn/screen/add_user_screen/add_user.dart';
import 'package:signIn/screen/widget/air_quality/bar_chart_odor.dart';
import 'package:signIn/screen/widget/fill_level/bar_chart.dart';
import 'package:signIn/screen/widget/register_form/register_form.dart';

import 'custom_panel.dart';

class GridDashboard extends StatelessWidget {
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
                          content: [
                            TextFormField(),
                          ],
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
                          content: [
                            TextFormField(),
                          ],
                        )));
          }),
      new Item(
          title: 'Add User',
          subtitle: 'subtitle item 4',
          event: 'event item 4',
          icon: FontAwesomeIcons.userPlus,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CustomPanel(
                          appbar: 'Add New User',
                          image: 'assets/images/img3.png',
                          subtitle: 'Register New User',
                          content: [RegisForm()],
                        )));
          }),
    ];

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

class Item {
  String title;
  String subtitle;
  String event;
  IconData icon;
  Function onPressed;

  Item({this.title, this.subtitle, this.event, this.icon, this.onPressed});
}
