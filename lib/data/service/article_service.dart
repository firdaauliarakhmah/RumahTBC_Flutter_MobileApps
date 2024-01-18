import 'package:dio/dio.dart';

class ArticleService {
  final Dio _dio;

  ArticleService({required Dio dio}) : _dio = dio;



  Future<List<dynamic>> getArticles() async{
    try {
      final response = await _dio.get('http://10.0.2.2:5000/api/artikel');

      if(response.statusCode == 200){
        return response.data;
      }else{
        throw Exception('API failed with status code: ${response.statusCode}');
      }
    }catch (e){
      throw Exception("Can't get article : $e");
    }
  }


  // Future<List<dynamic>> getRontgen() async{
  //   try{
  //     final response = await _dio.get('http://10.0.2.2:5000/api/rontgen');

  //     if(response.statusCode == 200){
  //       return response.data;
  //     }else{
  //       throw Exception('API failed with status code: ${response.statusCode}');
  //     }
  //   }catch (e){
  //     throw Exception("Can't get rontgen screening : $e");
  //   }
  // }

  // // Future<List<dynamic>> getRontgen(int nik) async{
  // //   try{
  // //     final response = await _dio.get('http://10.0.2.2:5000/api/rontgen/$nik');

  // //     if(response.statusCode == 200){
  // //       return response.data;
  // //     }else{
  // //       throw Exception('API failed with status code: ${response.statusCode}');
  // //     }
  // //   }catch (e){
  // //     throw Exception("Can't get rontgen screening : $e");
  // //   }
  // // }

  // Future<dynamic> getUserData(String nik) async{
  //   try{
  //     final response = await _dio.get('http://10.0.2.2:5000/api/user/$nik');

  //     if(response.statusCode == 200){
  //       return response.data;
  //     }else{
  //       throw Exception('API failed with status code: ${response.statusCode}');
  //     }
  //   }catch (e){
  //     throw Exception("Can't get rontgen screening : $e");
  //   }
  // }
}