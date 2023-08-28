import 'package:flutter/material.dart';

class EmissionPage extends StatefulWidget {
  const EmissionPage({super.key});

  @override
  State<EmissionPage> createState() => _EmissionPageState();
}

class _EmissionPageState extends State<EmissionPage> {
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
        child: Text("Emission",
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
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
          children: [
            Column(
              children: [
                SizedBox(height: 25,),
                _audioBrodcast(),
                SizedBox(height: 10,),
                _youTubeLivestream(),
                SizedBox(height: 10,),
                _facebookLivestream(),
                SizedBox(height: 250,),
                Align(
                  alignment: Alignment.bottomCenter,
                    child: _ecriture()
                ),
              ],
            ),
          ],
        ),
    );
  }

  Widget _audioBrodcast(){
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: InkWell(
        onTap: (){

        },
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric( horizontal: 4),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            children: [
              Column(
                children: [
                  Text(
                    "Retransmission Audio",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5,),
                  Text(
                    "La Retransmission Audio des réunions",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 20,),
              Expanded(child: Container(height: 50, child: Image.asset("assets/podcast.png")))
            ],
          ),
        ),
      ),
    );
  }
  Widget _youTubeLivestream(){
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: InkWell(
        onTap: (){

        },
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric( horizontal: 4),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            children: [
              Column(
                children: [
                  Text(
                    "Retransmission Audio",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5,),
                  Text(
                    "La Retransmission Audio des réunions",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 20,),
              Expanded(child: Container(height: 50, child: Image.asset("assets/youtube.png")))
            ],
          ),
        ),
      ),
    );
  }
  Widget _facebookLivestream(){
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: InkWell(
        onTap: (){

        },
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric( horizontal: 4),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            children: [
              Column(
                children: [
                  Text(
                    "Retransmission Audio",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5,),
                  Text(
                    "La Retransmission Audio des réunions",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 20,),
              Expanded(child: Container(height: 50, child: Image.asset("assets/facebook.png")))
            ],
          ),
        ),
      ),
    );
  }

  Widget _ecriture(){
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          child: Text(
            "Jésus-Christ est le même hier, aujourd'hui et éternellement (Hébreux 13 : 8) ",
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        ),
        SizedBox(height: 20,),
        Text(
          "© cmkbinza@gmail.com",
          style: TextStyle(
            fontSize: 15,
            color: Colors.lightBlue,
          ),
        ),
      ],
    );
  }
}
