import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quiz/models/widget_questions_model.dart';



class AddEnglishItems extends StatefulWidget {
  const AddEnglishItems({super.key});

  @override
  State<AddEnglishItems> createState() => _AddEnglishItemsState();
}

class _AddEnglishItemsState extends State<AddEnglishItems> {
  final TextEditingController idController = TextEditingController();
  final TextEditingController textController = TextEditingController();
  final TextEditingController option1Controller = TextEditingController();
  final TextEditingController option2Controller = TextEditingController();
  final TextEditingController option3Controller = TextEditingController();
  final TextEditingController option4Controller = TextEditingController();
  final TextEditingController correctAnswerController = TextEditingController();

  final CollectionReference _widgetQuestionsCollection =
  FirebaseFirestore.instance.collection('english');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add english Question'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: idController,
              decoration: const InputDecoration(labelText: 'ID'),
            ),
            TextField(
              controller: textController,
              decoration: const InputDecoration(labelText: 'Question Text'),
            ),
            TextField(
              controller: option1Controller,
              decoration: const InputDecoration(labelText: 'Option 1'),
            ),
            TextField(
              controller: option2Controller,
              decoration: const InputDecoration(labelText: 'Option 2'),
            ),
            TextField(
              controller: option3Controller,
              decoration: const InputDecoration(labelText: 'Option 3'),
            ),
            TextField(
              controller: option4Controller,
              decoration: const InputDecoration(labelText: 'Option 4'),
            ),
            TextField(
              controller: correctAnswerController,
              decoration: const InputDecoration(labelText: 'Correct Answer'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                addQuestion();
              },
              child: const Text('Add Question'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> addQuestion() async {
    try {
      int id = int.parse(idController.text);
      WidgetQuestion question = WidgetQuestion(
        id: id,
        text: textController.text,
        options: [
          WiidgetOption(text: option1Controller.text, isCorrect:option1Controller.text==correctAnswerController.text?true: false),
          WiidgetOption(text: option2Controller.text, isCorrect:option2Controller.text==correctAnswerController.text?true: false ),
          WiidgetOption(text: option3Controller.text, isCorrect: option3Controller.text==correctAnswerController.text?true: false),
          WiidgetOption(text: option4Controller.text, isCorrect: option4Controller.text==correctAnswerController.text?true: false),
        ],
        isLocked: false,
        correctAnswer: WiidgetOption(
          text: correctAnswerController.text,
          isCorrect: true,
        ),
      );

      await _widgetQuestionsCollection.add(question.toJson());
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Question added successfully'),
        ),
      );
      // Clear text fields after adding question
      idController.clear();
      textController.clear();
      option1Controller.clear();
      option2Controller.clear();
      option3Controller.clear();
      option4Controller.clear();
      correctAnswerController.clear();
    } catch (e) {
      print('Error adding question: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error adding question. Please try again.'),
        ),
      );
    }
  }
}



