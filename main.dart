import 'package:flutter/material.dart';
import 'login_screen.dart'; // เพิ่มการนำเข้าไฟล์ LoginScreen
import 'register_screen.dart'; // เพิ่มการนำเข้าไฟล์ RegisterScreen
import 'main_function_screen.dart'; // เพิ่มการนำเข้าไฟล์ MainFunctionScreen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'แอปบริการรถยนต์',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/login', // ตั้งค่าเส้นทางเริ่มต้นเป็น '/login'
      routes: <String, WidgetBuilder>{
        '/login': (BuildContext context) => const LoginScreen(),
        '/register': (BuildContext context) => const RegisterScreen(),
        '/main': (BuildContext context) =>
            const MainFunctionScreen(), // เส้นทางหลัก
      },
    );
  }
}
