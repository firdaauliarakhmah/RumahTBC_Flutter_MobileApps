// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';

// import '../../data/model/rontgen.dart';
// import '../../widget/card.dart';
// import 'rontgen_history_detail.dart';

// class RontgenHistoryList extends StatelessWidget {
// const RontgenHistoryList({ Key? key }) : super(key: key);

//   @override
//   Widget build(BuildContext context){
//     List<Rontgen> rontgenlist = [
//       Rontgen(
//         id: '1', 
//         hospital: 'RS Islam Harapan Andaassssssssassssssssssssssssssssssssssssssssssssss', 
//         address: 'Tegal Utara Kelurahan pulu-pulu 1', 
//         date: '12-11-2023', 
//         imageURL: 'sample', 
//         doctor: 'Dr. Pulu-pulu asssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss', 
//         analisa: 'Anda terkena TBC karena terjadi ....... seperti yang telihat pada hasil rontgen. Terdapat .... pada ......',
//         rekomendasi: 'Sebaiknya jangan gegabah, jangan ini itu'
//       ),
//       Rontgen(
//         id: '2', 
//         hospital: 'RS Umum Daerah Kardinah', 
//         address: 'Tegal Utara Kelurahan pulu-pulu 1', 
//         date: '12-12-2023', 
//         imageURL: 'sample', 
//         doctor: 'Drs. Pulu-pulu Pulu',
//         analisa: 'Anda terkena TBC karena terjadi ....... seperti yang telihat pada hasil rontgen. Terdapat .... pada ......',
//         rekomendasi: 'Sebaiknya jangan gegabah, jangan ini itu'
//       ),
//       Rontgen(
//         id: '2', 
//         hospital: 'RS Mitra Keluarga', 
//         address: 'Tegal Utara Kelurahan pulu-pulu 1', 
//         date: '12-01-2024', 
//         imageURL: 'sample', 
//         doctor: 'Dr. Pulu-pulu',
//         analisa: 'Anda terkena TBC karena terjadi ....... seperti yang telihat pada hasil rontgen. Terdapat .... pada ......',
//         rekomendasi: 'Sebaiknya jangan gegabah, jangan ini itu'
//       ),
//     ];

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Riwayat Rontgen',
//           style: GoogleFonts.poppins(),),
//         leading: IconButton(
//           icon: SvgPicture.asset(
//             'assets/icons/arrow-back.svg',
//             width: 40,
//             height: 40,
//           ),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
//         child: ListView.builder(
//           itemCount: rontgenlist.length,
//           itemBuilder: (context, index) {
//             final rontgen = rontgenlist[index];
//             return Padding(
//               padding: const EdgeInsets.symmetric(vertical: 5),
//               child: RontgenHistoryCard(
//                 date: rontgen.date, 
//                 hospital: rontgen.hospital, 
//                 doctor: rontgen.doctor, 
//                 address: rontgen.address,
//                 onPressed: (){
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => RontgenDetail(rontgen: rontgen))
//                   );
//                 },
//               )
//             );
//           }
//         ),
//       )
//     );
//   }
// }