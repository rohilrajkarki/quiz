import 'package:flutter/material.dart';
import 'package:quiz_me/model/option.dart';
import 'package:quiz_me/model/product_model.dart';
import 'package:quiz_me/model/questions.dart';
import 'package:quiz_me/screens/options_widget.dart';

class QuestionsWidget extends StatefulWidget {
  final Product category;
  // final ValueChanged<Option> onClickedOption;
  const QuestionsWidget({
    Key? key,
    required this.category,
    // required this.onClickedOption,
  }) : super(key: key);

  @override
  State<QuestionsWidget> createState() => _QuestionsWidgetState();
}

class _QuestionsWidgetState extends State<QuestionsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          itemCount: widget.category.questions.length,
          //individual question using itemBuilder
          itemBuilder: (context, index) {
            final question = widget.category.questions[index];
            return buildQuestion(question: question, index: index);
          }),
    );
  }

  Widget buildQuestion({required Question question, required int index}) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 32),
          Text(
            question.text,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          SizedBox(height: 8),
          Text(
            'Choose your answer from below',
            style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
          ),
          SizedBox(height: 32),
          Expanded(
            child: OptionsWidget(
              question: question,
              onClickedOption: selectOption,
              index: index,
            ),
          ),
        ],
      ),
    );
  }

  selectOption(Option options, int index) {
    if (widget.category.questions[index].isLocked) {
      return;
    } else {
      setState(() {
        widget.category.questions[index].isLocked = true;
        // widget.question.selectedOption = option;
      });
    }
  }
}
