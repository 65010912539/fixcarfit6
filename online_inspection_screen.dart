import 'package:flutter/material.dart';

class OnlineInspectionScreen extends StatelessWidget {
  const OnlineInspectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ตรวจสภาพรถออนไลน์'),
      ),
      body: const Center(
        child: Text('หน้านี้ใช้สำหรับตรวจสภาพรถออนไลน์'),
      ),
    );
  }
}
