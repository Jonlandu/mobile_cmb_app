"import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get_storage/get_storage.dart';
import '../../controllers/UserCtrl.dart';
import '../../utils/StockageKeys.dart';
import '../downloading/DownloadingPage.dart';
import '../messaging/MessengerPage.dart';
import '../others/AccueilPage.dart';
import '../others/EmissionPage.dart';
import '../user/ProfilPage.dart';

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _currentIndex=0;
  Color other = Colors.black;
  Color selectedItem = Color(0xFF40BFFF);
  GetStorage box = GetStorage();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      /*var userCtrl = context.read<UserCtrl>();
      userCtrl.recuperDataAPI();*/
    });
  }
  final pages=[
    AccueilPage(),
    /*DownloadingPage(),
    EmissionPage(),
    MessengerPage(),
    ProfilPage()*/
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      bottomNavigationBar: _bottomNav(),
    );
  }
  Widget _bottomNav(){
    var userCtrl = context.watch<UserCtrl>();
    var tkn = box.read(StockageKeys.tokenKey);
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      iconSize: 30,
      unselectedItemColor: other,
      selectedItemColor: selectedItem,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Accueil',
        ),
        /*BottomNavigationBarItem(
          icon: Icon(Icons.download),
          label: 'Téléchargement',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.broadcast_on_home),
          label: 'Emission',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.message),
          label: 'Messenger',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),*/
      ],
      onTap: (int index) {
        setState(() {
          _currentIndex = index;
          other = Colors.black;
          selectedItem = Color(0xFF40BFFF);
        });
      },
    );
  }
}
"