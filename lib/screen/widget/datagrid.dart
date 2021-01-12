import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:signIn/screen/add_user_screen/add_user.dart';

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
            print('blablabla');
          }),
      new Item(
          title: 'Air Quality',
          subtitle: 'subtitle item 2',
          event: 'event item 2',
          icon: FontAwesomeIcons.wind,
          onPressed: () {
            print('blablabla');
          }),
      new Item(
          title: 'Fill Level Log',
          subtitle: 'subtitle item 3',
          event: 'event item 3',
          icon: FontAwesomeIcons.history,
          onPressed: () {
            print('blablabla');
          }),
      new Item(
          title: 'Air Quality Log',
          subtitle: 'subtitle item 4',
          event: 'event item 4',
          icon: FontAwesomeIcons.history,
          onPressed: () {
            print('blablabla');
          }),
      new Item(
          title: 'Add User',
          subtitle: 'subtitle item 4',
          event: 'event item 4',
          icon: FontAwesomeIcons.userPlus,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => AddUser()));
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
