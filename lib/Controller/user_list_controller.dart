
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:post_with_getx/AllApiRequest/get_list_of_users.dart';
import 'package:post_with_getx/Model/user_data_model.dart';

class UserListController extends GetxController{

  var isLoading =true.obs;
  var  userList=<Datum>[].obs;
  var  user=UserDataModel().obs;


  @override
  void onInit() {
    // TODO: implement onInit
    fetchUsersList();
    super.onInit();
  }
  
  void fetchUsersList(){
    Timer(Duration(seconds:5),(){
      ApiService.getUserList().then((userDataModel)
      {
        user.value=userDataModel;
        userList.value=userDataModel.data;

      });
      isLoading(false);
    });

  }

}
