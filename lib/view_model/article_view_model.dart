import 'package:flutter/foundation.dart';
import '../data/model/article.dart';
import '../data/repository/article_repository.dart';

class ArticleViewModel extends ChangeNotifier {
  final ArticleRepository articleRepository;

  ArticleViewModel({required this.articleRepository});

  List<Article> _articles = [];
  bool _loading = false;
  String _errorMessage = '';

  //getter
  List<Article> get articles => _articles;
  bool get loading => _loading;
  String get errorMessage => _errorMessage;

  Future<void> fetchArticles() async{
    _loading = true;
    _errorMessage = '';

    try{
      _articles = await articleRepository.getArticles();
    }catch(e){
      _errorMessage = 'Failed tp fetch aticle :$e';
    }finally{
      //setelah selesai memanggil API set loading ke false kembali
      _loading = false;
      notifyListeners();
    }
  }
  
}
