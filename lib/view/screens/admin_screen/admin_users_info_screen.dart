
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_controller/logic/controller/all_users_info_controller.dart';
import 'package:lab_controller/utils/theme.dart';

class AdminUsersInfoScreen extends StatelessWidget {
   AdminUsersInfoScreen({Key? key}) : super(key: key);
  final allUsersInfo = Get.put(AllUsersInfoController());


  @override
  Widget build(BuildContext context) {
    return Obx(
          () => ListView.builder(
        itemCount: allUsersInfo.usersInfo.length,
        itemBuilder: (context, index) => Card(
          child: Container(
            width: double.infinity,
            margin:
            const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
            height: 250,
            decoration: BoxDecoration(
              color: Colors.green.shade100,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: mainColor,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ListTile(
                  title: Text(allUsersInfo.usersInfo[index].name!),
                  subtitle: Text(allUsersInfo.usersInfo[index].email!),
                  leading: CircleAvatar(
                    radius: 40,
                    backgroundColor: mainColor,
                    child: Text(
                      allUsersInfo.usersInfo[index].name!.substring(0, 1).capitalize!,
                      style: const TextStyle(fontSize:20,fontWeight: FontWeight.bold,color: Colors.white),
                    ),
                  ),
                  //trailing: (),
                  onTap: () {},
                ),
                Text('Role : ${allUsersInfo.usersInfo[index].role}',
                  style:const TextStyle(fontSize: 20,fontWeight: FontWeight.bold) ,),
                const SizedBox(
                  height: 5,),
                Text('Gender: ${allUsersInfo.usersInfo[index].gender}',
                  style:const TextStyle(fontSize: 15,fontWeight: FontWeight.bold) ,),
                const SizedBox(
                  height: 5,),
                Text('Address : ${allUsersInfo.usersInfo[index].address}',
                  style:const TextStyle(fontSize: 15,fontWeight: FontWeight.bold) ,),
                const SizedBox(
                  height: 5,),
                Text('Phone Number : ${allUsersInfo.usersInfo[index].phoneNum}',
                  style:const TextStyle(fontSize: 15,fontWeight: FontWeight.bold) ,),
                const SizedBox(
                  height: 5,),
                Text('Home Number : ${allUsersInfo.usersInfo[index].homeNum}',
                  style:const TextStyle(fontSize: 15,fontWeight: FontWeight.bold) ,),
                const SizedBox(
                  height: 5,),
                Text('Nationality : ${allUsersInfo.usersInfo[index].nationality}',
                  style:const TextStyle(fontSize: 15,fontWeight: FontWeight.bold) ,),
                const SizedBox(
                  height: 5,),
                Text('User Id : ${allUsersInfo.usersInfo[index].id}',
                  style:const TextStyle(fontSize: 15,fontWeight: FontWeight.bold) ,),
              ],
            ),
          ),
        ),
      ),

    );
  }



  displayDeleteDialog(String docId) {
    Get.defaultDialog(
      title: "Delete Employee",
      titleStyle: const TextStyle(fontSize: 20),
      middleText: 'Are you sure to delete employee ?',
      textCancel: "Cancel",
      textConfirm: "Confirm",
      confirmTextColor: Colors.black,
      onCancel: () {},
      onConfirm: () {
        //controller.deleteData(docId);
      },
    );
  }
}
