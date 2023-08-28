import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import '../../controllers/UserCtrl.dart';
import '../../utils/Constantes.dart';
import '../../utils/StockageKeys.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var userCtrl = context.read<UserCtrl>();
      userCtrl.recuperDataAPI();
    });
  }
  GetStorage box = GetStorage();

  @override
  Widget build(BuildContext context) {
    var token = box.read(StockageKeys.tokenKey);
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    var userCtrl = context.watch<UserCtrl>();
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Container(
          decoration: BoxDecoration(
              color: Color(0xFF40BFFF),
              borderRadius:
              const BorderRadius.only(bottomRight: Radius.circular(50))),
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 30),
                title: Text(
                  '${userCtrl.user?.name==null? "Nom : non défini": userCtrl.user?.name}',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(color: Colors.white),
                ),
                subtitle: Text(
                  '${userCtrl.user?.email == null ? "Email : non_défini" : userCtrl.user?.email}',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: Colors.white54),
                ),
                trailing: Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle
                    ),
                    child: ClipOval(
                        child: Image.network(
                          "${Constantes.BASE_URL}${userCtrl.user?.image}",
                          errorBuilder: (BuildContext context, Object exception,
                              StackTrace? stackTrace) {
                            return Icon(Icons.account_circle);
                          },
                        )),
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
        Container(
          color: Color(0xFF40BFFF),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                BorderRadius.only(topLeft: Radius.circular(100))),
            child: GridView.count(
              shrinkWrap: true,
              crossAxisSpacing: 30,
              physics: NeverScrollableScrollPhysics(),
              mainAxisSpacing: 30,
              crossAxisCount: 2,
              children: [
                elementDashboard(
                    "Mes Vidéos",1,
                    nbr: "8",
                    Icons.announcement,
                    Colors.orange, 
                    onTap: (){

                }),
                elementDashboard(
                    "Mes Audios",2,
                    nbr: "10",
                    Icons.shopify_outlined,
                    Colors.orange,
                  onTap: (){

                  }
                ),
                elementDashboard(
                    "Mes PDF", 3,
                    nbr: "15",
                    CupertinoIcons.square_fill_on_square_fill,
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
          color: Colors.white,
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
