import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz/models/flutter_topics_model.dart';
import 'package:quiz/views/add_items/add_bangla_items.dart';
import 'package:quiz/views/add_items/add_english_items.dart';
import 'package:quiz/views/add_items/add_gk_items.dart';

class AddQuestionScreen extends StatelessWidget {
  const AddQuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView.builder(itemCount: flutterTopicsList.length, itemBuilder: (BuildContext context, int index) {
          final topicsData = flutterTopicsList[index];
          return Card(

            child: ListTile(
              contentPadding: EdgeInsets.all(10),
              onTap: (){
                navigatePages(context: context, topicName: topicsData.topicName);
              },
              title:Text(topicsData.topicName ,style: TextStyle(fontSize: 20),),
             leading: Image.asset(topicsData.image,height: 30,width: 50,),
              trailing: Icon(CupertinoIcons.add_circled_solid),
            ),
          );
        },),
      ),
    );
  }

  navigatePages({required BuildContext context, required String topicName}){
    switch(topicName){
      case 'বাংলা':
        return Navigator.push(context, MaterialPageRoute(builder: (_)=>AddBanglaItems()));
      case 'English' :
        return Navigator.push(context, MaterialPageRoute(builder: (_)=>AddEnglishItems()));
      case 'সাধারণ জ্ঞান':
        return Navigator.push(context, MaterialPageRoute(builder: (_)=>AddGkItems()));
      case 'গণিত':
          return Navigator.push(context, MaterialPageRoute(builder: (_)=>AddGkItems()));

      default:
        return Navigator.push(context, MaterialPageRoute(builder: (_)=>AddEnglishItems()));


    }

  }
}
