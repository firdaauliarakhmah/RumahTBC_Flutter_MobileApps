import 'package:capstone_proj/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../data/model/chat.dart';
import '../view_model/chatbot_view_model.dart';
import '../widget/text_field.dart';

class Chatbot extends StatefulWidget {
  final ChatbotViewModel chatbotVM;

  Chatbot({required this.chatbotVM});
  

  @override
  _ChatbotState createState() => _ChatbotState();
}

class _ChatbotState extends State<Chatbot> {
  final TextEditingController request = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  List<Chat> _chatList = [];

  @override
  void initState(){
    // final chatbotVM = Provider.of<ChatbotViewModel>(context,listen: false);
    _chatList = widget.chatbotVM.chatCollection;
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    final chatbotVM = Provider.of<ChatbotViewModel>(context,listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Chatbot',
          style: GoogleFonts.poppins(),
        ),
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/icons/arrow-back.svg',
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: _chatList.length,
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(top: 10,bottom: 10),
                    controller: _scrollController,
                    itemBuilder: (context, index){
                      final messages = _chatList[index];
                      
                      return Container(
                        padding: const EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
                        child: Align(
                          alignment: (messages.messageType == "receiver"?Alignment.topLeft:Alignment.topRight),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: (messages.messageType  == "receiver"?Colors.white70:const Color.fromARGB(255, 80, 184, 168)),
                            ),
                            padding: const EdgeInsets.all(16),
                            child: Text(
                              messages.messageContent, 
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: (messages.messageType  == "receiver"?Colors.black:Colors.white)
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 50)
              ],
            ),
          ),

          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  const SizedBox(width: 15,),
                  Expanded(
                    child: FilledTextField(
                      hint: "Write message . . . ", 
                      nameWeight: FontWeight.normal,
                      controller: request,
                      keyboardType: TextInputType.text,
                      onChange: (value){

                      },
                    ),
                  ),
                  const SizedBox(width: 15),

                  FloatingActionButton(
                    backgroundColor: const Color.fromARGB(255, 80, 184, 168),
                    elevation: 0,
                    child: const Icon(Icons.send,color: Colors.white,size: 25,),
                    onPressed: () async{
                      Map<String,dynamic> req = {
                        'user_message': request.text
                      };
                      
                      chatbotVM.sender(req);

                      request.clear();
                      FocusManager.instance.primaryFocus?.unfocus();
                      setState(() {
                        _chatList = widget.chatbotVM.chatCollection;
                        
                        _scrollController.animateTo(
                          _scrollController.position.maxScrollExtent,
                          curve: Curves.easeOut,
                          duration: const Duration(milliseconds: 500),
                        );
                      });

                      await chatbotVM.chat(req);

                      setState(() {
                        _chatList = widget.chatbotVM.chatCollection;
                        
                        _scrollController.animateTo(
                          _scrollController.position.maxScrollExtent,
                          curve: Curves.easeOut,
                          duration: const Duration(milliseconds: 500),
                        );
                      });
                    },
                  ),

                  // const SizedBox(width: 5),
                ],
                
              ),
            ),
          ),
        ],
      )
    );
  }
}