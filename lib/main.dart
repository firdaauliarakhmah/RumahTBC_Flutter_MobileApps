import 'package:capstone_proj/view/home.dart';
import 'package:capstone_proj/view/login_regist/get_started.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:cloudinary_flutter/cloudinary_context.dart';
import 'package:cloudinary_url_gen/cloudinary.dart';
import 'package:provider/provider.dart';
import 'data/repository/article_repository.dart';
import 'data/repository/chatbot_repository.dart';
import 'data/repository/rontgen_repository.dart';
import 'data/repository/user_repository.dart';
import 'data/service/article_service.dart';
import 'data/service/chatbot_service.dart';
import 'data/service/rontgen_service.dart';
import 'data/service/user_service.dart';
import 'util/colors.dart';
import 'view/chatbot.dart';
import 'view_model/article_view_model.dart';
import 'view_model/chatbot_view_model.dart';
import 'view_model/rontgen_view_model.dart';
import 'view_model/user_view_model.dart';


void main() {
  final Dio dio = Dio();
  final ArticleService articleService = ArticleService(dio: dio);
  final RontgenService rontgenService = RontgenService(dio: dio);
  final UserService userService = UserService(dio: dio);
  final ChatbotService chatbotService = ChatbotService(dio: dio);
  
  final ArticleRepository articleRepository = ArticleRepository(apiService: articleService);
  final RontgenRepository rontgenRepository = RontgenRepository(apiService: rontgenService);
  final UserRepository userRepository = UserRepository(apiService: userService);
  final ChatbotRepository chatbotRepository = ChatbotRepository(apiService: chatbotService);

  CloudinaryContext.cloudinary =
        Cloudinary.fromCloudName(cloudName: "drjnb5zxa");
        
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<RontgenViewModel>(
          create: (context) => RontgenViewModel(rontgenRepository: rontgenRepository)
        ),

        ChangeNotifierProvider<ArticleViewModel>(
          create: (context) => ArticleViewModel(articleRepository: articleRepository)
        ),

        ChangeNotifierProvider<UserViewModel>(
          create: (context) => UserViewModel(userRepository: userRepository)
        ),

        ChangeNotifierProvider<ChatbotViewModel>(
          create: (context) => ChatbotViewModel(chatbotRepository: chatbotRepository)
        )
      ],
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) { 
    final chatbotVM = Provider.of<ChatbotViewModel>(context,listen: false);

    return MaterialApp(
      // title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting controller.the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        scaffoldBackgroundColor: CustomColors.mainBackground,
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const GetStarted(),
    );
  }
}
