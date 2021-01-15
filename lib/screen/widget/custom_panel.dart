import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class CustomPanel extends StatelessWidget {
  final String appbar;
  final String image;
  final String subtitle;
  final List<Widget> content;

  CustomPanel({this.appbar, this.image, this.subtitle, this.content});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appbar),
        backgroundColor: Colors.green,
      ),
      backgroundColor: Color(0xff1b4332),
      resizeToAvoidBottomPadding: false,
      body: SlidingUpPanel(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        maxHeight: MediaQuery.of(context).size.height * 0.5,
        minHeight: MediaQuery.of(context).size.height * 0.5,
        defaultPanelState: PanelState.OPEN,
        color: Colors.green,
        panel: Container(
            color: Colors.transparent,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: content,
                  ),
                ),
              ],
            )),
        body: Column(
          children: <Widget>[
            Image.asset(
              image,
              width: 300,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 10),
              child: Text(
                subtitle,
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
