import 'package:flutter/material.dart';
import 'package:howon_project/screen/home_screen.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

const testBox = 'test';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting();
  await Hive.initFlutter();
  await Hive.openBox(testBox);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'hamcho',
      ),
      home: HomeScreen(),
    ),
  );
}