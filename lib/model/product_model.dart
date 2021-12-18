import 'package:flutter/material.dart';
import 'package:quiz_me/model/question_model.dart';
import 'package:quiz_me/model/questions.dart';

class Product {
  final String image, title;
  final int id, courses;
  final Color color;
  final List<Question> questions;
  int score;
  Product(
      {required this.questions,
      required this.image,
      required this.title,
      required this.courses,
      required this.color,
      required this.id,
      this.score = 0});
}

List<Product> products = [
  Product(
    questions: questions,
    id: 1,
    title: "Moter Bike",
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
    questions: questions1,
    id: 3,
    title: "Car",
    image: "assets/images/programming.png",
    color: Color(0xFFffaa5b),
    courses: 15,
  ),
  Product(
    questions: questions,
    id: 4,
    title: "Scooter",
    image: "assets/images/graphics.png",
    color: Color(0xFF9ba0fc),
    courses: 18,
  ),
];
