import 'dart:async';

import 'package:cryptopper/models/fetch_coin_model.dart';
import 'package:cryptopper/newsModels/fetch_news_model.dart';
import 'package:cryptopper/news_fetcher.dart';
import 'package:cryptopper/repository/new_repository.dart';
import 'package:cryptopper/repository/repository.dart';
import 'package:cryptopper/screens/startup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  late Future<BigDataModel> _futureCoins;
  late Repository repository;

  @override
  void initState() {
    repository = Repository();
    _futureCoins = repository.getCoins();
    print(_futureCoins);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme:
          ThemeData(
            primarySwatch: Colors.blue
          ),
          home: FutureBuilder<BigDataModel>(
            future: _futureCoins,
            builder: (context,snapshot){
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  var coinData = snapshot.data!.dataModel;
                  return NewsFetcher(coins: coinData,);
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
          )
          // StartupPage(),
        );

  }
}
