// import 'package:flutter/material.dart';

// class DoctorBox extends StatelessWidget {
//   DoctorBox({ Key? key, required this.emergency,}) : super(key: key);
 
//   final emergency;
  
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(10),
//       child: Row(
//         children: [
//          const SizedBox(
//             height: 20,
//           ),
//           Expanded(
//             child: emergency.isNotEmpty
//                 ? ListView.builder(
//                     itemCount: emergency.length,
//                     itemBuilder: (context, index) => Card(
//                       key: ValueKey(emergency[index]["id"]),
//                       color: Colors.white,
//                       elevation: 4,
//                       margin: const EdgeInsets.symmetric(vertical: 5),
//                       child: ListTile(
//                           trailing: const CircleAvatar(
//                             radius: 24,
//                             backgroundColor: Color.fromARGB(255, 136, 134, 242),
//                             child: Icon(
//                               Icons.call,
//                               color: Colors.white,
//                             ),
//                           ),
//                           title: Text(emergency[index]['name'],
//                               maxLines: 1,
//                               overflow: TextOverflow.ellipsis,
//                               style: const TextStyle(
//                                   fontSize: 15, fontWeight: FontWeight.w700)),
//                           subtitle: Row(
//                             children: [
//                               Text(
//                                   '${emergency[index]["Address"].toString()} ',
//                                   maxLines: 1,
//                                   overflow: TextOverflow.ellipsis,
//                                   style: const TextStyle(
//                                       fontSize: 13, color: Colors.grey)),
//                             ],
//                           )),
//                     ),
//                   )
//                 : const Text(
//                     'نتیجه یافت نشد',
//                     style: TextStyle(fontSize: 24),
//                   ),
//           ),
//         ],
//       ),
//     );
//   }
// }