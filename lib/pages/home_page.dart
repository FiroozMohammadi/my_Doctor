import 'package:mydoctor/data/json.dart';
import 'package:mydoctor/pages/about_page.dart';
import 'package:mydoctor/pages/catagory_doctor_page.dart';
import 'package:mydoctor/theme/colors.dart';
import 'package:mydoctor/widgets/category_box.dart';
import 'package:mydoctor/widgets/popular_doctor.dart';
import 'package:flutter/material.dart';
import 'package:mydoctor/widgets/emergency_phone.dart';

import 'doctor_profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Container(
            padding: const EdgeInsets.only(left: 20, top: 10),
            child: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutPage()));
              },
              icon: const Icon(
                Icons.info_outline_rounded,
                color: primary,
              ),
            ),
          )
        ],
      ),
      body: getBody(),
    );
  }

  getBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            child: const Text(
              "سلام, بیا داکترت را پیدا کن",
              style: TextStyle(
                  fontSize: 23, color: primary, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
              child: const Text(
            "دسته بندی ها",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          )),
          const SizedBox(height: 10),
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 5),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                CategoryBox(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CatagoryDoctor(
                                  doctorSkills: heartDoctors,
                                  titile: "قلب",
                                  icon: Icons.heart_broken,
                                  color: const Color.fromARGB(255, 222, 26, 12),
                                )));
                  },
                  title: "قلب",
                  icon: Icons.heart_broken,
                  color: Colors.red,
                ),
                CategoryBox(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CatagoryDoctor(
                                  doctorSkills: internalMedicineDoctors,
                                  titile: "داخله",
                                  icon: Icons.local_hospital,
                                  color: Colors.blue,
                                )));
                  },
                  title: "داخله",
                  icon: Icons.local_hospital,
                  color: Colors.blue,
                ),
                CategoryBox(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CatagoryDoctor(
                                  doctorSkills: nesahiDoctors,
                                  titile: "نسایی ولادی",
                                  icon: Icons.baby_changing_station_rounded,
                                  color: Colors.green,
                                )));
                  },
                  title: "نسایی ولادی",
                  icon: Icons.baby_changing_station_rounded,
                  color: Colors.green,
                ),
                CategoryBox(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CatagoryDoctor(
                                  doctorSkills: hearDoctors,
                                  titile: "گوش گلو",
                                  icon: Icons.hearing_disabled_rounded,
                                  color: Colors.orangeAccent,
                                )));
                  },
                  title: "گوش گلو",
                  icon: Icons.hearing_disabled_rounded,
                  color: Colors.orangeAccent,
                ),
                CategoryBox(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CatagoryDoctor(
                                  doctorSkills: eyeDoctors,
                                  titile: "چشم",
                                  icon: Icons.remove_red_eye_sharp,
                                  color: Colors.black87,
                                )));
                  },
                  title: "چشم",
                  icon: Icons.remove_red_eye_sharp,
                  color: Colors.black87,
                ),
                CategoryBox(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CatagoryDoctor(
                                  doctorSkills: dentalDoctors,
                                  titile: "دندان",
                                  icon: Icons.details_rounded,
                                  color: Colors.purple,
                                )));
                  },
                  title: "دندان",
                  icon: Icons.details_rounded,
                  color: Colors.purple,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            height: 160,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: const DecorationImage(
                  image: AssetImage('images/imagedoctor.jpg'),
                  fit: BoxFit.cover,
                )),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
              child: const Text(
            "داکتران مشهور",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          )),
          const SizedBox(height: 10),
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 5),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                PopularDoctor(
                  popularDoctors: popularDoctors[0],
                ),
                PopularDoctor(
                  popularDoctors: popularDoctors[1],
                ),
                PopularDoctor(
                  popularDoctors: popularDoctors[2],
                ),
              ],
            ),
          ),
          Container(
              child: const Text(
            "شماره های عاجل",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          )),
          const SizedBox(height: 10),
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 5),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                EmergencyPhone(
                  emergency: emergency[0],
                ),
                EmergencyPhone(
                  emergency: emergency[1],
                ),
                EmergencyPhone(
                  emergency: emergency[2],
                ),
                EmergencyPhone(
                  emergency: emergency[3],
                ),
                EmergencyPhone(
                  emergency: emergency[4],
                ),
                EmergencyPhone(
                  emergency: emergency[5],
                ),
                EmergencyPhone(
                  emergency: emergency[6],
                ),
                EmergencyPhone(
                  emergency: emergency[7],
                ),
                EmergencyPhone(
                  emergency: emergency[8],
                ),
                EmergencyPhone(
                  emergency: emergency[9],
                ),
                EmergencyPhone(
                  emergency: emergency[10],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ]),
      ),
    );
  }
}
