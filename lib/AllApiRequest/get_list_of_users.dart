import 'package:http/http.dart' as http;
import 'package:post_with_getx/ApiUrl/api_url.dart';
import 'package:post_with_getx/Model/user_data_model.dart';
class ApiService{

  static var client= http.Client();

  static Future<UserDataModel> getUserList() async{
    var response =await client.get(Uri.parse(ApiUrl().apiUrl));
    if(response.statusCode==200){
      print(response.body);
      var jsonString =response.body;
      return userDataModelFromJson(jsonString);
    }
    else{
     //UserDataModel(page: 0,perPage: 0,total: 0,totalPages: 0, data: [], support: Support(text: 'Unkwon',url: 'unknown'));
     //  return [];

    }
  }
}