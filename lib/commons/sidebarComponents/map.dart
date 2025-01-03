// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong2/latlong.dart';
// import 'package:url_launcher/url_launcher.dart';

// class MapScreen extends StatefulWidget {
//   const MapScreen({super.key});

//   @override
//   State<MapScreen> createState() => _MapScreenState();
// }

// class _MapScreenState extends State<MapScreen> {
//   @override
//   Widget build(BuildContext context) {
//    return FlutterMap(
//     options: MapOptions(
//       initialCenter: LatLng(51.509364, -0.128928), // Center the map over London
//       initialZoom: 9.2,
//     ),
//     children: [
//       TileLayer( // Display map tiles from any source
//         urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png', // OSMF's Tile Server
//         userAgentPackageName: 'com.example.app',
//         // And many more recommended properties!
//       ),
//       RichAttributionWidget( // Include a stylish prebuilt attribution widget that meets all requirments
//         attributions: [
//           TextSourceAttribution(
//             'OpenStreetMap contributors',
//             onTap: () => launchUrl(Uri.parse('https://openstreetmap.org/copyright')), // (external)
//           ),
//           // Also add images...
//         ],
//       ),
//     ],
//   );

//   }
// }