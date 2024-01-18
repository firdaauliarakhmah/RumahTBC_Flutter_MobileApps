import 'package:cloudinary_flutter/image/cld_image.dart';
import 'package:cloudinary_url_gen/transformation/gravity/gravity.dart';
import 'package:cloudinary_url_gen/transformation/resize/resize.dart';
import 'package:cloudinary_url_gen/transformation/transformation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/model/article.dart';
import '../util/colors.dart';

//Cloudinary Image with date
class ArticleCardCloudinary extends StatelessWidget {
  final String publicID;
  final String title;
  final String content;
  final String date;
  final VoidCallback onPressed;
  final double titleSize;
  final double contentSize;

  const ArticleCardCloudinary(
      {required this.publicID,
      required this.title,
      required this.content,
      required this.date,
      required this.onPressed,
      this.titleSize = 15.0,
      this.contentSize = 12.0});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: InkWell(
        onTap: onPressed,
        child: Row(
          children: [
            CldImageWidget(
                publicId: publicID,
                transformation: Transformation()
                  ..resize(Resize.crop()
                    ..width(90)
                    ..height(90)
                    ..gravity(Gravity.autoGravity()))),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 25, left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      title,
                      style: GoogleFonts.poppins(
                          fontSize: titleSize,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    const SizedBox(height: 2.0),
                    Text(
                      content,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.poppins(
                          fontSize: contentSize,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    const SizedBox(height: 2.0),
                    Text(
                      date,
                      style: GoogleFonts.poppins(
                          fontSize: contentSize,
                          fontWeight: FontWeight.w500,
                          color: CustomColors.inactiveIcon),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}

//without date
class ArticleCardBoxCloudinary2 extends StatelessWidget {
  final Article article;
  final double titleSize;
  final double contentSize;
  final VoidCallback onPressed;

  const ArticleCardBoxCloudinary2({
    required this.article, 
    this.titleSize = 15.0, 
    this.contentSize = 12.0,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        child: Container(
          padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
          child: Row(
            children: [
              CldImageWidget(
                  publicId: article.imageURL!,
                  transformation: Transformation()
                    ..resize(Resize.crop()
                      ..width(90)
                      ..height(80)
                      ..gravity(Gravity.autoGravity()))),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 25, left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        article.title,
                        style: GoogleFonts.poppins(
                            fontSize: titleSize,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      const SizedBox(height: 2.0),
                      Text(
                        article.content,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.poppins(
                            fontSize: contentSize,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      const SizedBox(height: 2.0),
                      Text(
                        article.date,
                        style: GoogleFonts.poppins(
                            fontSize: contentSize,
                            fontWeight: FontWeight.w500,
                            color: CustomColors.inactiveIcon),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}


//with white space
class ArticleCardCloudinary3 extends StatelessWidget {
  final String publicID;
  final String title;
  final String content;
  final String date;
  final VoidCallback onPressed;
  final double titleSize;
  final double contentSize;
  final int maxLine;

  const ArticleCardCloudinary3(
      {required this.publicID,
      required this.title,
      required this.content,
      required this.date,
      required this.onPressed,
      this.titleSize = 15.0,
      this.contentSize = 12.0,
      this.maxLine = 2});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              CldImageWidget(
                publicId: publicID,
                transformation: Transformation()
                  ..resize(Resize.crop()
                    ..width(90)
                    ..height(110)
                    ..gravity(Gravity.autoGravity()))
              ),
              const SizedBox(width: 3),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        // textAlign: TextAlign.justify,
                        style: GoogleFonts.poppins(
                            fontSize: titleSize,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        content,
                        maxLines: maxLine,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.poppins(
                            fontSize: contentSize,
                            fontWeight: FontWeight.normal,
                            color: Colors.black),
                      ),
                      const SizedBox(height: 2.0),
                      Text(
                        date,
                        style: GoogleFonts.poppins(
                            fontSize: contentSize,
                            fontWeight: FontWeight.w500,
                            color: CustomColors.inactiveIcon),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}

//Flutter Image
class ArticleCard extends StatelessWidget {
  final String imageURL;
  final String title;
  final String content;
  final VoidCallback onPressed;
  final double titleSize;
  final double contentSize;

  const ArticleCard(
      {required this.imageURL,
      required this.title,
      required this.content,
      required this.onPressed,
      this.titleSize = 15.0,
      this.contentSize = 12.0});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        // margin: EdgeInsets.only(top: 10,bottom: 10,left: 10),
      child: Container(
        padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
          child: Row(
          children: [
            Image(
              image: NetworkImage(imageURL),
              width: 90,
              height: 80,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 25, left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Judul Artikel',
                      style: GoogleFonts.poppins(
                          fontSize: titleSize,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    const SizedBox(height: 2.0),
                    Text(
                      'Ini adalah sebagian isi artikel yang cukup panjang. Artikel ini berisi konten yang sangat menarik dan informatif. asgajshajs ajsgahsgaj ajshgajhsga sajsgajhsag sajhsgajsga hasgahs',
                      maxLines: 2, // Batasi isi artikel menjadi 3 baris
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                          fontSize: contentSize,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )  
    );
  }
}

class RontgenHistoryCard extends StatelessWidget {
  final String date;
  final String hospital;
  final String doctor;
  // final String address;
  final VoidCallback onPressed;

const RontgenHistoryCard({
  required this.date,
  required this.hospital,
  required this.doctor,
  // required this.address,
  required this.onPressed
});

  @override
  Widget build(BuildContext context){
    Color iconColor = const Color.fromARGB(255, 114, 114, 114);
    return Card(
      color: Colors.white,
      surfaceTintColor: Colors.white,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
      child: InkWell(
        // padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                date,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.normal
                )
              ),

              const SizedBox(height: 5),

              Text(
                hospital,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),

              // const SizedBox(height: 5),

              // Row(
              //   children: [
              //     SvgPicture.asset(
              //       'assets/icons/location.svg',
              //       height: 15,
              //       colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
              //     ),
                  
              //     const SizedBox(width: 5),

              //     Text(
              //       address,
              //       maxLines: 1,
              //       overflow: TextOverflow.ellipsis,
              //       style: GoogleFonts.poppins(
              //         fontSize: 13,
              //         fontWeight: FontWeight.w600
              //       ),
              //     )
              //   ],
              // ),
              
              const SizedBox(height: 10),
              
              Text(
                doctor,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.normal
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final String title;
  final String content;
  final String date;
  final VoidCallback onPressed;
  final double titleSize;
  final double contentSize;

  const NotificationCard(
      {required this.title,
      required this.content,
      required this.date,
      required this.onPressed,
      this.titleSize = 18.0,
      this.contentSize = 12.0});

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        child: Container(
          padding: const EdgeInsets.only(top: 10, bottom: 10,right: 25,left: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: GoogleFonts.poppins(
                    fontSize: titleSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),

              const SizedBox(height: 2.0),

              Text(
                content,
                textAlign: TextAlign.justify,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                    fontSize: contentSize,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),

              const SizedBox(height: 8.0),

              Text(
                date,
                style: GoogleFonts.poppins(
                    fontSize: contentSize,
                    fontWeight: FontWeight.w500,
                    color: CustomColors.inactiveIcon),
              ),
            ],
          ),
        ),
    );
  }
}