import 'package:flutter/material.dart';
import 'package:tourly/commons/collapsing_navigation_bar.dart';
import 'package:tourly/model/place_model.dart';
import 'package:tourly/screens/Home/widgets/recomended_card.dart';
import 'package:tourly/screens/detailsScreen/detail_screen.dart';
import 'package:tourly/utilities/colors.dart';

import 'widgets/category_card.dart';

class HomeScreen2 extends StatefulWidget {
  const HomeScreen2({super.key});

  @override
  State<HomeScreen2> createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  // Page controller for switching between screens
  int _selectedIndex = 0;

  // List of screens for the bottom navigation bar
  final List<Widget> _screens = [
    const HomeContentScreen(), // The Home Screen you provided
    const PlaceholderScreen(title: "Hotel Screen"),
    const PlaceholderScreen(title: "Food Screen"),
  ];

  // Handle bottom navigation bar icon tap
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
      drawer: CollapsingNavigationBar(), // Custom sidebar widget
      body: _screens[_selectedIndex], // Display the selected screen
      bottomNavigationBar: SafeArea(
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.hotel_rounded),
              label: 'Hotel',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.food_bank_outlined),
              label: 'Food',
            ),
          ],
        ),
      ),
    );
  }
}

// The Home Content Screen you provided
class HomeContentScreen extends StatelessWidget {
  const HomeContentScreen({super.key});

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
                          style: TextStyle(
                              fontSize: 26, fontWeight: FontWeight.bold),
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

// Placeholder screen for other tabs (Hotel and Food)
class PlaceholderScreen extends StatelessWidget {
  final String title;

  const PlaceholderScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}
