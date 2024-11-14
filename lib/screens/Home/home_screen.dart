import 'package:flutter/material.dart';
import 'package:tourly/model/place_model.dart';
import 'package:tourly/screens/Home/widgets/recomended.dart';
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Column(children: [
            //app bar
            Row(
              children: [
                const CircleAvatar(
                  radius: 27,
                  backgroundImage: AssetImage("assests/images/pasindu.jpeg"),
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
                          text: ",Pasindu",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ))
                    ]))
              ],
            ),
            //search section,
            const SizedBox(
              height: 15,
            ),
            Text(
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
                    color: kWhiteClr, borderRadius: BorderRadius.circular(100)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(
                              hintText: "Search your Destination",
                              prefixIcon: Icon(Icons.search),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none),
                        ),
                      ),
                      const CircleAvatar(
                        radius: 22,
                        backgroundColor: kPrimaryClr,
                        child: Icon(
                          Icons.sort_by_alpha_sharp,
                          color: kWhiteClr,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            //category
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  "Category",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
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
                        title: "Dessrets",
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //Recomended
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  "Recomended",
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
            Container(
              height: 300, //350 thibbe
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
                            press: () {},
                          )
                        ],
                      ),
                    );
                  }),
            )
          ]),
        ),
      ),
    );
  }
}
