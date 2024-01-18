import 'package:capstone_proj/data/model/rontgen.dart';
import 'package:capstone_proj/data/service/rontgen_service.dart';

class RontgenRepository{
  final RontgenService apiService;

  RontgenRepository({required this.apiService});

  Future<List<Rontgen>> getRontgen(int nik) async{
    try{
      final data = await apiService.getRontgen(nik);

      //ubah API response menjadi list
      return data.map((json) => Rontgen.fromJson(json)).toList();
    }catch(e){
      throw Exception('Failed to fetch rontgen');
    }
  }
}