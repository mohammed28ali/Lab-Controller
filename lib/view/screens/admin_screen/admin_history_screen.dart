
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_controller/logic/controller/history_controller.dart';
import 'package:lab_controller/utils/theme.dart';

class AdminHistoryScreen extends StatelessWidget {
   AdminHistoryScreen({Key? key}) : super(key: key);
  final historyController = Get.put(HistoryController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.builder(
        itemCount: historyController.history.length,
        itemBuilder: (context, index) => Card(
          child: Container(
            width: double.infinity,
            margin:
            const EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 10),
            height: 150,
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
                  title: Text(historyController.history[index].username!),
                  subtitle: Text(historyController.history[index].email!),
                  leading: CircleAvatar(
                    radius: 40,
                    backgroundColor: mainColor,
                    child: Text(
                      historyController.history[index].username!.substring(0, 1).capitalize!,
                      style: const TextStyle(fontSize:20,fontWeight: FontWeight.bold,color: Colors.white),
                    ),
                  ),
                  //trailing: (),
                  onTap: () {},
                ),
                Center(
                  child: Text('Device Number : ${historyController.history[index].deviceNum!}',
                    style:const TextStyle(fontSize: 20,fontWeight: FontWeight.bold) ,),
                ),
                const SizedBox(
                  height: 5,),
                Center(
                  child: Text('Date From : ${historyController.history[index].dateFrom!}',
                    style:const TextStyle(fontSize: 15,fontWeight: FontWeight.bold) ,),
                ),
                const SizedBox(
                  height: 5,),
                Center(
                  child: Text('Date To : ${historyController.history[index].dateTo!}',
                    style:const TextStyle(fontSize: 15,fontWeight: FontWeight.bold) ,),
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }
}
