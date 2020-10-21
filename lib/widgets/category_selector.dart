import 'package:flutter/material.dart';

import '../models/message_model.dart';

class CategorySelector extends StatefulWidget {
  @override
  _CategorySelectorState createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  int selectedIndex = 0;

  _buildCategoryItem(BuildContext context, int index) {
    return GestureDetector(
      onTap: () => {
        setState(() => {selectedIndex = index})
      },
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Text(
          '${categories[index]}',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: (selectedIndex == index) ? Colors.white : Colors.white60,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
      ),
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return _buildCategoryItem(context, index);
        },
      ),
    );
  }
}
