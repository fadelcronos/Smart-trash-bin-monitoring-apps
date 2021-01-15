import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class AddUser extends StatefulWidget {
  @override
  _AddUserState createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New User"),
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
                    children: [
                      TextFormField(),
                    ],
                  ),
                ),
              ],
            )),
        body: Column(
          children: <Widget>[
            Image.asset(
              'assets/images/img3.png',
              width: 300,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 10),
              child: Text(
                "Register New User",
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//  Container(
//         alignment: Alignment.center,
//         // height: MediaQuery.of(context).size.height * 0.5,
//         decoration: BoxDecoration(),
//         child: Padding(
//           padding: const EdgeInsets.only(top: 20),
//           child: Column(
//             children: <Widget>[
//               Image.asset(
//                 'assets/images/img3.png',
//                 width: 300,
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 20, bottom: 10),
//                 child: Text(
//                   "Register New User",
//                   style: TextStyle(color: Colors.white, fontSize: 25),
//                 ),
//               ),

//             ],
//           ),
//         ),
//       ),
