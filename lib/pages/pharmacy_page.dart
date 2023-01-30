import 'package:mydoctor/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PharmacyPage extends StatefulWidget {
  PharmacyPage({Key? key}) : super(key: key);

  @override
  State<PharmacyPage> createState() => _PharmacyPageState();
}

class _PharmacyPageState extends State<PharmacyPage> {
  @override
  final List<Map<String, dynamic>> _allPharmacy = [
    {
      "id": 1,
      "name": "دواخانه شریف",
      "phone": "0797609836",
      "Address": "جاده عید گاه",
    },
    {
      "id": 2,
      "name": "دواخانه موفق",
      "phone": "0797609839",
      "Address": "چوک شهر نو، مارکت حضرت ها",
    },
  ];
  @override
  List<Map<String, dynamic>> _foundPharmacy = [];
  @override
  initState() {
    // at the beginning, all users are shown
    _foundPharmacy = _allPharmacy;
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allPharmacy;
    } else {
      results = _allPharmacy
          .where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundPharmacy = results;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        title: const Text(
          "دواخانه ها",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
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
            child: _foundPharmacy.isNotEmpty
                ? ListView.builder(
                    itemCount: _foundPharmacy.length,
                    itemBuilder: (context, index) => Card(
                      key: ValueKey(_foundPharmacy[index]["id"]),
                      color: const Color.fromARGB(255, 248, 249, 249),
                      elevation: 2,
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      child: ListTile(
                          trailing: CircleAvatar(
                            radius: 24,
                            backgroundColor:
                                const Color.fromARGB(255, 136, 134, 242),
                            child: IconButton(
                              onPressed: () {
                                var url =
                                    // ignore: prefer_interpolation_to_compose_strings
                                    Uri.parse('tel:' +
                                        _foundPharmacy[index]['phone']);
                                launchUrl(url);
                              },
                              icon: const Icon(Icons.call),
                              color: Colors.white,
                            ),
                          ),
                          title: Text(_foundPharmacy[index]['name'],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w700)),
                          subtitle: Row(
                            children: [
                              const Icon(
                                Icons.location_on,
                                color: Colors.red,
                                size: 18,
                              ),
                              const SizedBox(
                                width: 3,
                              ),
                              Text(
                                  '${_foundPharmacy[index]["Address"].toString()} ',
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
