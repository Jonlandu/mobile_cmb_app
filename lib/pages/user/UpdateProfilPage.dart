import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import '../../controllers/UserCtrl.dart';
import '../../utils/Message.dart';
import '../../utils/Routes.dart';
import '../../widgets/ChampsSaisie.dart';
import '../../widgets/Chargement.dart';

class UpdateProfilPage extends StatefulWidget {
  @override
  State<UpdateProfilPage> createState() => _UpdateProfilPageState();
}

class _UpdateProfilPageState extends State<UpdateProfilPage> {

  String errorMsg = "";
  bool isVisible = false;
  GetStorage box = GetStorage();
  var formKey = GlobalKey<FormState>();
  var name = TextEditingController();
  var email = TextEditingController();
  var telephone = TextEditingController();
  var pays = TextEditingController();
  var ville = TextEditingController();
  var password = TextEditingController();
  var password_confirm = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Stack(
        children: [_body(context), Chargement(isVisible)],
      ),
    );
  }
  UpdateProfilButtomPressed() async {
    FocusScope.of(context).requestFocus(new FocusNode());
    if (!formKey.currentState!.validate()) {
      return;
    }
    isVisible = true;
    setState(() {});
    var ctrl = context.read<UserCtrl>();
    var userId = ctrl.user?.id.toString();
    Map data = {
      'name': name.text,
      'email': email.text,
      'telephone': telephone.text,
      'pays': pays.text,
      'ville': ville.text,
      'temp': 0,
      'password': password.text,
      'password_confirmation': password_confirm.text,
    };
    print(data);
    var res = await ctrl.updateUser(data,userId!);


    await Future.delayed(Duration(seconds: 1));

    isVisible = false;
    setState(() {});

    if (res.status) {
      await Future.delayed(Duration(seconds: 1));
      setState(() {});

      Navigator.pop(context, Routes.HomePagePageRoutes);
    } else {
      var msg =
      res.isException == true ? res.errorMsg : (res.data?['message']);
      Message.afficherSnack(context, msg);
    }
    return;
  }
  Widget _body(BuildContext context) {
    return Form(
      key: formKey,
      child: Stack(
        children: [
          Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Icon(
                      Icons.create,
                      size: 50,
                      color: Color(0xFF40BFFF),
                    ),
                    Text(
                      'Profil',
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      alignment: Alignment.center,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text("Mise à jour", style: TextStyle(fontSize: 29,fontWeight: FontWeight.w500,color: Color(0xff000000),height: 1.1725)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ChampSaisie(ctrl: name, label: "Nom complet", required: true),
                    SizedBox(
                      height: 10,
                    ),
                    ChampSaisie(ctrl: email, label: "Email", required: true),
                    SizedBox(
                      height: 10,
                    ),
                    ChampSaisie(ctrl: telephone, label: "Téléphone", required: true),
                    SizedBox(
                      height: 10,
                    ),
                    ChampSaisie(ctrl: pays, label: "Pays", required: true),
                    SizedBox(
                      height: 10,
                    ),
                    ChampSaisie(ctrl: ville, label: "Ville", required: true),
                    SizedBox(
                      height: 10,
                    ),
                    _textError(),
                    SizedBox(height: 3,),
                    _buttonWidget(context),
                  ]
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                "assets/cmblogo.jpg",
                width: 40,
                height: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }

  showSnackBar(context, String message) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(SnackBar(
      content: Text(message),
      action:
      SnackBarAction(label: 'OK',
          textColor: Color(0xFF40BFFF),
          onPressed: scaffold.hideCurrentSnackBar),
    ));
  }

  Widget _buttonWidget(BuildContext ctx) {
    return Container(
      width: 500,
      height: 40,
      child: ElevatedButton(
        onPressed: ()=>UpdateProfilButtomPressed(),
        child: Text("Mettre à jour",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
        style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF40BFFF)
        ),
      ),
    );
  }

  Widget _textError() {
    return Text(errorMsg, style: TextStyle(color: Colors.red, fontSize: 16));
  }
}