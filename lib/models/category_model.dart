import 'package:flutter/material.dart';

import '../generated/assets.dart';

class CategoryModel {
  String title;
  String id;
  String img;
  Color color;

  CategoryModel(
      {required this.title,
      required this.id,
      required this.img,
      required this.color});

  static List<CategoryModel> getCategory() {
    return [
      CategoryModel(
          title: 'Business',
          id: 'business',
          img: Assets.assetsBusiness,
          color: Color(0XffCF7E48)),
      CategoryModel(
          title: 'Politics',
          id: 'general',
          img: Assets.assetsPolitics,
          color: Color(0Xff003E90)),
      CategoryModel(
          title: 'Health',
          id: 'health',
          img: Assets.assetsHealth,
          color: Color(0XffED1E79)),
      CategoryModel(
          title: 'Science',
          id: 'science',
          img:Assets.assetsScience,
          color: Color(0XffF2D352)),
      CategoryModel(
          title: 'Sports',
          id: 'sports',
          img: Assets.assetsSports,
          color: Color(0XffC91C22)),
      CategoryModel(
          title: 'Entertainment',
          id: 'entertainment',
          img:Assets.assetsEntertainment,
          color: Color(0Xff4882CF)),
    ];
  }
}
