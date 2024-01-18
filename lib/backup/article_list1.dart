import 'package:capstone_proj/data/model/article.dart';
import 'package:capstone_proj/util/colors.dart';
import 'package:capstone_proj/widget/card.dart';
import 'package:capstone_proj/view_model/article_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view/article/article_detail.dart';

class ArticleList1 extends StatelessWidget {
  const ArticleList1({super.key});

// const ArticleList({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    String content = "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat";

    List<Article> articlelist = [
      Article(
        id: 1, 
        title: 'Sample 1', 
        content: content, 
        date: "12-11-2023", 
        imageURL: 'sample', 
        category: 'Sample', 
        penulis: 'Penulis 1'),

      Article(
        id: 2, 
        title: 'Sample 2', 
        content: content, 
        date: "13-11-2023", 
        imageURL: 'sample', 
        category: 'Sample', 
        penulis: 'Penulis 2'),

      Article(
        id: 3, 
        title: 'Sample 3', 
        content: content, 
        date: "14-11-2023", 
        imageURL: 'sample', 
        category: 'tes', 
        penulis: 'Penulis 3'),
    ];
//     final articleVM = Provider.of<ArticleViewModel>(context, listen: false);
//     return Scaffold(
//       appBar: AppBar(
//         // actions: [
//         //   Padding(
//         //     padding: const EdgeInsets.only(right: 20),
//         //     child: IconButton(
//         //       icon: SvgPicture.asset(
//         //         'assets/icons/edit.svg',
//         //         width: 25,
//         //         height: 25,
//         //       ),
//         //       onPressed: () {
//         //         // Navigator.push(
//         //         //   context,
//         //         //   MaterialPageRoute(builder: (context) => EditProfile())
//         //         // );
//         //       }, //pindah ke page edit profile
//         //     ),
//         //   )
//         // ]
//         backgroundColor: CustomColors.mainButton,
//       ),
//       body: articleVM.article.isEmpty ? Center(child: CircularProgressIndicator())
//           : ListView.builder(
//               itemCount: articleVM.article.length,
//               itemBuilder: (context, index) {
//                 final article = articleVM.article[index];
//                 return ArticleCardCloudinary(
//                   publicID: article.imageURL,
//                   title: article.title,
//                   content: article.content,
//                   date: article.date,
//                   onPressed: (){
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => ArticleDetail(article: article))
//                     );
//                   }
//                 );
//               }
//             ),
//             floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // Memanggil metode untuk mengambil data artikel
//           articleVM.fetchArticles();
//         },
//         child: Icon(Icons.refresh),
//       ),
//     );
//   }
// }



return Scaffold(
      appBar: AppBar(
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.only(right: 20),
        //     child: IconButton(
        //       icon: SvgPicture.asset(
        //         'assets/icons/edit.svg',
        //         width: 25,
        //         height: 25,
        //       ),
        //       onPressed: () {
        //         // Navigator.push(
        //         //   context,
        //         //   MaterialPageRoute(builder: (context) => EditProfile())
        //         // );
        //       }, //pindah ke page edit profile
        //     ),
        //   )
        // ]
        backgroundColor: CustomColors.mainButton,
      ),
      body: ListView.builder(
        itemCount: articlelist.length,
        itemBuilder: (context, index) {
          final article = articlelist[index];
          return ArticleCardCloudinary(
            publicID: article.imageURL,
            title: article.title,
            content: article.content,
            date: article.date,
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ArticleDetail(article: article))
              );
            }
          );
        }
      ),
    );
  }
}