import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Models/AuthentificationModel.dart';
import 'package:get_storage/get_storage.dart';
import '../utils/Constantes.dart';
import '../utils/Endpoints.dart';
import '../utils/Request.dart';
import '../utils/StockageKeys.dart';

class AuthentificationCtrl with ChangeNotifier {

  AuthentificationCtrl({this.stockage});

  String? token;
  AuthentificationModel? user;
  GetStorage? stockage;

  List<AuthentificationModel> auth = [];
  bool loading = false;

  Future<HttpResponse> logout(Map data) async{
    var url="${Endpoints.logout}";
    var tkn = stockage?.read(StockageKeys.tokenKey);
    HttpResponse response = await postData(url, data, token: tkn);
    if(response.status){
      notifyListeners();
    }
    print(response.data);
    return response;
  }

  Future<HttpResponse>login(Map data) async{
    var url="${Endpoints.authentication}";
    HttpResponse response = await postData(url, data);
    if(response.status){
      user=AuthentificationModel.fromJson(response.data?['user'] ?? {});
      stockage?.write(StockageKeys.tokenKey, response.data?["token"]?? "");
      notifyListeners();
    }
    print(response.data);
    return response;
  }

  Future<HttpResponse> register(Map data) async{
    var url = "${Endpoints.register}";
    HttpResponse response = await postData(url, data);
    if (response.status){
      stockage?.write(StockageKeys.tokenKey, response.data?["token"]) ;
      notifyListeners();
    }
    return response;
  }

  void recuperDataAPI() async{
    var url=Uri.parse("${Constantes.BASE_URL}${Endpoints.authentication}");
    loading=true;
    notifyListeners();
    var reponse= await http.get(url);
    print(reponse.runtimeType);
    print(reponse.body.runtimeType);
    print(reponse.body);
    print(reponse.statusCode);
    loading=false;
    notifyListeners();
  }
}
