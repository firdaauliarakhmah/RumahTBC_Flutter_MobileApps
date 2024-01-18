import 'package:capstone_proj/data/service/chatbot_service.dart';

class ChatbotRepository{
  final ChatbotService apiService;

  ChatbotRepository({required this.apiService});

  Future<String?> chat(Map<String,dynamic> req) async{
    try{
      final response = await apiService.chatBot(req);
      return response;
    }catch(e){
      throw Exception('Failed to get response: $e');
    }
  }
}