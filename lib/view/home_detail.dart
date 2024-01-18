import 'package:capstone_proj/view/article/article_list.dart';
import 'package:capstone_proj/view/chatbot.dart';
import 'package:capstone_proj/view_model/article_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/model/article.dart';
import '../util/colors.dart';
import '../view_model/chatbot_view_model.dart';
import '../view_model/rontgen_view_model.dart';
import '../widget/button.dart';
import '../widget/card.dart';
import 'article/article_detail.dart';
import 'kritik_saran.dart';
import 'login_regist/get_started.dart';
import 'rontgen/rontgen_history_list.dart';

class HomeDetail extends StatefulWidget {
  const HomeDetail({ Key? key }) : super(key: key);

  @override
  _HomeDetailState createState() => _HomeDetailState();
}

class _HomeDetailState extends State<HomeDetail> {

  Future<void> openUrl(Uri url) async {
    // var urlLaunchable = await canLaunchUrl(url);
    // if(urlLaunchable){
    //   await launchUrl(url);
    // }else{
    //   print("URL can't be launched.");
    // }
    try{
      await launchUrl(url,mode: LaunchMode.externalApplication);
    }catch(e){
      throw("tidak bisa: $e");
    }
  }

  @override
  void initState(){
    super.initState();

    final articleViewModel = Provider.of<ArticleViewModel>(context, listen: false);
    articleViewModel.fetchArticles();
  }

  @override
  Widget build(BuildContext context) {
    final chatbotVM = Provider.of<ChatbotViewModel>(context);
    final articleVM = Provider.of<ArticleViewModel>(context);
    final articlelist = articleVM.articles;

    List<Map<String,dynamic>> menu = [
      {
        "iconPath" : "assets/icons/pneumo.svg",
        "name" : "Hasil Rontgen",
        "route" : RontgenHistoryList(),
        "color" : CustomColors.menu1
      },
      {
        "iconPath" : "assets/icons/newspaper.svg",
        "name" : "Artikel Kesehatan",
        "route" : ArticleList(articles: articlelist),
        "color" : CustomColors.menu2
      },
      {
        "iconPath" : "assets/icons/chat.svg",
        "name" : "Chatbot",
        "route" : Chatbot(chatbotVM: chatbotVM),
        "color" : CustomColors.menu3
      },
      {
        "iconPath" : "assets/icons/mail.svg",
        "name" : "Kritik dan Saran",
        "route" : KritikSaran(),
        "color" : CustomColors.menu4
      }
    ].toList();

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
      body: SingleChildScrollView(
        child: Stack(
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
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height/15),

                  Text(
                    "Hello !",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromARGB(255, 58, 99, 81)
                    ),
                  ),

                  Text(
                    "Good Morning ...",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromARGB(255, 141, 151, 173)
                    ),
                  ),

                  const SizedBox(height: 15),

                  TextButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ArticleList(articles: articlelist))
                      ), 
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/search.svg",
                            // height: 30,
                            colorFilter: const ColorFilter.mode(Color.fromARGB(255, 80, 184, 168), BlendMode.srcIn),
                          ),

                          const SizedBox(width: 5),

                          Text(
                            "Search...",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: const Color.fromARGB(255, 141, 151, 173)
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  Card(
                    color: Colors.white,
                    surfaceTintColor: Colors.white,
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                    // child: Expanded(
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Website RumahTBC",
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: const Color.fromARGB(255, 58, 99, 81)
                              ),
                            ),

                            const SizedBox(height: 5),

                            Text(
                              "RumahTBC juga tersedia versi websitenya, yuk kunjungi!",
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: const Color.fromARGB(255, 141, 151, 173)
                              ),
                            ),

                            const SizedBox(height: 10),

                            ButtonMainFilled(
                              text: "Let's Go", 
                              btnSize: const Size(0, 35),
                              fontSize: 14,
                              roundCorner: 10,
                              fontWeight: FontWeight.w600,
                              btnColor: const Color.fromARGB(255, 80, 184, 168),
                              onPressed: () async{
                                Uri url = Uri.parse('https://id.pinterest.com/');
                                // try{
                                //   await launchUrl(url,mode: LaunchMode.externalApplication);
                                // }catch(e){
                                //   throw("tidak bisa: $e");
                                // }
                                openUrl(url);
                              }
                            )
                          ],
                        )
                      ),
                    // ),
                  ),

                  const SizedBox(height: 20),

                  Text(
                    "Layanan Kami",
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromARGB(255, 55, 27, 52)
                    ),
                  ),

                  const SizedBox(height: 5),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for(int i = 0; i<menu.length;i++)
                        // ButtonIconTextSVG(iconPath: menu[i]['iconPath'], text: menu[i]['name'], onPressed: (){})
                        Expanded(
                          child: ButtonIconTextSVG(
                            iconPath: menu[i]['iconPath'], 
                            text: menu[i]['name'],
                            iconHeight: 35,
                            textSize: 12,
                            space: 2,
                            backgroundColor: menu[i]['color'],
                            iconColor: Colors.white,
                            onPressed: (){
                              // Navigator.push(
                              //   context,
                              //   menu[i]['route']
                              // );

                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => menu[i]['route'])
                              );
   
                            }
                          )
                        ),
                    ],
                  ),

                  const SizedBox(height: 20.0),

                  Text(
                    "Artikel Kesehatan",
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromARGB(255, 55, 27, 52)
                    ),
                  ),

                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: articlelist.length < 2? articlelist.length:2,
                    itemBuilder: (context, index) {
                      final article = articlelist[index];
                      return ArticleCardCloudinary3(
                        publicID: article.imageURL,
                        title: article.title,
                        content: article.content,
                        date: article.date,
                        maxLine: 4,
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ArticleDetail(article: article))
                          );
                        }
                      );
                    }
                  ),

                  const SizedBox(height: 10)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}