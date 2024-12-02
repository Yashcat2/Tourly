import 'package:flutter/material.dart';
import 'package:tourly/utilities/colors.dart';


class FallsCategory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Falls')),
          backgroundColor:kPrimaryClr,
        ),
        body: FallList(),
      ),
    );
  }
}

class FallList extends StatelessWidget {
  final List<Map<String, String>> falls = [
    {
      "name": "Boburu WaterFall",
      "image": "assests/images/falls/bakers.png", // Add image assests images/falls/to your project
    },
    {
      "name": "Bakers WaterFall",
      "image": "assests/images/falls/boburu.png",
    },
    {
      "name": "Diyaluma WaterFall",
      "image": "assests/images/falls/boburu.png",
    },
    {
      "name": "Beragala WaterFall",
      "image": "assests/images/falls/boburu.png",
    },
    {
      "name": "Ravana WaterFall",
      "image": "assests/images/falls/boburu.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: falls.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Image.asset(
                  falls[index]["image"]!,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.black.withOpacity(0.5), Colors.transparent],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  child: Text(
                    falls[index]["name"]!,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
