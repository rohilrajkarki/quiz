import 'option.dart';

class Question {
  final String text;
  final String hintone;
  final String hinttwo;

  final List<Option> options;
  final String solution;

  bool isLocked;
  // Option selectedOption;

  Question({
    required this.text,
    required this.options,
    required this.hintone,
    required this.hinttwo,
    required this.solution,
    this.isLocked = false,
    //  this.selectedOption,
  });
}
