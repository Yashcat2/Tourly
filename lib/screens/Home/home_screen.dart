import 'package:flutter/material.dart';
import 'package:tourly/commons/collapsing_navigation_bar.dart';
import 'package:tourly/model/place_model.dart';
import 'package:tourly/screens/Home/widgets/recomended_card.dart';
import 'package:tourly/screens/detailsScreen/detail_screen.dart';
import 'package:tourly/utilities/colors.dart';

import 'widgets/category_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteClr,
      appBar: AppBar(
        backgroundColor: kPrimaryClr,
        elevation: 0,
        title: const Text(
          "Discover",
          style: TextStyle(
            color: kWhiteClr,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: kWhiteClr),
            onPressed: () {
              // Handle notification click
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings, color: kWhiteClr),
            onPressed: () {
              // Handle settings click
            },
          ),
        ],
      ),
      drawer: CollapsingNavigationBar(), // Adding the custom sidebar widget
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.home_outlined,
                color: kPrimaryClr,
                size: 46,
              ),
              Icon(
                Icons.hotel_rounded,
                color: kPrimaryClr,
                size: 46,
              ),
              Icon(
                Icons.food_bank_outlined,
                color: kPrimaryClr,
                size: 46,
              ),
              // Icon(
              //   Icons.account_circle_outlined,
              //   color: kPrimaryClr,
              //   size: 46,
              // ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // User greeting
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 27,
                      backgroundImage:
                          AssetImage("assests/images/pasindu.jpeg"),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    RichText(
                      text: const TextSpan(
                        text: "Hello",
                        style: TextStyle(
                          color: kBlackClr,
                          fontSize: 18,
                        ),
                        children: [
                          TextSpan(
                            text: ", Pasindu",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // Search section
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Explore New Destinations",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Material(
                  borderRadius: BorderRadius.circular(100),
                  elevation: 5,
                  child: Container(
                    decoration: BoxDecoration(
                      color: kWhiteClr,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              decoration: const InputDecoration(
                                hintText: "Search your Destination",
                                prefixIcon: Icon(Icons.search),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                            ),
                          ),
                          const CircleAvatar(
                            radius: 22,
                            backgroundColor: kPrimaryClr,
                            child: Icon(
                              Icons.sort_by_alpha_sharp,
                              color: kWhiteClr,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // Category
                const SizedBox(
                  height: 20,
                ),
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
                            title: "Mountains",
                          ),
                          CategoryCard(
                            press: () {},
                            image: "assests/images/forests.jpeg",
                            title: "Forests",
                          ),
                          CategoryCard(
                            press: () {},
                            image: "assests/images/sea.webp",
                            title: "Sea",
                          ),
                          CategoryCard(
                            press: () {},
                            image: "assests/images/deserts.jpeg",
                            title: "Deserts",
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
                        padding: const EdgeInsets.only(left: 5, right: 15),
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
                        padding: const EdgeInsets.only(left: 5, right: 15),
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
    );
  }
}
