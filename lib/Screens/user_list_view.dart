import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:post_with_getx/Controller/user_list_controller.dart';
import 'package:get/get.dart';



class UserListView extends StatelessWidget {
 final UserListController userListController=Get.put(UserListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My App"),
      ),
      body: Obx((){
       // print(userListController.user.value.data.length.toString()+"userlist lenght");
        if(userListController.user.value.data==null)
          return Center(child: CircularProgressIndicator(),);
        else
          return ListView.builder(
            itemCount: userListController.userList.length,
              itemBuilder: (context,index)
              {
                  return Card(
                    child: Column(
                      children: [
                        Row(
                         // mainAxisAlignment: MainAxisAlignment.start,
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              margin: EdgeInsets.fromLTRB(16, 8, 8, 8),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  userListController.userList[index].avatar,
                                  width: 150,
                                  height: 100,
                                  fit: BoxFit.fill,
                                ),

                              ),
                            ),
                            Text(userListController.user.value.data[index].firstName),
                            SizedBox(width: 5,),
                            Text(userListController.user.value.data[index].lastName),

                          ],
                        ),
                      ],
                    ),
                  );
              }
          );
      })
      );
  }
}
