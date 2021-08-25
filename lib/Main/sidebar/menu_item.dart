import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final String title;
  final Function onTap;

  const MenuItem({Key key, this.title, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: <Widget>[

            SizedBox(
              width: 20,
            ),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
