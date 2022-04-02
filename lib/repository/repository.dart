import 'package:cryptopper/models/fetch_coin_model.dart';
import 'package:dio/dio.dart';
class Repository{
  static String mainUrl = "https://min-api.cryptocompare.com/data/";
  final String apiKey = '7a738f639a8f4397dbea42d5ad1b2cd15949d6c83447abbcf62aa57b2dda31ea';
  var currencyListingAPI = '${mainUrl}top/totalvolfull';
  Dio _dio = Dio();
  Future <BigDataModel> getCoins() async{
    try{
      Response response =await _dio.get(currencyListingAPI,queryParameters: {
        'limit':100,
        "tsym":'USD'
      },options:Options(
        headers: {
          "Apikey": apiKey,
        }
      ));
      return BigDataModel.fromJson((response.data));
    }catch(error,stackTrace){
      print("exception $error, dd $stackTrace");
      return BigDataModel.withError("error");
    }
  }

}