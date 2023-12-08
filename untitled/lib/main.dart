import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:untitled/models/account.dart';
import 'package:untitled/home.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(AccountAdapter());
  await Hive.openBox('accountsBox');


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(colorSchemeSeed: Colors.blue.shade900),
      title: 'Wallet App',
      home: Home(),
    );
  }
}