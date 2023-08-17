import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';
import '../../controllers/AuthentificationCtrl.dart';
import '../../controllers/UserCtrl.dart';
import '../../utils/Constantes.dart';
import '../../utils/Routes.dart';
import '../../utils/StockageKeys.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({Key? key}) : super(key: key);

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  Color other = Colors.black;
  Color selectedItem = Colors.orange;
  final ImagePicker picker = ImagePicker();
  XFile? imageSelectione;
  GetStorage box = GetStorage();

  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var userCtrl = context.read<UserCtrl>();
      userCtrl.recuperDataAPI();
    });
  }

  @override
  Widget build(BuildContext context) {
    var token = box.read(StockageKeys.tokenKey);
    var ctrl = context.watch<UserCtrl>();
    return ctrl.user?.temp!=1 && token!=null? Scaffold(
      body: _body(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Profile'),
        backgroundColor: Colors.black,
        actions: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Icon(Icons.density_medium),
          )
        ],
      ),
    ) : Scaffold(
      body: _noconnect(),
    );
  }

  Widget _body() {
    var userCtrl = context.watch<UserCtrl>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () async {
            imageSelectione =
            await picker.pickImage(source: ImageSource.gallery);

            if (imageSelectione != null) {
              Directory directory = await getApplicationDocumentsDirectory();
              var cheminSplit = imageSelectione!.path.split('/');
              String filename = cheminSplit.last;
              imageSelectione?.saveTo("${directory.path}/${filename}");
            }
            setState(() {
              userCtrl.user?.image;
            });
          },
          iconSize: 100,
          icon: ClipOval(
              child: Image.network(
                "${Constantes.BASE_URL}${userCtrl.user?.image}",
                errorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
                  return Icon(CupertinoIcons.person_alt_circle);
                },
                fit: BoxFit.cover,
                width: 200,
                height: 200,
              )),

        ),
        Container(
          child: TextButton(
            child: Text(
              'Changer la photo',
              style: TextStyle(color: Colors.grey),
            ),
            onPressed: () async {
              imageSelectione =
              await picker.pickImage(source: ImageSource.gallery);

              if (imageSelectione != null) {
                Directory directory = await getApplicationDocumentsDirectory();
                print(directory.path);
                var cheminSplit = imageSelectione!.path.split('/');
                String filename = cheminSplit.last;
                print(cheminSplit);
                print(filename);
                imageSelectione?.saveTo("${directory.path}/${filename}");
              }
              setState(() {});
            },
          ),
        ),
        Container(
          child: Text(
            '${userCtrl.user?.name == null ? 'Profil Name' : userCtrl.user
                ?.name}',
            style: TextStyle(
                height: 1.5,
                fontSize: 25,
                fontWeight: FontWeight.w700,
                letterSpacing: 1,
                color: Colors.black87),
          ),
        ),
        SizedBox(height: 15),
        Expanded(
          child:
          ListView(
              padding: EdgeInsets.all(10),
              shrinkWrap: true,
              children: [
                box.read(StockageKeys.tokenKey) != null ? ListTile(
                  title: Text('Mes annonces et statistique',
                      style: TextStyle(
                        fontSize: 14,
                      )),
                  leading: Icon(
                    Icons.analytics_outlined,
                    color: Colors.black,
                    size: 25,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                    size: 20,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, Routes.DashboardPageRoutes);
                  },
                ):ListTile(
                  title: Text('Mes publications',
                      style: TextStyle(
                        fontSize: 14,
                      )),
                  leading: Icon(
                    Icons.public,
                    color: Colors.black,
                    size: 25,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                    size: 20,
                  ),
                  onTap: () {},
                ),
                ListTile(
                  title: Text(
                    'Mes favoris',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  leading: Icon(
                    Icons.favorite,
                    color: Colors.black,
                    size: 25,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                    size: 20,
                  ),
                  onTap: () {},
                ),
                ListTile(
                  title: Text(
                    'Notification',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  leading: Icon(
                    Icons.notifications_active,
                    color: Colors.black,
                    size: 25,
                  ),
                  trailing: badges.Badge(
                    badgeStyle: badges.BadgeStyle(
                        badgeColor: Colors.red
                    ),
                    badgeContent: Text(
                      "0", style: TextStyle(color: Colors.white),),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, Routes.NotificationPageRoutes);
                  },
                ),
                ListTile(
                  title: Text(
                    '${userCtrl.user?.email == null ? "non defini" : userCtrl
                        .user?.email}',
                    style: TextStyle(fontSize: 14),
                  ),
                  leading: Icon(
                    Icons.email,
                    color: Colors.black,
                    size: 25,
                  ),
                  onTap: () {},
                ),
                ListTile(
                  title: Text(
                    "${userCtrl.user?.telephone == null
                        ? 'non defini'
                        : userCtrl.user?.telephone}",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  leading: Icon(
                    Icons.phone,
                    color: Colors.black,
                    size: 25,
                  ),
                  onTap: () {},
                ),
                ListTile(
                  title: Text(
                    'Aide',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  leading: Icon(
                    Icons.help,
                    color: Colors.black,
                    size: 25,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                    size: 20,
                  ),
                  onTap: () {},
                ),
                ListTile(
                  title: Text(
                    'Déconnexion',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  leading: Icon(
                    Icons.login,
                    color: Colors.black,
                    size: 25,
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                    size: 20,
                  ),
                  onTap: () {
                    ouvrirDialog(context);
                  },
                ),
              ]),
        ),
      ],
    );
  }

  ouvrirDialog(context) async {
    bool? resulat = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        var auth = context.watch<AuthentificationCtrl>();
        return AlertDialog(
          title: Text("Déconnexion"),
          content: new Text("Voulez-vous vraiment vous déconnectez  ?"),
          actions: <Widget>[
            TextButton(
              child: new Text(
                "Annuler",
                style: TextStyle(color: Colors.grey),
              ),
              onPressed: () {
                Navigator.pop(context, false);
              },
            ),
            new TextButton(
              child: new Text(
                "Confirmer", style: TextStyle(color: Colors.orange),),
              onPressed: () {
                Navigator.pop(context, true);
                auth.logout({});
                box.remove(StockageKeys.tokenKey);
                Navigator.popAndPushNamed(context, Routes.HomePagePageRoutes);
              },
            ),
          ],
        );
      },
    );

    if (resulat != null) {
      var message = !resulat ? "Déconnexion annulée" : "Déconnexion";
      showSnackBar(context, message);
    }
  }

  showSnackBar(context, String message) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(SnackBar(
      content: Text(message),
      action:
      SnackBarAction(label: 'OK',
          textColor: Colors.orange,
          onPressed: scaffold.hideCurrentSnackBar),
    ));
  }

  Widget _noconnect(){
    return Stack(
      children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/empty.gif"),
              SizedBox(height: 20.0),
              SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.LoginPageRoutes);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                child: Text('Se connecter'),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: Image.asset(
            "assets/app_icon2.png",
            width: 25,
            height: 25,
          ),
        ),
      ],
    );
  }
}
