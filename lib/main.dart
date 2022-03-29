import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testluggagelocker/controller/provider/lockers_provider.dart';
import 'package:testluggagelocker/view/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LockersProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        home: const HomePage(),
      ),
    );
  }
}
