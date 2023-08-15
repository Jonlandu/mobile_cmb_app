import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get_storage/get_storage.dart';
import '../../controllers/UserCtrl.dart';
import '../../utils/StockageKeys.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _currentIndex=0;
  Color other = Colors.black;
  Color selectedItem = Colors.orange;
  GetStorage box = GetStorage();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var userCtrl = context.read<UserCtrl>();
      userCtrl.recuperDataAPI();
    });
  }
  /*final pages=[
    ArticlesPage(),
    ListeConversationPage(),
    ProfilPage()
  ];*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
      //children: pages,
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
        BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          label: 'Message',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label:
             userCtrl.user?.temp==1 && tkn==null  ? 'Profile' : 'Connexion',
        ),
      ],
      onTap: (int index) {
        setState(() {
          _currentIndex = index;
          other = Colors.black;
          selectedItem = Colors.orange;
        });
      },
    );
  }
}
