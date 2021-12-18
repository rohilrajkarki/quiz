import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_me/model/option.dart';
import 'package:quiz_me/model/product_model.dart';
import 'package:quiz_me/model/questions.dart';
import 'package:quiz_me/provider/category.dart';
import 'package:quiz_me/screens/options_widget.dart';

class QuestionsWidget extends StatefulWidget {
  final Product category;
  final int index;
  // final ValueChanged<Option> onClickedOption;
  const QuestionsWidget({
    Key? key,
    required this.category,
    required this.index,
  }) : super(key: key);

  @override
  State<QuestionsWidget> createState() => _QuestionsWidgetState();
}

class _QuestionsWidgetState extends State<QuestionsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
            itemCount: widget.category.questions.length,
            //individual question using itemBuilder
            itemBuilder: (context, index) {
              final question = widget.category.questions[index];
              return buildQuestion(
                  question: question,
                  index: index,
                  catindex: widget.index,
                  score: widget.category.score);
            }),
      ),
    );
  }

  Widget buildQuestion(
      {required Question question,
      required int catindex,
      required int index,
      required int score}) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Provider.of<CategoryProvider>(context, listen: true)
                .categories[widget.index]
                .score
                .toString(),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 32),
          Text(
            question.text,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          SizedBox(height: 8),
          Text(
            question.hintone,
            style: TextStyle(fontStyle: FontStyle.italic, fontSize: 16),
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
                catindex: catindex),
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
