import 'package:dio/dio.dart';

class RontgenService {
  final Dio _dio;

  RontgenService({required Dio dio}) : _dio = dio;

  Future<List<dynamic>> getRontgen(int nik) async{
    try{
      final response = await _dio.get('http://10.0.2.2:5000/api/rontgen/$nik');

      if(response.statusCode == 200){
        return response.data;
      }else{
        throw Exception('API failed with status code: ${response.statusCode}');
      }
    }catch (e){
      throw Exception("Can't get rontgen screening : $e");
    }
  }
}