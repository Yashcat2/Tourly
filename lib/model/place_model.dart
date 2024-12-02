class PlaceInfo {
  final String location, image, name, desc;
  final int distance, days;
  PlaceInfo({
    required this.desc,
    required this.name,
    required this.image,
    required this.location,
    required this.distance,
    required this.days,
  });
}

List places = [
  PlaceInfo(
      image: "assests/images/kandy.png",
      location: 'Kandy ',
      name: 'Temple of Tooth Relic',
      distance: 1000,
      days: 1,
      desc:
          " Sri Dalada Maligawa, commonly known in English as the Temple of the Sacred Tooth Relic, is a Buddhist temple in Kandy, Sri Lanka. It is located in the Royal Palace Complex of the former Kingdom of Kandy, which houses the relic of the tooth of the Buddha."),
  PlaceInfo(
      image: "assests/images/mirissa.png",
      location: 'Matara',
      name: 'Matara',
      distance: 5000,
      days: 2,
      desc:
          "Mirissa is a small town on the south coast of Sri Lanka, located in the Matara District of the Southern Province. It is approximately 150 kilometres south of Colombo and is situated at an elevation of 4 metres above sea level. Mirissa's beach and nightlife make it a popular tourist destination."),
  PlaceInfo(
      image: "assests/images/1.png",
      location: 'Dambulla',
      name: 'Seegiriya',
      distance: 8000,
      days: 1,
      desc:
          "Sigiriya or Sinhagiri is an ancient rock fortress located in the northern Matale District near the town of Dambulla in the Central Province, Sri Lanka. It is a site of historical and archaeological significance that is dominated by a massive column of granite approximately 180 m high."),
  PlaceInfo(
      image: "assests/images/fort.png",
      location: 'Galle',
      name: 'Galle',
      distance: 5000,
      days: 4,
      desc:
          "Galle Fort, in the Bay of Galle on the southwest coast of Sri Lanka, was built first in 1588 by the Portuguese, then extensively fortified by the Dutch during the 17th century from 1649 onwards."),
  PlaceInfo(
      image: "assests/images/2.png",
      location: 'Ampara',
      name: 'Arugambay Beach',
      distance: 5000,
      days: 12,
      desc:
          "Arugam Bay, known locally as Arugam Kudah, is situated on the Indian Ocean in the dry zone of Sri Lanka's southeast coast, and a historic settlement of the ancient Batticaloa Territory. Arugam Kudah's literal Tamil translation is Bay of Cynodon dactylon"),
];
