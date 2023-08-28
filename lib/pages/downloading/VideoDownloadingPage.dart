import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import '../../controllers/UserCtrl.dart';
import '../../utils/Constantes.dart';
import '../../utils/Routes.dart';
import '../../utils/StockageKeys.dart';

class VideoDownloadingPage extends StatefulWidget {
  const VideoDownloadingPage({Key? key}) : super(key: key);

  @override
  State<VideoDownloadingPage> createState() => _VideoDownloadingPageState();
}

class _VideoDownloadingPageState extends State<VideoDownloadingPage> {

  GetStorage box = GetStorage();

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
        child: Text("Vidéo à Télécharger",
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
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        SizedBox(
          height: 25,
        ),
        Container(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: GridView.count(
              shrinkWrap: true,
              crossAxisSpacing: 10,
              physics: NeverScrollableScrollPhysics(),
              mainAxisSpacing: 30,
              crossAxisCount: 2,
              children: [
                elementDashboard(
                    "Prédications",1,
                    nbr: "8",
                    Icons.video_camera_back,
                    Colors.orange,
                    onTap: (){

                    }),
                elementDashboard(
                    "Chants d'Ensemble",2,
                    nbr: "10",
                    Icons.piano,
                    Colors.orange,
                    onTap: (){

                    }
                ),
                elementDashboard(
                    "Chorale-Voix", 3,
                    nbr: "15",
                    CupertinoIcons.music_note_2,
                    Colors.orange,
                    onTap: (){

                    }
                ),
                elementDashboard(
                    "Chorale-Instrumentale", 4,
                    nbr: "15",
                    CupertinoIcons.guitars,
                    Colors.orange,
                    onTap: (){

                    }
                ),
                elementDashboard(
                    "Cantiques Individuels", 5,
                    nbr: "15",
                    CupertinoIcons.mic_circle_fill,
                    Colors.orange,
                    onTap: (){

                    }
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  elementDashboard(String title,int index, IconData icon, Color background,{String? nbr, Function? onTap}){
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFFCE4EC),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 5),
              color: Colors.black.withOpacity(.2),
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: background,
                  shape: BoxShape.circle
              ),
              child: Icon(icon, color: Colors.white,),
            ),
            SizedBox(height: 8,),
            Text(title, style: Theme.of(context).textTheme.titleMedium,),
            SizedBox(height: 5,),
            Text(nbr==null? "":nbr, style: Theme.of(context).textTheme.labelMedium,)
          ],
        ),
      ),
      onTap: ()=>onTap!(),
    );
  }
}
