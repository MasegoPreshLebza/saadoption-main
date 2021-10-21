import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String labels;
  final int maxLiness;
  final int minLiness;
  final Icon icon;
  MyTextField({this.labels, this.maxLiness = 1, this.minLiness = 1, this.icon});

  @override
  Widget build(BuildContext context) {
    return TextField(
      
      style: TextStyle(color: Colors.black87),
      minLines: minLiness,
      maxLines: maxLiness,
      decoration: InputDecoration(
        suffixIcon: icon == null ? null: icon,
          labelText: labels,
          labelStyle: TextStyle(color: Colors.black45),
          
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          border:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey))),
    );
  }
}
