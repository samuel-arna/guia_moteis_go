import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:guiamoteisgo/modules/home/presenter/pages/home_page.dart';
import 'package:guiamoteisgo/modules/home/presenter/stores/home_store.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeStore()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Samuel Arná',
        home: const HomePage(),
      ),
    );
  }
}
