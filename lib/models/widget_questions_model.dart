import 'package:quiz/backend/questions_services.dart';

class WidgetQuestion {
  final int id;
  final String text;
  final List<WiidgetOption> options;
  bool isLocked;
  WiidgetOption? selectedWiidgetOption;
  WiidgetOption correctAnswer;
  final String flashCardData;

  WidgetQuestion( {
    required this.text,
    required this.options,
    this.isLocked = false,
    this.selectedWiidgetOption,
    required this.id,
    required this.correctAnswer,
    required this.flashCardData
  });
  factory WidgetQuestion.fromJson(Map<String, dynamic> json) {
    // Extracting data from JSON

    return WidgetQuestion(
      id: json['id'],
      text: json['text'],
      options:(json['options'] as List<dynamic>).map((optionJson) => WiidgetOption.fromJson(optionJson)).toList(),
      isLocked: json['isLocked'],
      selectedWiidgetOption: json['selectedWiidgetOption'] != null ? WiidgetOption.fromJson(json['selectedWiidgetOption']) : null,
      correctAnswer: WiidgetOption.fromJson(json['correctAnswer']), flashCardData:json['flashCardData'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'options': options.map((option) => option.toJson()).toList(),
      'isLocked': isLocked,

      'correctAnswer': correctAnswer.toJson(),
      'flashCardData':flashCardData
    };
  }

 copyWith() {
    return WidgetQuestion(
      id: id,
      text: text,
      options: options
          .map((option) =>
              WiidgetOption(text: option.text, isCorrect: option.isCorrect))
          .toList(),
      isLocked: isLocked,
      selectedWiidgetOption: selectedWiidgetOption,
      correctAnswer: correctAnswer, flashCardData: flashCardData,
    );
  }
}

class WiidgetOption {
  final String? text;
  final bool? isCorrect;

  const WiidgetOption({
    this.text,
    this.isCorrect,
  });
  factory WiidgetOption.fromJson(Map<String, dynamic> json) {
    // Extracting data from JSON

    return WiidgetOption(
      text: json['text'],
      isCorrect: json['isCorrect']

    );
  }
  Map<String, dynamic> toJson() {
    return {
     'text':text,
      'isCorrect':isCorrect
    };
  }
}





