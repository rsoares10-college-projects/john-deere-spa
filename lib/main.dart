import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:john_deere_spa/stores/user-view.store.dart';
import 'package:john_deere_spa/views/landing.view.dart';
import 'package:provider/provider.dart';

void main() async {
  // Load environment variables
  await dotenv.load(fileName: '.env');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<UserViewStore>(create: (_) => UserViewStore()),
      ],
      child: MaterialApp(
        title: 'John Deere SPA App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.lightGreen,
        ),
        home: LandingView(),
      ),
    );
  }
}
