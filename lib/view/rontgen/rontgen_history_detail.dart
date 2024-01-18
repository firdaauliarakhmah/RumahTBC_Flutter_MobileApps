import 'package:cloudinary_flutter/image/cld_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../data/model/rontgen.dart';
import '../../util/colors.dart';
import '../../widget/text_box.dart';

class RontgenDetail extends StatelessWidget {
  final Rontgen rontgen;
  const RontgenDetail({super.key, required this.rontgen});

  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Riwayat Rontgen',
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
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              Align(
                alignment: Alignment.topCenter,
                child: CldImageWidget(
                  publicId: rontgen.imageURL,
                ),
              ),
              
              const SizedBox(height: 20),

              Card(
                color: Colors.white,
                surfaceTintColor: Colors.white,
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                child: InkWell(
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Informasi hasil rontgen Anda:',
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 10),

                        Column(
                          children: [
                            TitleTextIcon(
                              iconSVGPath: 'assets/icons/hospital.svg', 
                              title: 'Instansi Kesehatan', 
                              content: rontgen.hospital, 
                              iconColor: CustomColors.mainButton
                            ),

                            const SizedBox(height: 5),

                            // TitleTextIcon(
                            //   iconSVGPath: 'assets/icons/location.svg', 
                            //   title: 'Alamat', 
                            //   content: rontgen.address, 
                            //   iconColor: CustomColors.mainButton
                            // ),

                            const SizedBox(height: 5),

                            TitleTextIcon(
                              iconSVGPath: 'assets/icons/doctor.svg', 
                              title: 'Doktor', 
                              content: rontgen.doctor, 
                              iconColor: CustomColors.mainButton
                            ),

                            const SizedBox(height: 5),

                            TitleTextIcon(
                              iconSVGPath: 'assets/icons/calendar.svg', 
                              title: 'Tanggal', 
                              content: rontgen.date, 
                              iconColor: CustomColors.mainButton
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                )
              ),

              Card(
                color: Colors.white,
                surfaceTintColor: Colors.white,
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                child: InkWell(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleContentText(
                          title: 'Hasil Analisa:',
                          content: rontgen.analisa,
                          titleSize: 15,
                          contentSize: 14,
                        ),

                        // const SizedBox(height: 10),

                        // TitleContentText(
                        //   title: 'Hasil Rekomendasi:',
                        //   content: rontgen.rekomendasi,
                        //   titleSize: 15,
                        //   contentSize: 14,
                        // ),
                      ],
                    ),
                  )
                )
              ),

              const SizedBox(height: 150)
            ],
          ),
        )
      )
    );
  }
}
