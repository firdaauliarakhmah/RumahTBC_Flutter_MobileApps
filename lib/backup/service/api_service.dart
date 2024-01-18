// import 'package:capstone_proj/data/model/article.dart';
// import 'package:capstone_proj/data/model/user.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class ApiService {

//   Future<List<Article>> getArticles() async {
//     final response = await http.get(Uri.parse('http://127.0.0.1/api/artikel'));

//     if (response.statusCode == 200) {
//       final List<dynamic> data = json.decode(response.body);
//       return data.map((json) => Article.fromJson(json)).toList();
//     } else {
//       throw Exception('Gagal mengambil data');
//     }
//   }

//   Future<User> getUserById(String userId) async{
//     final response = await http.get('http://127.0.0.1/users/$userId' as Uri);
    
//     if(response.statusCode == 200){
//       final data = json.decode(response.body);
//       return User.fromJson(data);
//     } else {
//       throw Exception('Gagal mengambil data');
//     }
//   }


// }
