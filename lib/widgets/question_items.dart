import 'package:flutter/material.dart';
import 'package:quiz/backend/questions_services.dart';
import 'package:quiz/models/widget_questions_model.dart';
import 'package:quiz/views/flashcard_screen.dart';


class QuestionListScreen extends StatelessWidget {
  const QuestionListScreen({super.key, required this.topicName});
  final String topicName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widget Questions'),
      ),
      body: FutureBuilder(
        future:getQuestionsForTopic(topicName),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<dynamic>? questions = snapshot.data;
            return NewCard(topicName: topicName, typeOfTopic: questions!);
          }
        },
      ),
    );
  }

  Future<List<dynamic>> getQuestionsForTopic(String topicName) async {
    print(topicName);
    switch (topicName) {

      case 'বাংলা':
        return await QuestionServices().getBanglaQuestions();
      case 'English':
        return await QuestionServices().getEnglishQuestions();
      case 'সাধারণ জ্ঞান':
        return await QuestionServices().getGkQuestions();
      case 'গণিত':
        return await QuestionServices().getMathQuestions();

      default:
        return [];
    }
  }
}


