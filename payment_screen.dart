import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('การจ่ายเงิน'),
      ),
      body: const Center(
        child: Text('หน้านี้ใช้สำหรับการจ่ายเงิน'),
      ),
    );
  }
}
