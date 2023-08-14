import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import '../models/UserModel.dart';
import '../utils/Endpoints.dart';
import '../utils/Request.dart';
import '../utils/StockageKeys.dart';

class UserCtrl with ChangeNotifier {
  UserModel? user;
  bool loading = false;
  GetStorage? stockage;
  bool _isFirstTimeBienvenue=false;
  bool get isFirstTimeBienvenue {
    return stockage?.read<bool>(StockageKeys.is_first_time) ?? _isFirstTimeBienvenue;
  }

  set isFirstTimeBienvenue(bool value) {
    _isFirstTimeBienvenue = value;
    stockage?.write(StockageKeys.is_first_time, value);
  }

  UserCtrl({this.stockage});

  void recuperDataAPI() async {
    var token=stockage?.read(StockageKeys.tokenKey) ;
    var url =Endpoints.detailUserEndpoint;
    loading = true;
    notifyListeners();
    var reponse = await getData(url, token: token);
    if(reponse!=null){
     user= UserModel.fromJson(reponse['user']);
      notifyListeners();
    }
    loading = false;
    notifyListeners();
  }

  Future<HttpResponse> updateUser(Map data, String userId) async {
    var token=stockage?.read(StockageKeys.tokenKey) ;
    var url =Endpoints.updateUser.replaceAll("{user}", userId);
    loading = true;
    notifyListeners();
    HttpResponse response = await postData(url, data, token: token);
    if(response.status){
      user=UserModel.fromJson(response.data?['user'] ?? {});
      stockage?.write(StockageKeys.tokenKey, response.data?["token"]?? "");
      notifyListeners();
    }
    print(response.data);
    print("=================${response.errorMsg}");
    return response;
  }

  void updateImageProfil() async {
    var token=stockage?.read(StockageKeys.tokenKey) ;
    var url =Endpoints.detailUserEndpoint;
    loading = true;
    notifyListeners();
    var reponse = await getData(url, token: token);
    if(reponse!=null){
      user= UserModel.fromJson(reponse['user']);
      notifyListeners();
    }
    loading = false;
    notifyListeners();
  }
}
