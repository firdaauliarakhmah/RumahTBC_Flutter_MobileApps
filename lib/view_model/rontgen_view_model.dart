import 'package:flutter/material.dart';
import '../data/model/rontgen.dart';
import '../data/repository/rontgen_repository.dart';
import 'user_view_model.dart';

class RontgenViewModel extends ChangeNotifier {
  final RontgenRepository rontgenRepository;

  RontgenViewModel({required this.rontgenRepository});


  // int nik = int.parse('1111112');

  List<Rontgen> _rontgens = [];
  bool _loading = false;
  String _errorMessage = '';

  //getter
  List<Rontgen> get rontgens => _rontgens;
  bool get loading => _loading;
  String get errorMessage => _errorMessage;

  Future<void> fetchRontgen(int nik) async{
    _loading = true;
    _errorMessage = '';

    try{
      //TO DO: get nik dari login untuk get rontgen history
      _rontgens = await rontgenRepository.getRontgen(nik);
    }catch(e){
      _errorMessage = 'Failed tp fetch rontgen';
    }finally{
      //setelah selesai memanggil API set loading ke false kembali
      _loading = false;
      notifyListeners();
    }
  }
  
}