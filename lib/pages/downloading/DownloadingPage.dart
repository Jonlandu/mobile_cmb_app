import 'package:flutter/material.dart';

import '../../utils/Routes.dart';

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
      title: Center(
        child: Text("Téléchargement",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Color(0xFF40BFFF),
      elevation: 0,
    );
  }

  Widget _body() {
    return Container(
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child:
                ListView(
                    padding: EdgeInsets.all(10),
                    shrinkWrap: true,
                    children: [
                      SizedBox(height: 25,),
                      ListTile(
                        title: Text('Vidéo',
                            style: TextStyle(
                              fontSize: 24,
                              //fontWeight: FontWeight.bold,
                            )),
                        leading: Container(height: 40, child: Image.asset("assets/video.png")),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                          size: 20,
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, Routes.VideoDownloadingPageRoutes);
                        },
                      ),
                      SizedBox(height: 20,),
                      ListTile(
                        title: Text('Audio',
                            style: TextStyle(
                              fontSize: 24,
                              //fontWeight: FontWeight.bold,
                            )),
                        leading: Container(height: 40, child: Image.asset("assets/audio.png")),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                          size: 20,
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, Routes.AudioDownloadingPageRoutes);
                        },
                      ),
                      SizedBox(height: 20,),
                      ListTile(
                        title: Text('PDF',
                            style: TextStyle(
                              fontSize: 24,
                              //fontWeight: FontWeight.bold,
                            )),
                        leading: Container(height: 40, child: Image.asset("assets/pdf.png")),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                          size: 20,
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, Routes.PDFDownloadingPageRoutes);
                        },
                      ),
                    ]
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
