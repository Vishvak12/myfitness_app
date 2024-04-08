import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  String iconPath;
  Color boxColor;

  CategoryModel(
      {required this.name, required this.iconPath, required this.boxColor}
  );
  static List<CategoryModel> getCategories(){
    List<CategoryModel> categories = [];
    categories.add(CategoryModel(name: 'Salad', iconPath: 'assets/icons/plate.svg', boxColor: Colors.green));
    
    categories.add(CategoryModel(name: 'Cake', iconPath: 'assets/icons/pancakes.svg', boxColor: Colors.blue));
    categories.add(CategoryModel(name: 'Pie', iconPath: 'assets/icons/pie.svg', boxColor: Colors.red));
    categories.add(CategoryModel(name: 'Smoothies', iconPath: 'assets/icons/orange-snacks.svg', boxColor: Colors.orange));
  return categories;
  }
}