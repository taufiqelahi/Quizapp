import 'package:quiz/models/layout_questions_model.dart';
import 'package:quiz/models/naviagation_questions_model.dart';
import 'package:quiz/models/widget_questions_model.dart';
import 'package:quiz/models/state_questions_model.dart';
import 'package:flutter/cupertino.dart';

const Color cardColor = Color(0xFF4993FA);

class FlutterTopics {
  final int id;
  final String topicName;
  final String image;
  final Color topicColor;
  final List<dynamic> topicQuestions;

  FlutterTopics( {
    required this.id,
    required this.topicColor,
    required this.image,
    required this.topicName,
    required this.topicQuestions,
  });
}

final List<FlutterTopics> flutterTopicsList = [
  FlutterTopics(
    id: 0,
    topicColor: cardColor,
    image: 'assets/bangla.jpeg',
    topicName: "বাংলা",
    topicQuestions: []
  ),
  FlutterTopics(
    id: 1,
    topicColor: cardColor,

    topicName: "English",
    topicQuestions: [], image: 'assets/english.jpeg',
  ),
  FlutterTopics(
    id: 2,
    topicColor: cardColor,
    topicName: "সাধারণ জ্ঞান",
    topicQuestions: [], image: 'assets/gk.jpeg',
  ),
  FlutterTopics(
    id: 3,
    topicColor: cardColor,
    topicName: "গণিত",
    topicQuestions: [], image: 'assets/math.png',
  ),
];
