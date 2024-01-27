import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rabit/database/rabit_database.dart';
import 'package:rabit/pages/home_page.dart';
import 'package:rabit/theme/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await RabitDatabase.initialize();
  await RabitDatabase.saveFirstLaunchDate();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => RabitDatabase()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: Provider.of<ThemeProvider>(context).themedata,
    );
  }
}
