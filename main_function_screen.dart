import 'package:fixcarfit_application/repair_tracking_screen.dart';
import 'package:flutter/material.dart';
import 'booking_service_screen.dart';
import 'online_inspection_screen.dart';
import 'payment_screen.dart';
import 'repair_tracking_screen.dart';
import 'account_info_screen.dart'; // เพิ่มการนำเข้าไฟล์ AccountInfoScreen

class MainFunctionScreen extends StatelessWidget {
  const MainFunctionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Mechanic'),
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 2,
          padding: const EdgeInsets.all(16.0),
          crossAxisSpacing: 16.0, // เว้นช่องไฟระหว่างคอลัมน์
          mainAxisSpacing: 16.0, // เว้นช่องไฟระหว่างแถว
          children: [
            _buildButton(
              context,
              icon: Icons.car_repair,
              label: 'ตรวจสภาพรถออนไลน์',
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const OnlineInspectionScreen(),
                ));
              },
            ),
            _buildButton(
              context,
              icon: Icons.schedule,
              label: 'บริการจอง/การซ่อม',
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const BookingServiceScreen(),
                ));
              },
            ),
            _buildButton(
              context,
              icon: Icons.track_changes,
              label: 'การติดตามการซ่อม',
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const RepairTrackingScreen(),
                ));
              },
            ),
            _buildButton(
              context,
              icon: Icons.payment,
              label: 'การจ่ายเงิน',
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const PaymentScreen(),
                ));
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help),
            label: 'Help',
          ),
        ],
        currentIndex: 0,
        onTap: (index) {
          switch (index) {
            case 0:
              // นำทางไปยังหน้า Dashboard
              break;
            case 1:
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const AccountInfoScreen(),
              ));
              break;
            case 2:
              // นำทางไปยังหน้า Help
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Help'),
                    content: const Text('โปรดติดต่อทีมงาน FIX CAR FIT'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('ปิด'),
                      ),
                    ],
                  );
                },
              );
              break;
          }
        },
      ),
    );
  }

  Widget _buildButton(BuildContext context,
      {required IconData icon,
      required String label,
      required VoidCallback onPressed}) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15), // เพิ่มความโค้งให้กับมุม
        ),
        padding: const EdgeInsets.all(16.0),
        backgroundColor: Colors.blue, // สีพื้นหลังของปุ่ม
      ),
      onPressed: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: Colors.white), // เปลี่ยนสีไอคอนเป็นสีขาว
          const SizedBox(height: 8), // ระยะห่างระหว่างไอคอนและข้อความ
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 16, color: Colors.white), // เปลี่ยนสีข้อความเป็นสีขาว
          ),
        ],
      ),
    );
  }
}
