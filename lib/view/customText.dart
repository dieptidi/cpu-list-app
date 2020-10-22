import 'package:flutter/material.dart';

Widget customText(String _value, double _fZ, FontWeight _fW, MainAxisAlignment _alignment){
  return 
  Row(
    mainAxisAlignment: _alignment,
    children: [
      Text(_value, style: TextStyle(
        fontSize: _fZ,
        fontWeight: _fW
      ),)
    ],
  );
}

Widget headerMainPage(String _value){
  return customText(_value, 30.0, FontWeight.bold, MainAxisAlignment.center);
}