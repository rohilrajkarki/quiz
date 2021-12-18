import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:quiz_me/components/question_widget.dart';
import 'package:quiz_me/model/option.dart';
import 'package:quiz_me/model/product_model.dart';
import 'package:quiz_me/model/question_model.dart';
import 'package:quiz_me/model/questions.dart';
import 'package:quiz_me/provider/category.dart';

class CatagoryList extends StatelessWidget {
  // final Question question;
  const CatagoryList({
    Key? key,
    // required this.question,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: Provider.of<CategoryProvider>(context, listen: false)
            .categories
            .length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.85),
        itemBuilder: (context, index) => CategoryCard(
              product: Provider.of<CategoryProvider>(context, listen: false)
                  .categories[index],
              index: index,
            ));
  }
}

class CategoryCard extends StatefulWidget {
  final Product product;
  final int index;
  const CategoryCard({
    Key? key,
    required this.index,
    required this.product,
  }) : super(key: key);

  @override
  _CategoryCardState createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => QuestionsWidget(
                      category: widget.product, index: widget.index
                      // onClickedOption: selectOption as Function,
                      )));
        },
        child: Container(
          height: 70,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: widget.product.color,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                widget.product.image,
                height: 100,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.product.title,
                style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "${widget.product.courses} Questions",
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  //
}
