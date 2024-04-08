import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quiz/models/widget_questions_model.dart';

class QuestionServices {
  Future<List<WidgetQuestion>> getBanglaQuestions() async {

    final CollectionReference _widgetQuestionsCollection =
    FirebaseFirestore.instance.collection('bangla');
    try {
      QuerySnapshot querySnapshot = await _widgetQuestionsCollection.get();
      return querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return WidgetQuestion(
          id: data['id'],
          text: data['text'],
          options: (data['options'] as List<dynamic>).map((option) {
            return WiidgetOption(
              text: option['text'],
              isCorrect: option['isCorrect'],
            );
          }).toList(),
          isLocked: data['isLocked'],
          correctAnswer: WiidgetOption(
            text: data['correctAnswer']['text'],
            isCorrect: data['correctAnswer']['isCorrect'],
          ),
        );
      }).toList();
    } catch (e) {
      print('Error getting widget questions: $e');
      return []; // Handle error appropriately in your application
    }
  }
  Future<List<WidgetQuestion>> getEnglishQuestions() async {

    final CollectionReference _widgetQuestionsCollection =
    FirebaseFirestore.instance.collection('english');
    try {
      QuerySnapshot querySnapshot = await _widgetQuestionsCollection.get();
      return querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return WidgetQuestion(
          id: data['id'],
          text: data['text'],
          options: (data['options'] as List<dynamic>).map((option) {
            return WiidgetOption(
              text: option['text'],
              isCorrect: option['isCorrect'],
            );
          }).toList(),
          isLocked: data['isLocked'],
          correctAnswer: WiidgetOption(
            text: data['correctAnswer']['text'],
            isCorrect: data['correctAnswer']['isCorrect'],
          ),
        );
      }).toList();
    } catch (e) {
      print('Error getting widget questions: $e');
      return []; // Handle error appropriately in your application
    }
  }
  Future<List<WidgetQuestion>> getGkQuestions() async {

    final CollectionReference _widgetQuestionsCollection =
    FirebaseFirestore.instance.collection('gk');
    try {
      QuerySnapshot querySnapshot = await _widgetQuestionsCollection.get();
      return querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return WidgetQuestion(
          id: data['id'],
          text: data['text'],
          options: (data['options'] as List<dynamic>).map((option) {
            return WiidgetOption(
              text: option['text'],
              isCorrect: option['isCorrect'],
            );
          }).toList(),
          isLocked: data['isLocked'],
          correctAnswer: WiidgetOption(
            text: data['correctAnswer']['text'],
            isCorrect: data['correctAnswer']['isCorrect'],
          ),
        );
      }).toList();
    } catch (e) {
      print('Error getting widget questions: $e');
      return []; // Handle error appropriately in your application
    }
  }
  Future<List<WidgetQuestion>> getMathQuestions() async {

    final CollectionReference _widgetQuestionsCollection =
    FirebaseFirestore.instance.collection('math');
    try {
      QuerySnapshot querySnapshot = await _widgetQuestionsCollection.get();
      return querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return WidgetQuestion(
          id: data['id'],
          text: data['text'],
          options: (data['options'] as List<dynamic>).map((option) {
            return WiidgetOption(
              text: option['text'],
              isCorrect: option['isCorrect'],
            );
          }).toList(),
          isLocked: data['isLocked'],
          correctAnswer: WiidgetOption(
            text: data['correctAnswer']['text'],
            isCorrect: data['correctAnswer']['isCorrect'],
          ),
        );
      }).toList();
    } catch (e) {
      print('Error getting widget questions: $e');
      return []; // Handle error appropriately in your application
    }
  }


}

