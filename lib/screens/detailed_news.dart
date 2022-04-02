

import 'package:cryptopper/newsModels/news_data_model.dart';
import 'package:cryptopper/web_view_stack.dart';
import 'package:flutter/material.dart';


class DetailedNews extends StatefulWidget {
  final NewsDataModel news;
  const DetailedNews({Key? key, required this.news}) : super(key: key);

  @override
  State<DetailedNews> createState() => _DetailedNewsState();
}

class _DetailedNewsState extends State<DetailedNews> {

  @override
  void initState() {
    // if(Platform.isAndroid){
    //   WebView.platform = SurfaceAndroidWebView();
    // }
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var news = widget.news;
    var url = news.url;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff1a1c45),
      ),
      backgroundColor: Color(0xff06082e),
      body: WebViewStack(url: url)
    );
  }
}
