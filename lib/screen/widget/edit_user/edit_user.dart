import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../table_basic.dart';

class EditUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String _email, _pass;
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return Container(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 5,
          ),
          child: Column(
            children: [
              Text(
                'Edit User',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Table(
                border: TableBorder(
                    bottom: BorderSide(
                  width: 1.0,
                  color: Colors.white,
                )),
                children: [
                  TableRow(
                    children: [
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Email',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Action',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Table(children: [
                TableRowBasic().render(
                  tableHead: Text(
                    'formattedDate',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  tableCell: Padding(
                      padding: const EdgeInsets.only(top: 7.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            child: Icon(FontAwesomeIcons.pencilAlt),
                          ),
                          GestureDetector(
                            child: Icon(FontAwesomeIcons.trash),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                        ],
                      )),
                )
              ]),
              SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
