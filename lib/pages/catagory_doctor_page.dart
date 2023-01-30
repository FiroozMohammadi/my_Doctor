import 'package:mydoctor/data/json.dart';
import 'package:flutter/material.dart';
import 'package:mydoctor/pages/doctor_page.dart';
import 'doctor_profile_page.dart';

class CatagoryDoctor extends StatelessWidget {
  CatagoryDoctor(
      {Key? key,
      required this.color,
      required this.icon,
      required this.titile,
      required this.doctorSkills})
      : super(key: key);
  final color;
  final icon;
  final titile;
  var doctorSkills;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: color,
          elevation: 0,
          title: Text(
            titile,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600),
          ),
          actions: <Widget>[
            Container(
              padding: const EdgeInsets.only(left: 15),
              child: Icon(
                icon,
                color: Colors.white,
              ),
            )
          ],
        ),
        body: getBody(),
      ),
    );
  }

  getBody() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Expanded(
              child: ListView.builder(
            itemCount: doctorSkills.length,
            itemBuilder: (context, index) => Card(
              key: ValueKey(doctorSkills[index]["id"]),
              color: const Color.fromARGB(255, 248, 249, 249),
              elevation: 2,
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: ListTile(
                  onTap: () {
                    var doctorName = doctorSkills[index]["name"].toString();
                    var specialist =
                        doctorSkills[index]["specialist"].toString();
                    var experiance =
                        doctorSkills[index]["experiance"].toString();
                    var time = doctorSkills[index]["time"].toString();
                    var totalPatient =
                        doctorSkills[index]["totalPatient"].toString();
                    var certificate =
                        doctorSkills[index]["certificate"].toString();
                    var labPatient =
                        doctorSkills[index]["labPatient"].toString();
                    var address = doctorSkills[index]["Address"].toString();
                    var phone = doctorSkills[index]["phone"].toString();
                    var image = doctorSkills[index]["doctor_image"].toString();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DoctorProfilePage(
                                  doctorName: doctorName,
                                  specialist: specialist,
                                  experiance: experiance,
                                  time: time,
                                  totalPatient: totalPatient,
                                  certificate: certificate,
                                  labPatient: labPatient,
                                  address: address,
                                  phone: phone,
                                  image: image,
                                )));
                  },
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(50.0),
                    child: Image.asset(
                      "images/${doctorSkills[index]['doctor_image']}",
                      fit: BoxFit.cover,
                      width: 50,
                      height: 80,
                    ),
                  ),
                  title: Text(doctorSkills[index]['name'].toString(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w700)),
                  subtitle: Row(
                    children: [
                      Text('${doctorSkills[index]["specialist"].toString()} ',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 13, color: Colors.grey)),
                    ],
                  )),
            ),
          )),
        ],
      ),
    );
  }
}
