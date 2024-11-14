import 'package:flutter/material.dart';
import 'package:tourly/model/place_model.dart';
import 'package:tourly/utilities/colors.dart';

class Recommended extends StatelessWidget {
  final PlaceInfo placeInfo;
  final VoidCallback press;
  const Recommended({
    super.key,
    required this.placeInfo,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 250,
        width: 200,
        decoration: BoxDecoration(
            color: kWhiteClr, borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        fit: BoxFit.cover, image: AssetImage(placeInfo.image))),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                placeInfo.name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8.0,
              ),
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: kPrimaryClr,
                  ),
                  Text(
                    placeInfo.location,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
