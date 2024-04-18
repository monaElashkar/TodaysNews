import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/category_model.dart';
import 'widgets/category_item.dart';

class CategoriesTab extends StatelessWidget {
  CategoriesTab(
      {super.key, required this.onCategoryClicked});
  Function onCategoryClicked;
  TextStyle titleStyle = GoogleFonts.poppins(
      fontSize: 30, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    var categories = CategoryModel.getCategory();
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 22.0),
            child: Text(
              'Pick your category of interest',
              style: titleStyle,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: GridView.builder(
              itemCount: categories.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    onCategoryClicked(categories[index]);
                  },
                  child: CategoryItem(
                    model: categories[index],
                    index: index,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
