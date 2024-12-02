import 'package:flutter/material.dart';
import 'package:tourly/model/place_model.dart';
import 'package:tourly/screens/Home/widgets/category_card.dart';
import 'package:tourly/screens/Home/widgets/recomended.dart';
import 'package:tourly/screens/detailsScreen/detail_screen.dart';

class FoodScreen extends StatelessWidget {
  const FoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Text(
                              "Category",
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 70,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              Row(
                                children: [
                                  CategoryCard(
                                    press: () {},
                                    image: "assests/images/mountains.jpeg",
                                    title: "Breakfast",
                                  ),
                                  CategoryCard(
                                    press: () {},
                                    image: "assests/images/forests.jpeg",
                                    title: "Lunch",
                                  ),
                                  CategoryCard(
                                    press: () {},
                                    image: "assests/images/sea.webp",
                                    title: "Drinks",
                                  ),
                                  CategoryCard(
                                    press: () {},
                                    image: "assests/images/deserts.jpeg",
                                    title: "Snacks",
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        // Recommended
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Text(
                              "Recommended",
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 300,
                          child: ListView.builder(
                            itemCount: places.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.only(left: 5, right: 15),
                                child: Row(
                                  children: [
                                    Recommended(
                                      placeInfo: places[index],
                                      press: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => DetailScreen(
                                              placeInfo: places[index],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        // Recently Added
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Text(
                              "Recently Added",
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 300,
                          child: ListView.builder(
                            itemCount: places.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.only(left: 5, right: 15),
                                child: Row(
                                  children: [
                                    Recommended(
                                      placeInfo: places[index],
                                      press: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => DetailScreen(
                                              placeInfo: places[index],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Your existing content goes here...
            ],
          ),
        ),
      ),
    );
  }
}