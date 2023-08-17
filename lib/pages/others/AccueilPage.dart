import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccueilPage extends StatefulWidget {
  const AccueilPage({super.key});

  @override
  State<AccueilPage> createState() => _AccueilPageState();
}

class _AccueilPageState extends State<AccueilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      leadingWidth: 0,
      leading: SizedBox(),
      actions: [],
      title: Row(
        children: [
          Icon(
            CupertinoIcons.book_fill,
          ),
          SizedBox(width: 5,),
          Text("CMB APP",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
      elevation: 0,
    );
  }

  Widget _body() {
    return Container(
      child: Stack(
        children: [
          Column(
            children: [

            ],
          ),
        ],
      ),
    );
  }
}
