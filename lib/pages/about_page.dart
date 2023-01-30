import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({
    Key? key,
  }) : super(key: key);

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
            "درباره ما",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          ),
        ),
        body: getBody(),
      ),
    );
  }

  getBody() {
    return SingleChildScrollView(
      padding: EdgeInsets.only(left: 15, right: 15),
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
                children: const [
                  Text("فیروز احمد محمدی",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "اینجینر نرم افزار",
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
              ClipRRect(
                //doctor['image']
                //images/${_foundUsers[index]['doctor_image']}
                borderRadius: BorderRadius.circular(50.0),
                child: Image.asset(
                  "images/firooz.jpg",
                  fit: BoxFit.cover,
                  width: 80,
                  height: 90,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          const Text(
              "با طبیبان ، آدرس و شماره تماس داکتران و مراکز درمانی در سراسر کشور به صورت رایگان در دستان شما است.طبیبان در سال ۱۴۰۱ جهت معرفی داکتران ولایت هرات راه اندازی شد و هدف آن در اختیار گذاشتن اطلاعات داکتران، شفاخانه ها، لابراتوار ها و دواخانه های شهر هرات می باشد. علاوه بر این طبیبان سعی کرده با راه اندازی و ایجاد بخش هایی جهت اخذ نوبت برای مریضان سهولت ایجاد کند‏ و طبیبان تمام تلاش خود را در بهبود این مسیر خواهد نمود."),
          const SizedBox(
            height: 40,
          ),
          const Text(
              "منتظر نظرات و پیشنهادات شما عزیزان برای بهتر ساختن آبلیکیشن طبیبان هستم"),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  color: Colors.transparent,
                  child: IconButton(
                    onPressed: () async {
                      var url = Uri.parse(
                          'fb://facewebmodal/f?href=https://www.facebook.com/tabiban.softwares');
                      launchUrl(url);
                    },
                    icon: const Icon(
                      Icons.facebook,
                      color: Colors.blue,
                      size: 35,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  color: Colors.transparent,
                  child: IconButton(
                    onPressed: () async {
                      var url = Uri.parse(
                          'mailto:firoozmohammadi555@gmail.com?subject=Hi Eng Firooz Ahmad Mohammadi');
                      launchUrl(url);
                    },
                    icon: const Icon(
                      Icons.email,
                      color: Color.fromARGB(255, 94, 135, 232),
                      size: 35,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  color: Colors.transparent,
                  child: IconButton(
                    onPressed: () async {
                      var url = Uri.parse('https://t.me/software_station');
                      launchUrl(url);
                    },
                    icon: const Icon(
                      Icons.telegram,
                      color: Colors.blue,
                      size: 35,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  color: Colors.transparent,
                  child: IconButton(
                    onPressed: () async {
                      var url = Uri.parse("tel:0797609836");
                      launchUrl(url);
                    },
                    icon: const Icon(
                      Icons.phone,
                      color: Colors.green,
                      size: 35,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
