import 'package:cryptopper/models/data_model.dart';
import 'package:cryptopper/repository/new_repository.dart';
import 'package:cryptopper/screens/startup_screen.dart';
import 'package:flutter/material.dart';
import 'package:cryptopper/newsModels/fetch_news_model.dart';

class NewsFetcher extends StatefulWidget {
  final List<DataModel> coins;
  const NewsFetcher({Key? key,required this.coins}) : super(key: key);

  @override
  State<NewsFetcher> createState() => _NewsFetcherState();
}

class _NewsFetcherState extends State<NewsFetcher> {

  late Future<NewsBigDataModel> _futureNews;
  late NewsRepository newsRepository;

  @override
  void initState() {
    newsRepository = NewsRepository();
    _futureNews = newsRepository.getNews();
    print(_futureNews);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var coins = widget.coins;
    return FutureBuilder<NewsBigDataModel>(
      future: _futureNews,
      builder: (context,snapshot){
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            var newsData = snapshot.data!.newsDataModel;
            return StartupPage(news: newsData, coins: coins,);
          } else if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          }
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
