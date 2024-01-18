import 'package:flutter/material.dart';

import '../data/model/chat.dart';
import '../data/repository/chatbot_repository.dart';

class ChatbotViewModel extends ChangeNotifier{
  final ChatbotRepository chatbotRepository;

  ChatbotViewModel({required this.chatbotRepository});

  List<Chat> _chatCollection = [Chat(messageContent: "Halo! Apakah ada yang ingin ditanyakan mengenai TBC?", messageType: "receiver")];
  String? _response;
  String _errorMessage = '';
  bool _loading = false;

  List<Chat> get chatCollection => _chatCollection;
  String? get response => _response;
  String get errorMessage => _errorMessage;
  bool get loading => _loading;

  Future<void> chat(Map<String,dynamic> req) async{
    _loading = true;
    notifyListeners();

    try{
      _response = await chatbotRepository.chat(req);
      _chatCollection.add(Chat(messageContent: _response!, messageType: "receiver"));
    }catch(e){
      _errorMessage = e.toString();
    }finally{
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> sender(Map<String,dynamic> req) async{
    _chatCollection.add(Chat(messageContent: req['user_message'], messageType: "sender"));
  }
}