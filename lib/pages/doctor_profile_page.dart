import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:mydoctor/data/json.dart';
import 'package:mydoctor/theme/colors.dart';
import 'package:mydoctor/widgets/contact_box.dart';
import 'package:mydoctor/widgets/doctor_info_box.dart';
import 'package:mydoctor/widgets/mybutton.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DoctorProfilePage extends StatelessWidget {
  DoctorProfilePage(
      {Key? key,
      this.doctor,
      this.doctorName,
      this.specialist,
      this.experiance,
      this.time,
      this.totalPatient,
      this.certificate,
      this.labPatient,
      this.address,
      this.phone,
      this.image,
      this.email,
      this.facebook})
      : super(key: key);
  var doctor;
  var doctorName;
  var specialist;
  var experiance;
  var time;
  var totalPatient;
  var certificate;
  var labPatient;
  var address;
  var phone;
  var image;
  var email;
  var facebook;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            "مشخصات داکتر",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          ),
        ),
        body: getBody(),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 7),
          child: MyButton(
              disableButton: false,
              bgColor: primary,
              title: "درخواست برای اخذ نوبت",
              onTap: () async {
                await FlutterPhoneDirectCaller.callNumber(phone);
              }),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  getBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 15, right: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(doctorName,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w700)),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    specialist,
                    style: const TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
              ClipRRect(
                //doctor['image']
                //images/${_foundUsers[index]['doctor_image']}
                borderRadius: BorderRadius.circular(50.0),
                child: Image.asset(
                  "images/$image",
                  fit: BoxFit.cover,
                  width: 80,
                  height: 90,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          // ignore: prefer_interpolation_to_compose_strings
          Text("وقت ملاقات: " + time + "",
              style: const TextStyle(fontSize: 13, color: Colors.green)),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ContactBox(
                icons: Icons.facebook,
                color: Colors.blue,
                onTap: () async {
                  var url = Uri.parse(facebook);
                  launchUrl(url);
                },
              ),
              ContactBox(
                icons: Icons.email,
                color: Colors.green,
                onTap: () async {
                  var url = Uri.parse(email);
                  launchUrl(url);
                },
              ),
              ContactBox(
                icons: Icons.chat_rounded,
                color: Colors.purple,
                onTap: () {
                  var url = Uri.parse('sms:$phone?body=سلام%20');
                  launchUrl(url);
                },
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DoctorInfoBox(
                value: totalPatient,
                info: "مریضان موفق",
                icon: Icons.groups_rounded,
                color: Colors.green,
              ),
              DoctorInfoBox(
                value: experiance,
                info: " تجریه کاری",
                icon: Icons.medical_services_rounded,
                color: Colors.purple,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DoctorInfoBox(
                value: labPatient,
                info: "تشخیص مریضان",
                icon: Icons.bloodtype_rounded,
                color: Colors.blue,
              ),
              DoctorInfoBox(
                value: certificate,
                info: "مدارک طبی",
                icon: Icons.card_membership_rounded,
                color: Colors.orange,
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Text.rich(
            TextSpan(
              children: [
                const TextSpan(
                  text: "آدرس: ",
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                TextSpan(
                  text: address,
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
