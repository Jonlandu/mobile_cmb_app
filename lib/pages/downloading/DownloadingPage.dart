import 'package:flutter/material.dart';

class DownloadingPage extends StatefulWidget {
  const DownloadingPage({super.key});

  @override
  State<DownloadingPage> createState() => _DownloadingPageState();
}

class _DownloadingPageState extends State<DownloadingPage> {
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
