import 'package:flutter/material.dart';
import 'package:mydoctor/data/json.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyPhone extends StatelessWidget {
  EmergencyPhone({Key? key, required this.emergency}) : super(key: key);
  var emergency;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(right: 15),
        padding: const EdgeInsets.all(15),
        width: 270,
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
        child: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      emergency["name"],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      emergency["address"],
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 30,
                ),
                CircleAvatar(
                  radius: 24,
                  backgroundColor: const Color.fromARGB(255, 136, 134, 242),
                  child: IconButton(
                    icon: const Icon(Icons.call),
                    color: Colors.white,
                    onPressed: () async {
                      // ignore: prefer_interpolation_to_compose_strings
                      var url = Uri.parse('tel:' + emergency['phone']);
                      launchUrl(url);
                    },
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
