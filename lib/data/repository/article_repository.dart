import 'package:capstone_proj/data/model/article.dart';
import 'package:capstone_proj/data/service/article_service.dart';

class ArticleRepository{
  final ArticleService apiService;

  ArticleRepository({required this.apiService});

  Future<List<Article>> getArticles() async{
    try{
      //memanggil method dari apiService untuk ambil data dari API
      final data = await apiService.getArticles();

      //ubah API response menjadi list
      return data.map((json) => Article.fromJson(json)).toList();
    }catch(e){
      throw Exception('Failed to fetch article: $e');
    }
  }
}