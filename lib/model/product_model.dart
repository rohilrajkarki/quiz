import 'package:flutter/material.dart';
import 'package:quiz_me/model/question_model.dart';
import 'package:quiz_me/model/questions.dart';

class Product {
  final String image, title;
  final int id, courses;
  final Color color;
  final List<Question> questions;
  Product({
    required this.questions,
    required this.image,
    required this.title,
    required this.courses,
    required this.color,
    required this.id,
  });
}

List<Product> products = [
  Product(
    questions: questions,
    id: 1,
    title: "Graphic Design",
    image: "assets/images/graphics.png",
    color: Color(0xFF71b8ff),
    courses: 16,
  ),
  // Product(
  //   questions: questionsgraphics,
  //   id: 2,
  //   title: "Programming",
  //   image: "assets/images/programming.png",
  //   color: Color(0xFFff6374),
  //   courses: 22,
  // ),
  Product(
    questions: questions,
    id: 3,
    title: "Finance",
    image: "assets/images/programming.png",
    color: Color(0xFFffaa5b),
    courses: 15,
  ),
  Product(
    questions: questions,
    id: 4,
    title: "UI/Ux design",
    image: "assets/images/graphics.png",
    color: Color(0xFF9ba0fc),
    courses: 18,
  ),
];
