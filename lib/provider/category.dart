import 'package:flutter/cupertino.dart';
import 'package:quiz_me/model/product_model.dart';

class CategoryProvider extends ChangeNotifier {
  List<Product> categories = products;
  setScore(index) {
    categories[index].score++;
    notifyListeners();
  }
}
