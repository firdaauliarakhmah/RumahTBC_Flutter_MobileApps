// import 'dart:convert';
// import 'package:capstone_proj/data/model/article.dart';
// import 'package:capstone_proj/data/service/api_service.dart';
// import 'package:flutter/foundation.dart';
// import 'package:http/http.dart' as http;

// class ArticleViewModel extends ChangeNotifier {
//   final ApiService apiService = ApiService();

//   List<Article> articles = [];
//   List<Article> get article => articles;


//   // Future<void> getArticles() async{
//   //   try{
//   //     final response = await http.get('http:/127.0.0.1:5000/api/artikel' as Uri);
//   //     if(response.statusCode == 200){
//   //       final data = json.decode(response.body);
//   //       articles = List<Article>.from(data.map((article) => Article.fromJson(article)));
//   //       notifyListeners();
//   //     }
//   //   }catch(e){
//   //     if (kDebugMode) {
//   //       print(e);
//   //     }
//   //   }
//   // }

//   Future<void> fetchArticles() async{
//     final response = await http.get(Uri.parse('http://10.0.2.2:5000/api/artikel'));
//     if(response.statusCode == 200){
//       final List<dynamic> data = json.decode(response.body);
//       articles = data.map((json) => Article.fromJson(json)).toList();
//       notifyListeners();
//     }else{
//       // throw Exception('Gagal Mengambil Data');
//     }
//   }

  


//   void loadArticle() {
//     //get from api
//     notifyListeners();
//   }

  
// }
