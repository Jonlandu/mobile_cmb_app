import 'package:flutter/material.dart';

class CircularImage extends StatelessWidget {
  final String image;
  final bool status;
  final bool online;

  const CircularImage({super.key, required this.image, required this.status, required this.online});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              border: status ? Border.all(color: Colors.blue, width: 3) : Border.all(color: Colors.white, width: 3),
            ),
            child: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.grey[300],
              backgroundImage: AssetImage("assets/$image"),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 2,
            child: Visibility(
              visible: online,
              child: Container(
                width: 15,
                height: 15,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 1,
                  ),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.green
                ),
          ),
            ),
          ),
        ],
      ),
    );
  }
}