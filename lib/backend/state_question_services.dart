import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quiz/models/state_questions_model.dart';
import 'package:quiz/models/widget_questions_model.dart';

class StateQuestionServices {
  final CollectionReference _stateQuestionsCollection =
      FirebaseFirestore.instance.collection('StateQuestions');
  Future<List<StateQuestion>> getStateQuestions() async {
    try {
      QuerySnapshot querySnapshot = await _stateQuestionsCollection.get();
      return querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return StateQuestion(
          id: data['id'],
          text: data['text'],
          options: (data['options'] as List<dynamic>).map((option) {
            return StateOption(
              text: option['text'],
              isCorrect: option['isCorrect'],
            );
          }).toList(),
          isLocked: data['isLocked'],
          correctAnswer: StateOption(
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

  Future<void> addStateQuestion(StateQuestion question) async {
    print('hello');

    try {
      await _stateQuestionsCollection.add({
        'id': question.id,
        'text': question.text,
        'options': question.options
            .map((option) =>
                {'text': option.text, 'isCorrect': option.isCorrect})
            .toList(),
        'isLocked': question.isLocked,
        'correctAnswer': {
          'text': question.correctAnswer?.text,
          'isCorrect': question.correctAnswer?.isCorrect
        },
      });
    } catch (e) {
      print('Error adding question: $e');
    }
  }
}
