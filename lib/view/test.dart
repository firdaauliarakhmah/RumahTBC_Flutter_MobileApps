import 'dart:io';

import 'package:capstone_proj/widget/button.dart';
import 'package:capstone_proj/widget/teess2.dart';
import 'package:capstone_proj/widget/text_box.dart';
import 'package:cloudinary_url_gen/transformation/resize/pad.dart';
import 'package:flutter/material.dart';
import 'package:capstone_proj/widget/notification_card.dart';
import 'package:capstone_proj/widget/card.dart';
import 'package:capstone_proj/widget/circle_avatar_profile.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../util/colors.dart';

class tes extends StatelessWidget {
  String c1 = 'asasas';
  String c =
      'asasasas asasas asdasd asdadad asadad asdasd asdads asdads asdasd Ini adalah teks yang sangat panjang dan akan dipotong setelah dua baris.';
  String t = 'test es';
  String date = '20-12-2023 17.00';
  String imageURL =
      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg';
  String title = 'Lorem Ipsum';
  String hospital = 'Rumah Sakit Kalang-kolong Kaleng';
  String address = 'Tegal Utara, Jawa Tengah';
  String content = 'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat';
  String iconPath = 'assets/icons/pneumo.svg';
  List<Map<String,dynamic>> menu = [
      {
        "iconPath" : "assets/icons/pneumo.svg",
        "name" : "Hasil Rontgen",
        // 'route' : MaterialPageRoute(builder: (context) => HomePage())
      },
      {
        "iconPath" : "assets/icons/doctor.svg",
        "name" : "Tanya Dokter",
      // 'route' : MaterialPageRoute(builder: (context) => ask_doctor())
      },
      {
        "iconPath" : "assets/icons/chat.svg",
        "name" : "Chatbot",
      // 'route' : MaterialPageRoute(builder: (context) => Chatbox())
      }
    ];

// const tes({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
          
      children: [
        const SizedBox(
          height: 50,
        ),

//         GalleryImagePicker(
//   onImageSelected: (File image) {
//     // Handle gambar yang dipilih di sini
//     // Contohnya, Anda bisa menampilkan gambar atau mengunggahnya ke server.
//   },
// ),

        ArticleCardCloudinary(
            publicID: "cld-sample-5", title: t, content: content, onPressed: () {}, date: 'a week ago',),
        ArticleCard(imageURL: imageURL, title: t, content: c, onPressed: () {}),
        NotificationCard(title: t, content: c, date: date, onPressed: () {}),
        ButtonIconTextSVG(iconPath: menu[0]['iconPath'], text: menu[0]['name'], backgroundColor: CustomColors.inactiveIcon, onPressed: (){})
      //   NameProfile(
      //     imageURL: imageURL, 
      //     name: 'Balkis Arifatul Fadia', 
      //     imageSize: 75, 
      //     nameSize: 11),

      //   // TitleContentText(title: title, content: content),

      //   Padding(
      //     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      //     child: RontgenHistoryCard(date: date, hospital: hospital, address: address, doctor: ' Dr. Amah Bahari In',),
      //   ),

      //    GridView.builder(
      //       gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
      //         // crossAxisCount: 3
      //         maxCrossAxisExtent: 200
      //       ),
      //       itemCount: menu.length,
      //       itemBuilder: (context, index) {
      //   final menuItem = menu[index];
      //   return GestureDetector(
      //     onTap: () {
      //       // Implementasi navigasi atau tindakan ketika item di-tap
      //       // Misalnya, Anda dapat menggunakan Navigator untuk berpindah halaman.
      //     },
      //     child: Column(
      //       children: [
      //         SvgPicture.asset(
      //           menuItem["iconPath"],
      //           width: 50, // Lebar ikon
      //           height: 50, // Tinggi ikon
      //         ),
      //         Text(
      //           menuItem["name"],
      //           style: TextStyle(fontSize: 16), // Ganti sesuai kebutuhan
      //         ),
      //       ],
      //     ),
      //   );
      // },
      //     ),
        
        

      //   Container(
      //     padding: const EdgeInsets.only(right: 40,left: 40),
      //     child: Column(
      //       children: [
      //         TitleContentText(title: title, content: content)
      //       ],
      //     ),
      //   ),


      ],
    ),
        )
    );
  }
}
