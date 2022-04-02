import 'package:cached_network_image/cached_network_image.dart';
import 'package:cryptopper/models/data_model.dart';
import 'package:cryptopper/newsModels/news_data_model.dart';
import 'package:cryptopper/screens/detailed_news.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsPage extends StatefulWidget {
  final List<NewsDataModel> news;
  const NewsPage({Key? key,required this.news,/*required  this.news,*/ }) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
  var news = widget.news;
    return Container(
      child: ListView.builder(
          itemCount: news.length,
        itemBuilder: (context,index){
            var latestNews = news[index];
            var newsTitle = latestNews.title;
            var imageUrl = latestNews.imageUrl;
            return GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailedNews(news: latestNews)));
              },
              child: Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(left: 20,top: 20,right: 20,bottom: 0),
                decoration: BoxDecoration(
                    color: Color(0xff1a1c45),
                    borderRadius: BorderRadius.circular(20)
                ),
                height: 120,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Container(
                            height: 60,
                            // width: 75,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                                child: CachedNetworkImage(imageUrl: imageUrl))),
                        SizedBox(width: 10,),
                        SizedBox(
                          width: 225,
                            child: Text(newsTitle, style: GoogleFonts.quicksand(fontSize: 15,color: Colors.white,fontWeight: FontWeight.w500),)),
                      ],
                    ),
                    Row(
                      children: [
                        Text('Source : ',style: GoogleFonts.quicksand(color: Colors.white,fontWeight: FontWeight.w600),),
                        Text(latestNews.sourceInfoModel.name,style: GoogleFonts.quicksand(color: Colors.blue,),)
                      ],
                    )
                  ],
                ),
              ),
            );
        },
      ),
    );
  }
}
