import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../data/model/article.dart';
import '../util/colors.dart';
import '../view_model/article_view_model.dart';
import 'article/article_list.dart';
import 'home_detail.dart';
import 'profile/profile.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Article> articles = [];
  int _currentIndex = 0;

  @override
  void initState(){
    super.initState();
    
    final articleViewModel = Provider.of<ArticleViewModel>(context, listen: false);
    articleViewModel.fetchArticles();
  }

  @override
  Widget build(BuildContext context) {
    final articleVM = Provider.of<ArticleViewModel>(context);
    articles = articleVM.articles;

    final List<Widget> _pages = [
      HomeDetail(),
      ArticleList(articles: articles),
      Profile(),
    ];

    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: CustomColors.activeIcon,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/home.svg',
              width: 25,
              height: 25,
              colorFilter: _currentIndex == 0? const ColorFilter.mode(CustomColors.activeIcon, BlendMode.srcIn) : const ColorFilter.mode(CustomColors.inactiveIcon, BlendMode.srcIn),
            ),
            label: 'Beranda',
            
          ),

          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/newspaper.svg',
              width: 25,
              height: 25,
              colorFilter: _currentIndex == 1? const ColorFilter.mode(CustomColors.activeIcon, BlendMode.srcIn) : const ColorFilter.mode(CustomColors.inactiveIcon, BlendMode.srcIn),
            ),
            label: 'Artikel',
          ),
          
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/person-circle.svg',
              width: 25,
              height: 25,
              colorFilter: _currentIndex == 2? const ColorFilter.mode(CustomColors.activeIcon, BlendMode.srcIn) : const ColorFilter.mode(CustomColors.inactiveIcon, BlendMode.srcIn),
            ),
            label: 'Akun',
          ),
        ],
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Page 1 Cont'),
    );
  }
}