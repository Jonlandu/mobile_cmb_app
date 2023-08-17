import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:provider/provider.dart';
import '../../controllers/AuthentificationCtrl.dart';
import '../../controllers/UserCtrl.dart';
import '../../utils/Routes.dart';

class BienvenuPage extends StatefulWidget {
  const BienvenuPage({Key? key}) : super(key: key);

  @override
  State<BienvenuPage> createState() => _BienvenuPageState();
}

class _BienvenuPageState extends State<BienvenuPage> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var userCtrl = context.read<UserCtrl>();
      /*var tagCtrl = context.read<TagCtrl>();
      var articleCtrl = context.read<ArticleController>();
      var categoryCtrl = context.read<CategorieController>();
      categoryCtrl.recuperCategorieAPI();
      articleCtrl.recuperArticlesAPI();
      tagCtrl.recupererTags();*/
      if(userCtrl.isFirstTimeBienvenue){
        _naviguerVersLoginPage();
      }

    });

  }

  _naviguerVersLoginPage(){
    Navigator.popAndPushNamed(context, Routes.LoginPageRoutes);
  }

  Faker fakerData = Faker();

  @override
  Widget build(BuildContext context) {
    var ctrl = context.read<AuthentificationCtrl>();
    return OnBoardingSlider(
        finishButtonText: 'Démarer',
        finishButtonStyle: FinishButtonStyle(
            backgroundColor: Color(0xFF40BFFF),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)))),
        onFinish: () {
          _naviguerVersLoginPage();
        },
        skipTextButton: Text('Passer',
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF40BFFF),
              fontWeight: FontWeight.w600,
            )),

        trailingFunction: () {
        },
        totalPage: 4,
        pageBackgroundColor: Colors.white,
        headerBackgroundColor: Colors.transparent,
        background: [
          Container(
            child: Image.asset(
              'assets/cmblogo.jpg',
              height: 0,
            ),
          ),
          Image.asset(
            'assets/cmblogo.jpg',
            height: 0,
            //width: 350,
          ),
          Image.asset(
            'assets/cmblogo.jpg',
            height: 0,
            //width: 400,
          ),
          Image.asset(
            'assets/cmblogo.jpg',
            height: 0,
            //width: 400,
          ),
        ],
        speed: 1.5,
        pageBodies: [
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 450,
                ),
                Flexible(
                  child: Text(
                    'Bienvenu sur l\'Application \n CMB APP ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Flexible(
                  child: Text(
                    'Les saintes Ecritures sont l\'unique source et le fondement entier de notre foi.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black26,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 450,
                ),
                Flexible(
                  child: Text(
                    'Nous choisissons la voie de la vérité.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Flexible(
                  child: Text(
                    'Sur Christ roc solide nous nous tenons, le reste n\'est que sable mouvant',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black26,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 450,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'Trouvez tout ce dont vous avez besoin. Une grande variété du contenus divin, accessible à tous dans l\'application.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20,),
                  Center(
                    child: Text(
                      'Evangile Eternel',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                      ),
                    ),
                  ),
                  SizedBox(height: 40,),
                  Text(
                    'Centre Missionnaire de Binza',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 30,),
                  Container(
                    height: 200,
                      child: Image.asset('assets/cmblogo.jpg')
                  ),
                  SizedBox(height: 30,),

                  Text(
                    'Cette bonne nouvelle du royaume sera prêchée dans le monde entier, pour servir de témoignage à toutes les nations. Alors viendra la fin.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 20,),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Matthieu 24 : 14',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                ],
              ),
            ),
          ),
        ]
    );
  }
}
