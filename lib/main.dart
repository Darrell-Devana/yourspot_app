import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yourspot_app/dummy_data/dummy_data.dart';
import 'package:yourspot_app/screens/core.dart';
import 'package:yourspot_app/screens/favorite.dart';
import 'package:yourspot_app/screens/login.dart';
import 'package:yourspot_app/screens/home.dart';
import 'package:yourspot_app/screens/place_detail.dart';
import 'models/place.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> initializeFirebase() async {
  await Firebase.initializeApp();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeFirebase();
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  List<Place> favoritePlaces = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return CoreScreen();
            } else
              return LoginPage();
          }),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      routes: {
        CoreScreen.routeName: (context) => const CoreScreen(),
        HomeScreen.routeName: (context) => HomeScreen(
            filteredPlaces: const [], updateFilteredPlaces: (value) {}),
        FavoriteScreen.routeName: (context) => FavoriteScreen(
            filteredPlaces: const [], updateFilteredPlaces: (value) {}),
        PlaceDetail.routeName: (context) => const PlaceDetail(),
      },
    );
  }
}
