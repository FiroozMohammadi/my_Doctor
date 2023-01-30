// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../pages/doctor_profile_page.dart';
import 'package:mydoctor/data/json.dart';

class PopularDoctor extends StatelessWidget {
  PopularDoctor({Key? key, this.popularDoctors}) : super(key: key);
  final popularDoctors;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(right: 15),
        padding: const EdgeInsets.all(10),
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(1, 1), // changes position of shadow
            ),
          ],
        ),
        child: TextButton(
          onPressed: () {
            var doctorName = popularDoctors["name"].toString();
            var specialist = popularDoctors["specialist"].toString();
            var experiance = popularDoctors["experiance"].toString();
            var time = popularDoctors["time"].toString();
            var totalPatient = popularDoctors["totalPatient"].toString();
            var certificate = popularDoctors["certificate"].toString();
            var labPatient = popularDoctors["labPatient"].toString();
            var address = popularDoctors["Address"].toString();
            var phone = popularDoctors["phone"].toString();
            var image = popularDoctors["doctor_image"].toString();
            var facebook = popularDoctors["facebook"].toString();
            var email = popularDoctors["email"].toString();
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
                          facebook: facebook,
                          email: email,
                        )));
          },
          child: Row(
            children: [
              ClipRRect(
                //images/${_foundUsers[index]['doctor_image']}
                borderRadius: BorderRadius.circular(50.0),
                child: Image.asset(
                  "images/${popularDoctors['doctor_image']}",
                  fit: BoxFit.cover,
                  width: 55,
                  height: 75,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    popularDoctors["name"],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    popularDoctors["specialist"],
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 14,
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      Text(
                        "مشاهده: ${popularDoctors["totalPatient"]}",
                        style: const TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
