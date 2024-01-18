import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../view_model/rontgen_view_model.dart';
import '../../view_model/user_view_model.dart';
import '../../widget/card.dart';
import 'rontgen_history_detail.dart';

class RontgenHistoryList extends StatefulWidget {
  const RontgenHistoryList({ Key? key }) : super(key: key);

  @override
  _RontgenHistoryListState createState() => _RontgenHistoryListState();
}

class _RontgenHistoryListState extends State<RontgenHistoryList> {
  @override
  void initState(){
    super.initState();

    final userViewModel = Provider.of<UserViewModel>(context, listen: false);
    final rontgenViewModel = Provider.of<RontgenViewModel>(context, listen: false);
    // int nik = int.parse(userViewModel.response!);
    // rontgenViewModel.fetchRontgen();
    if(userViewModel.response != null){
      int nik = int.parse(userViewModel.response!);
      rontgenViewModel.fetchRontgen(nik);
    }
  }

  @override
  Widget build(BuildContext context) {
    final rontgenVM = Provider.of<RontgenViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Riwayat Rontgen',
          style: GoogleFonts.poppins(),),
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
      body
      : rontgenVM.loading ? const Center(child: CircularProgressIndicator())
      : rontgenVM.errorMessage.isNotEmpty ? Center(child: Text(rontgenVM.errorMessage))
      : rontgenVM.rontgens.isEmpty ? const Center(child: Text("Anda belum melakukan pemeriksaan"))
      : Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
        child: ListView.builder(
          itemCount: rontgenVM.rontgens.length,
          itemBuilder: (context, index) {
            final rontgen = rontgenVM.rontgens[index];

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: RontgenHistoryCard(
                date: rontgen.date, 
                hospital: rontgen.hospital, 
                doctor: rontgen.doctor, 
                // address: rontgen.address,
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RontgenDetail(rontgen: rontgen))
                  );
                },
              )
            );
          }
        ),
      )
    );
  }
}