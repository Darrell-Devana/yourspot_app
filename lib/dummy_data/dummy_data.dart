import 'package:flutter/material.dart';

import '/models/place.dart';
import 'package:yourspot_app/models/parking_space.dart';

class Data extends StatefulWidget {
  const Data({super.key});

  @override
  State<Data> createState() => _DataState();
}

class _DataState extends State<Data> {
  bool dataA1Ref = false;

  @override
  Widget build(BuildContext context) {
    return const MaterialApp();
  }
}

List<Place> dummyPlace = [
  Place(
    id: 'm1',
    title: 'Syahdan Campus',
    imageUrl:
        'https://binus.ac.id/wp-content/uploads/2019/08/WhatsApp-Image-2020-09-24-at-3.47.56-PM-1.jpeg',
    availability: 3,
  ),
  // Place(
  //   id: 'm2',
  //   title: 'Anggrek Campus',
  //   imageUrl:
  //       'https://asset.kompas.com/crops/fvqMvMySQjR95wrLA7322443JnU=/0x0:1280x853/750x500/data/photo/2021/04/20/607edfd535849.jpeg',
  //   availability: 25,
  // ),
  // Place(
  //   id: 'm3',
  //   title: 'Kijang Campus',
  //   imageUrl:
  //       'https://binus.ac.id/wp-content/uploads/2019/08/WhatsApp-Image-2020-09-24-at-3.47.59-PM-2.jpeg',
  //   availability: 5,
  // ),
];

List<ParkingSpace> dummyParkingSpace = [
  ParkingSpace(id: 'A1', isAvailable: false, category: 'm1'),
  ParkingSpace(id: 'A2', isAvailable: true, category: 'm1'),
  ParkingSpace(id: 'A3', isAvailable: false, category: 'm1'),
  // ParkingSpace(id: 'B1', isAvailable: true, category: 'm2'),
  // ParkingSpace(id: 'B2', isAvailable: false, category: 'm2'),
  // ParkingSpace(id: 'B3', isAvailable: true, category: 'm2'),
  // ParkingSpace(id: 'B4', isAvailable: false, category: 'm2'),
  // ParkingSpace(id: 'B5', isAvailable: true, category: 'm2'),
  // ParkingSpace(id: 'B6', isAvailable: true, category: 'm2'),
  // ParkingSpace(id: 'B7', isAvailable: false, category: 'm2'),
  // ParkingSpace(id: 'B8', isAvailable: false, category: 'm2'),
  // ParkingSpace(id: 'B9', isAvailable: false, category: 'm2'),
  // ParkingSpace(id: 'B10', isAvailable: true, category: 'm2'),
  // ParkingSpace(id: 'B11', isAvailable: true, category: 'm2'),
  // ParkingSpace(id: 'B12', isAvailable: true, category: 'm2'),
  // ParkingSpace(id: 'B13', isAvailable: false, category: 'm2'),
  // ParkingSpace(id: 'B14', isAvailable: true, category: 'm2'),
  // ParkingSpace(id: 'B15', isAvailable: true, category: 'm2'),
  // ParkingSpace(id: 'C1', isAvailable: true, category: 'm3'),
  // ParkingSpace(id: 'C2', isAvailable: true, category: 'm3'),
  // ParkingSpace(id: 'C3', isAvailable: true, category: 'm3'),
  // ParkingSpace(id: 'C4', isAvailable: true, category: 'm3'),
  // ParkingSpace(id: 'C5', isAvailable: true, category: 'm3'),
];
