import 'package:flutter/material.dart';

class BookingServiceScreen extends StatefulWidget {
  const BookingServiceScreen({super.key});

  @override
  _BookingServiceScreenState createState() => _BookingServiceScreenState();
}

class _BookingServiceScreenState extends State<BookingServiceScreen> {
  // เก็บชื่อบริการที่เลือก
  final List<String> services = [
    'เปลี่ยนน้ำมันเครื่อง',
    'เปลี่ยนยาง',
    'ล้างรถ',
    'ทำสี',
    'วัดไมล์',
    'ตั้งศูนย์ล้อ',
    'แต่งรถ',
    'ลงเคลือบแก้ว',
    'ฝากขาย',
    'ตรวจเช็คเครื่องยนต์', // บริการใหม่
    'เปลี่ยนผ้าเบรก', // บริการใหม่
    'ล้างระบบแอร์', // บริการใหม่
    'เปลี่ยนแบตเตอรี่', // บริการใหม่
    'ซ่อมระบบไฟฟ้า', // บริการใหม่
    'เช็คช่วงล่าง', // บริการใหม่
    'บริการขัดเคลือบสีรถ', // บริการใหม่
    'บริการเปลี่ยนยางอะไหล่', // บริการใหม่
    'บริการพ่นกันสนิม', // บริการใหม่
    'บริการล้างตู้แอร์', // บริการใหม่
  ];

  List<String> selectedServices = []; // เก็บบริการที่ถูกเลือก

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('บริการจอง'),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'เลือกบริการที่ต้องการ:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: services.map((service) {
                  return ServiceCheckbox(
                    serviceName: service,
                    isSelected: selectedServices.contains(service),
                    onSelected: _onServiceSelected,
                  );
                }).toList(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // ไปที่หน้า payment_screen.dart
                if (selectedServices.isNotEmpty) {
                  // TODO: นำทางไปยังหน้าการชำระเงิน
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PaymentScreen()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('กรุณาเลือกบริการ')));
                }
              },
              child: const Text('ยืนยัน'),
            ),
          ),
        ],
      ),
    );
  }

  void _onServiceSelected(String serviceName, bool isSelected) {
    setState(() {
      if (isSelected) {
        selectedServices.add(serviceName); // เพิ่มบริการที่เลือก
      } else {
        selectedServices.remove(serviceName); // ลบบริการที่ไม่เลือก
      }
    });
  }
}

class ServiceCheckbox extends StatelessWidget {
  final String serviceName;
  final bool isSelected; // เช็คว่าบริการนี้ถูกเลือกไหม
  final ValueChanged<String, bool> onSelected; // ฟังก์ชันที่ใช้เมื่อเลือกบริการ

  const ServiceCheckbox(
      {required this.serviceName,
      required this.isSelected,
      required this.onSelected,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(serviceName),
      value: isSelected,
      onChanged: (bool? value) {
        onSelected(serviceName, value!); // เรียกฟังก์ชันเมื่อเลือกบริการ
      },
      controlAffinity: ListTileControlAffinity.leading, // วาง Checkbox ด้านซ้าย
      activeColor: Colors.blue, // เปลี่ยนสี Checkbox
    );
  }
}

// สมมุติให้มีหน้าจอ PaymentScreen
class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('หน้าชำระเงิน'),
      ),
      body: const Center(
        child: Text('ที่นี่จะเป็นหน้าชำระเงิน'),
      ),
    );
  }
}
