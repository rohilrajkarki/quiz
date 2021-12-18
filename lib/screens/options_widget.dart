import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_me/constants.dart';
import 'package:quiz_me/model/option.dart';
import 'package:quiz_me/model/questions.dart';
import 'package:quiz_me/provider/category.dart';
import 'package:quiz_me/utils.dart';

class OptionsWidget extends StatefulWidget {
  final Question question;
  final Function onClickedOption;
  final int index;
  final int catindex;

  const OptionsWidget({
    Key? key,
    required this.question,
    required this.index,
    required this.catindex,
    required this.onClickedOption,
  }) : super(key: key);

  @override
  State<OptionsWidget> createState() => _OptionsWidgetState();
}

class _OptionsWidgetState extends State<OptionsWidget> {
  bool change = false;

  @override
  Widget build(BuildContext context) => ListView(
        physics: BouncingScrollPhysics(),
        children: Utils.heightBetween(
          widget.question.options
              .map((option) => buildOption(context, option))
              .toList(),
          height: 8,
        ),
      );

  Widget buildOption(BuildContext context, Option option) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            if (option.isCorrect && !widget.question.isLocked) {
              Provider.of<CategoryProvider>(context, listen: false)
                  .setScore(widget.catindex);
              setState(() {
                change = true;
                widget.question.isLocked = true;
              });
            } else {
              setState(() {
                widget.question.isLocked = true;
              });
            }
          },
          child: Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: !widget.question.isLocked
                  ? kpurple
                  : option.isCorrect
                      ? Colors.green
                      : Colors.red,
              borderRadius: BorderRadius.circular(16),
            ),
            child: buildAnswer(option),
          ),
        ),
        !widget.question.isLocked
            ? SizedBox()
            : option.isCorrect
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(widget.question.solution),
                  )
                : SizedBox(
                    height: 0,
                  )
      ],
    );
  }

  Widget buildAnswer(Option option) => Container(
        height: 50,
        child: Row(children: [
          Text(
            option.code,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          SizedBox(width: 12),
          Text(
            option.text,
            style: TextStyle(fontSize: 20),
          )
        ]),
      );
}
