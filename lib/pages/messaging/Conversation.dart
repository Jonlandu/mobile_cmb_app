import 'package:flutter/material.dart';

class Conversation extends StatelessWidget {
  final String image;
  final String name;
  final String msg;
  final bool isRead;

  Conversation({Key? key, this.image = '', this.name = '', this.msg = '', this.isRead = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 23,
        backgroundImage: AssetImage("assets/$image"), // Provide the image path or asset name
      ),
      title: Text(
        name,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(msg),
      trailing: Container(
        width: 12,
        height: 12,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 1),
          borderRadius: BorderRadius.circular(20),
          color: isRead? Colors.white : Colors.blue
        ),
      ),
    );
  }
}