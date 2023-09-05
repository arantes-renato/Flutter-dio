import 'package:flutter/material.dart';

import 'pages/login_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
                seedColor: const Color.fromARGB(255, 11, 2, 144))
            .copyWith(background: Colors.black12),
      ),
      home: const LoginPage(),
    );
  }
}
