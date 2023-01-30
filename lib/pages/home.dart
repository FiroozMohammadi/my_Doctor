import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:mydoctor/pages/hospital_page.dart';
import 'package:mydoctor/pages/laboratory_page.dart';
import 'package:mydoctor/pages/pharmacy_page.dart';
import 'package:mydoctor/theme/colors.dart';
import 'package:flutter/material.dart';

import 'doctor_page.dart';
import 'home_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Widget> _pages = [
    HospitalPage(),
    const DoctorPage(),
    const HomePage(),
    LaboratoryPage(),
    PharmacyPage(),
  ];

  int _currentIndex = 2;
  final PageController _pageController = PageController(initialPage: 2);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SizedBox.expand(
          child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() => _currentIndex = index);
              },
              children: _pages),
        ),
        bottomNavigationBar: BottomNavyBar(
          selectedIndex: _currentIndex,
          onItemSelected: (index) {
            setState(() => _currentIndex = index);
            _pageController.jumpToPage(index);
          },
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
                activeColor: primary,
                inactiveColor: Colors.black,
                title: const Text('شفاخانه ها'),
                icon: const Icon(
                  Icons.local_hospital_rounded,
                  color: Color.fromARGB(255, 133, 11, 210),
                )),
            BottomNavyBarItem(
                activeColor: primary,
                inactiveColor: Colors.black,
                title: const Text('داکترها'),
                icon: const Icon(
                  Icons.medical_services_rounded,
                  color: Colors.blue,
                )),
            BottomNavyBarItem(
                activeColor: primary,
                inactiveColor: Colors.black,
                title: const Text('صفحه اصلی'),
                icon: const Icon(Icons.home)),
            BottomNavyBarItem(
                activeColor: primary,
                inactiveColor: Colors.black,
                title: const Text('لابراتوارها'),
                icon: const Icon(
                  Icons.bloodtype_rounded,
                  color: Colors.red,
                )),
            BottomNavyBarItem(
                activeColor: primary,
                inactiveColor: Colors.black,
                title: const Text('دواخانه ها'),
                icon: const Icon(
                  Icons.local_pharmacy_rounded,
                  color: Colors.green,
                )),
          ],
        ),
      ),
    );
  }
}
