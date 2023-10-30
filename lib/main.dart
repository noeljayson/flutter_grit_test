import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_grit_test/hive_files/data_model.dart';
import 'package:hive/hive.dart';


import 'start_screens/splash_screen.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory = await pathProvider.getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(DataModelAdapter());
  await Hive.openBox('hive_box');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {


       return const MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      );

  }
}
