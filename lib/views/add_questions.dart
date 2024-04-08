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
      body: ListView.builder(itemCount: flutterTopicsList.length, itemBuilder: (BuildContext context, int index) {
        final topicsData = flutterTopicsList[index];
        return ListTile(
          onTap: (){
            navigatePages(context: context, topicName: topicsData.topicName);
          },
          title:Text(topicsData.topicName ),
        );
      },),
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
