import 'package:mydoctor/data/json.dart';
import 'package:mydoctor/pages/doctor_profile_page.dart';
import 'package:flutter/material.dart';
import '../theme/colors.dart';

class DoctorPage extends StatefulWidget {
  const DoctorPage({Key? key}) : super(key: key);

  @override
  _DoctorPageState createState() => _DoctorPageState();
}

class _DoctorPageState extends State<DoctorPage> {
  final List<Map<String, dynamic>> _allDoctors = [
    {
      "id": 1,
      "name": "پروفیسور دوکتورس سعیده سعید",
      "specialist": "متخصص نسایی ولادی",
      "phone": "+93797609836",
      "Address": "،چهاراهی آمریت",
      "doctor_image": "femaledoctor2.jpg",
      "experiance": "۳۰ سال",
      "certificate": " ۱۰ +",
      "totalPatient": "۱۰۰k  +",
      "time": "۴ عصر الی ۸ شب",
      "labPatient": "۱۰k  +",
      "specialist_list": "m"
    },
    {
      "id": 2,
      "name": "دوکتورس مهوش رسولی",
      "specialist": "متخصص نسایی ولادی",
      "phone": "+93797609836",
      "doctor_image": "femaledoctor2.jpg",
      "specialist_list": "m"
    },
    {
      "id": 3,
      "name": "الحاج دوکتور احمد شاه بارکزی",
      "specialist": "متحصص امراض داخله عمومی",
      "phone": "+93797609836",
      "doctor_image": "maledoctor.jpg",
      "specialist_list": "m"
    },
    {
      "id": 4,
      "name": "دوکتور احمد ضیاء محتسب زاده",
      "specialist": "متحصص داخله عمومی دیابت",
      "phone": "+93797609836",
      "doctor_image": "maledoctor.jpg",
      "specialist_list": "m"
    },
  ];
  @override
  List<Map<String, dynamic>> _foundDoctors = [];

  @override
  initState() {
    // at the beginning, all users are shown
    _foundDoctors = _allDoctors;
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allDoctors;
    } else {
      results = _allDoctors
          .where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundDoctors = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        title: const Text(
          "داکترها",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.only(left: 10),
        //     child: IconButton(
        //       onPressed: () {
        //         bottomsheet(context);
        //       },
        //       icon: const Icon(
        //         Icons.filter_list_rounded,
        //         color: Colors.white,
        //         size: 35,
        //       ),
        //     ),
        //   )
        // ],
      ),
      body: getBody(),
    );
  }

  getBody() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            height: 50,
            decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(50)),
            child: TextField(
              onChanged: (value) => _runFilter(value),
              style: const TextStyle(color: Colors.black),
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  border: InputBorder.none,
                  hintText: "جستجو",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 17)),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: _foundDoctors.isNotEmpty
                ? ListView.builder(
                    itemCount: _foundDoctors.length,
                    itemBuilder: (context, index) => Card(
                      key: ValueKey(_foundDoctors[index]["id"]),
                      color: const Color.fromARGB(255, 248, 249, 249),
                      elevation: 2,
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      child: ListTile(
                          onTap: () {
                            var doctorName =
                                _foundDoctors[index]["name"].toString();
                            var specialist =
                                _foundDoctors[index]["specialist"].toString();
                            var experiance =
                                _foundDoctors[index]["experiance"].toString();
                            var time = _foundDoctors[index]["time"].toString();
                            var totalPatient =
                                _foundDoctors[index]["totalPatient"].toString();
                            var certificate =
                                _foundDoctors[index]["certificate"].toString();
                            var labPatient =
                                _foundDoctors[index]["labPatient"].toString();
                            var address =
                                _foundDoctors[index]["Address"].toString();
                            var phone =
                                _foundDoctors[index]["phone"].toString();
                            var image =
                                _foundDoctors[index]["doctor_image"].toString();
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
                              "images/${_foundDoctors[index]['doctor_image']}",
                              fit: BoxFit.cover,
                              width: 50,
                              height: 80,
                            ),
                          ),
                          title: Text(_foundDoctors[index]['name'],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w700)),
                          subtitle: Row(
                            children: [
                              Text(
                                  '${_foundDoctors[index]["specialist"].toString()} ',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontSize: 13, color: Colors.grey)),
                            ],
                          )),
                    ),
                  )
                : const Text(
                    'نتیجه یافت نشد',
                    style: TextStyle(fontSize: 24),
                  ),
          ),
        ],
      ),
    );
  }
}

// void bottomsheet(context) {
//   showModalBottomSheet(
//       context: context,
//       backgroundColor: Colors.transparent,
//       builder: (context) => const FilterDoctor());
// }

// class FilterDoctor extends StatelessWidget {
//   const FilterDoctor({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         automaticallyImplyLeading: false,
//         elevation: 0,
//         backgroundColor: Colors.blue,
//         title: const Text(
//           "فیلتر به اساس تخصص",
//           style: TextStyle(
//               color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700),
//         ),
//       ),
//       body: Directionality(
//         textDirection: TextDirection.rtl,
//         child: Container(
//           decoration: const BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(24),
//                 topRight: Radius.circular(25),
//               )),
//           child: ListView(
//             scrollDirection: Axis.vertical,
//             shrinkWrap: true,
//             children: const [
//               ListTile(
//                 onTap: null,
//                 title: Text(
//                   "نسایی ولادی",
//                   style: TextStyle(fontSize: 16),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//               ListTile(
//                 onTap: null,
//                 title: Text(
//                   "چشم",
//                   style: TextStyle(fontSize: 16),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//               ListTile(
//                 onTap: null,
//                 title: Text(
//                   "دندان",
//                   style: TextStyle(fontSize: 16),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//               ListTile(
//                 onTap: null,
//                 title: Text(
//                   "مری و معده",
//                   style: TextStyle(fontSize: 16),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//               ListTile(
//                 onTap: null,
//                 title: Text(
//                   " گوش گلو و بینی",
//                   style: TextStyle(fontSize: 16),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//               ListTile(
//                 onTap: null,
//                 title: Text(
//                   "اورتوپیدی",
//                   style: TextStyle(fontSize: 16),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//               ListTile(
//                 onTap: null,
//                 title: Text(
//                   "داخله عمومی",
//                   style: TextStyle(fontSize: 16),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//               ListTile(
//                 onTap: null,
//                 title: Text(
//                   "داخله اطفال",
//                   style: TextStyle(fontSize: 16),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//               ListTile(
//                 onTap: null,
//                 title: Text(
//                   "دیابت",
//                   style: TextStyle(fontSize: 16),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//               ListTile(
//                 onTap: null,
//                 title: Text(
//                   "صحت و روان",
//                   style: TextStyle(fontSize: 16),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//               ListTile(
//                 onTap: null,
//                 title: Text(
//                   "جلدی",
//                   style: TextStyle(fontSize: 16),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//               ListTile(
//                 onTap: null,
//                 title: Text(
//                   "امراض سرطانی",
//                   style: TextStyle(fontSize: 16),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
