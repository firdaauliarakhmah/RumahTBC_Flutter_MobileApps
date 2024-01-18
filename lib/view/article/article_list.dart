import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/model/article.dart';
import '../../view_model/article_view_model.dart';
import '../../widget/card.dart';
import '../../widget/search_bar.dart';
import 'article_detail.dart';

class ArticleList extends StatefulWidget {
  final List<Article> articles;
  const ArticleList({required this.articles});

  @override
  _ArticleListState createState() => _ArticleListState();
}

class _ArticleListState extends State<ArticleList> {
  final TextEditingController _controller = TextEditingController();
  List<Article> _list = [];
  List<Article> _items = [];

  void searchOperation(String searchText){
    setState(() {
      _items = _list
              .where((item) => item.content.toLowerCase().contains(searchText.toLowerCase()) || item.title.toLowerCase().contains(searchText.toLowerCase()) || item.penulis.toLowerCase().contains(searchText.toLowerCase()))
              .toList();
    });
  }



  @override
  void initState() {
    // final articleVM = Provider.of<ArticleViewModel>(context,listen: false);
    // _isSearching = false;
    // _list = articleVM.articles;
    _list = widget.articles;
    _items = _list;
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    double circleRadius = MediaQuery.of(context).size.width/5;

    final circle = Container(
            height: circleRadius * 2,
            width: circleRadius * 2,
            decoration: const ShapeDecoration(
              shape: CircleBorder(),
              color: Color.fromARGB(100, 48, 174, 98),
            ),
          );

    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: SizedBox(
              width: circleRadius * 2,
              height: circleRadius * 1.5,
              child: Stack(
                children: [
                  Positioned(
                    top: -circleRadius * .5,
                    right: -circleRadius,
                    child: circle,
                  ),
                  Positioned(
                    top: -circleRadius,
                    child: circle,
                  ),
                  // circle
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height/25),

                SearchBarCust(
                  controller: _controller,
                  name: "Search", 
                  nameWeight: FontWeight.normal, 
                  onChange: (value){
                    searchOperation(value);
                  }
                ),


                const SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    itemCount: _items.length,
                    itemBuilder: (context, index) {
                      final article = _items[index];
                      
                      return ArticleCardCloudinary3(
                        publicID: article.imageURL,
                        title: article.title,
                        content: article.content,
                        date: article.date,
                        maxLine: 3,
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ArticleDetail(article: article))
                          );
                        }
                      );
                    }
                  ),
                )
              ],
            )
          )
        ],
      )
    );
  }
}