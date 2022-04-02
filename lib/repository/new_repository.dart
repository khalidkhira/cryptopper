import 'package:cryptopper/newsModels/fetch_news_model.dart';
import 'package:dio/dio.dart';
class NewsRepository{
  static String mainUrl = "https://min-api.cryptocompare.com/data/";
  final String apiKey = '7a738f639a8f4397dbea42d5ad1b2cd15949d6c83447abbcf62aa57b2dda31ea';
  var currencyListingAPI = '${mainUrl}v2/news/';
  Dio _dio = Dio();
  Future <NewsBigDataModel> getNews() async{
    try{
      Response response =await _dio.get(currencyListingAPI,queryParameters: {
        "lang":'EN'
      },options:Options(
          headers: {
            "Apikey": apiKey,
          }
      ));
      return NewsBigDataModel.fromJson((response.data));
    }catch(error,stackTrace){
      print("exception $error, dd $stackTrace");
      return NewsBigDataModel.withError("error");
    }
  }

}