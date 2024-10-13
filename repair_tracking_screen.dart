import 'package:flutter/material.dart';

class RepairTrackingScreen extends StatelessWidget {
  const RepairTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('การติดตามการซ่อม'),
      ),
      body: const Center(
        child: Text('หน้านี้ใช้สำหรับติดตามการซ่อมรถของคุณ'),
      ),
    );
  }
}
