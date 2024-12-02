import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CategoryCard(
              press: () {},
              image: "assets/images/mountain.png", // Fix the typo in the path
              title: "Mountains",
            ),
            CategoryCard(
              press: () {},
              image: "assets/images/falls.png",
              title: "Water Falls",
            ),
            CategoryCard(
              press: () {},
              image: "assets/images/beach.png",
              title: "Beaches",
            ),
            CategoryCard(
              press: () {},
              image: "assets/images/ancient.png", // Fix the typo in the path
              title: "Ancient",
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final VoidCallback press;
  final String image;
  final String title;

  const CategoryCard({
    required this.press,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        children: [
          Image.asset(
            image,
            height: 80,
            width: 80,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
