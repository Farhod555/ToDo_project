import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_project/empty/item_icon/pages/personal_page.dart';
import 'package:todo_project/empty/main_view.dart';
import 'package:todo_project/onBoarding/onBoarding_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('box');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const onBoardingPage(),
      routes: {
        '/MainView' : (context) => const MainView(),
        '/PersonalPage' : (context) => const PersonalPage(),

      },
    );
  }
}
