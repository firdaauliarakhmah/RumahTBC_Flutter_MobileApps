import 'package:dio/dio.dart';

class ChatbotService{
  late Dio _dio;

  ChatbotService({required Dio dio}){
    _dio = Dio(BaseOptions(
      responseType: ResponseType.json
    ))..interceptors.addAll([

    ]);
  }

  Future<String?> chatBot(Map<String,dynamic> req) async{
    var formData = FormData.fromMap(req);
    try{
      final response =  await _dio.post('http://10.0.2.2:5000/chat', data: formData);

      if(response.statusCode == 200){
        return response.data['response'];
      }else{
        throw Exception('API failed with status code: ${response.statusCode}');
      }
    }catch(e){
      throw Exception("Can't respond: $e");
    }
  }
}