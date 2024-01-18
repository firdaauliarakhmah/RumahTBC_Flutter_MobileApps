import 'package:cloudinary_flutter/image/cld_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../data/model/article.dart';
import '../../util/colors.dart';

class ArticleDetail extends StatelessWidget {
  final Article article;
  const ArticleDetail({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Artikel Kesehatan',
          style: GoogleFonts.poppins(),
        ),
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/icons/arrow-back.svg',
            width: 40,
            height: 40,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Card(
          color: Colors.white,
          surfaceTintColor: Colors.white,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
          child: InkWell(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),

                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Text(
                          article.title,
                          style: GoogleFonts.poppins(
                              fontSize: 22, 
                              fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                        ),

                        const SizedBox(height: 5),

                        Text(
                          article.penulis,
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: CustomColors.textFieldBorderInactive
                          ),
                        ),
                        const SizedBox(height: 10),

                        CldImageWidget(
                            publicId: article.imageURL,
                            // transformation: Transformation()
                            //   ..resize(Resize.scale()
                            //   ..width(screenWidth - 40))
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  Text(
                    article.content,
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                    ),
                  ),

                  const SizedBox(height: 20),
                  
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Divalidasi Oleh: ${article.penulis}',
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: CustomColors.inactiveIcon
                        ),
                      ),
                      Text(
                        'Tanggal Publikasi: ${article.date}',
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: CustomColors.inactiveIcon
                        ),
                      ),
                      Text(
                        'Kategori: ${article.category}',
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: CustomColors.inactiveIcon
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 150),
                ],
              )
            ),
          ),
        ),
      ),
    );
  }
}


        // title: Padding(
        //   padding: const EdgeInsets.only(top: 15, bottom: 10),
        //   child: Text(
        //   'Artikel Kesehatan',
        //   style: GoogleFonts.poppins(),
        // ),
        // ),