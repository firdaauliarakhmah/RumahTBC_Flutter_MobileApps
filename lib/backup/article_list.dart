// import 'package:capstone_proj/widget/search_bar.dart';
// import 'package:capstone_proj/widget/text_field.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../../view_model/article_view_model.dart';
// import '../../widget/card.dart';
// import 'article_detail.dart';

// class ArticleList extends StatefulWidget {
//   const ArticleList({ Key? key }) : super(key: key);

//   @override
//   _ArticleListState createState() => _ArticleListState();
// }

// class _ArticleListState extends State<ArticleList> {
//   @override
//   void initState() {
//     super.initState();
//   }
  
//   @override
//   Widget build(BuildContext context) {
//     double circleRadius = MediaQuery.of(context).size.width/5;

//     final circle = Container(
//             height: circleRadius * 2,
//             width: circleRadius * 2,
//             decoration: const ShapeDecoration(
//               shape: CircleBorder(),
//               color: Color.fromARGB(100, 48, 174, 98),
//             ),
//           );

//     final articleVM = Provider.of<ArticleViewModel>(context);

//     return Scaffold(
//       body: articleVM.loading ?
//             Stack(
//               children: [
//                 Align(
//                   alignment: Alignment.topRight,
//                   child: SizedBox(
//                     width: circleRadius * 2,
//                     height: circleRadius * 1.5,
//                     child: Stack(
//                       children: [
//                         Positioned(
//                           top: -circleRadius * .5,
//                           right: -circleRadius,
//                           child: circle,
//                         ),
//                         Positioned(
//                           top: -circleRadius,
//                           child: circle,
//                         ),
//                         // circle
//                       ],
//                     ),
//                   ),
//                 ),

//                 const Center(child: CircularProgressIndicator())
                
//               ],
//             )
//           : articleVM.errorMessage.isNotEmpty ? 
//             Stack(
//               children: [
//                 Align(
//                   alignment: Alignment.topRight,
//                   child: SizedBox(
//                     width: circleRadius * 2,
//                     height: circleRadius * 1.5,
//                     child: Stack(
//                       children: [
//                         Positioned(
//                           top: -circleRadius * .5,
//                           right: -circleRadius,
//                           child: circle,
//                         ),
//                         Positioned(
//                           top: -circleRadius,
//                           child: circle,
//                         ),
//                         // circle
//                       ],
//                     ),
//                   ),
//                 ),

//                 Center(child: Text(articleVM.errorMessage))
//               ],
//             )
//           : Stack(
//             children: [
//               Align(
//                 alignment: Alignment.topRight,
//                 child: SizedBox(
//                   width: circleRadius * 2,
//                   height: circleRadius * 1.5,
//                   child: Stack(
//                     children: [
//                       Positioned(
//                         top: -circleRadius * .5,
//                         right: -circleRadius,
//                         child: circle,
//                       ),
//                       Positioned(
//                         top: -circleRadius,
//                         child: circle,
//                       ),
//                       // circle
//                     ],
//                   ),
//                 ),
//               ),

//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                 child: Column(
//                   children: [
//                     SizedBox(height: MediaQuery.of(context).size.height/25),

//                     SearchBarCust(
//                       name: "Search", 
//                       nameWeight: FontWeight.normal, 
//                       onChange: (value){}
//                     ),


//                     const SizedBox(height: 10),

//                     Expanded(
//                       child: ListView.builder(
//                         itemCount: articleVM.articles.length,
//                         itemBuilder: (context, index) {
//                           final article = articleVM.articles[index];
                          
//                           return ArticleCardCloudinary3(
//                             publicID: article.imageURL,
//                             title: article.title,
//                             content: article.content,
//                             date: article.date,
//                             maxLine: 3,
//                             onPressed: (){
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(builder: (context) => ArticleDetail(article: article))
//                               );
//                             }
//                           );
//                         }
//                       ),
//                     )
//                   ],
//                 )
//               )
//             ],
//           )
//     );
//   }
// }