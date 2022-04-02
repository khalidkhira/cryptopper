import 'fetch_news_model.dart';

class NewsBigDataModel{
  final List<NewsDataModel> newsDataModel;
  NewsBigDataModel({
    required this.newsDataModel,
  });

  factory NewsBigDataModel.fromJson(Map<String,dynamic> json){
    var dataList = json["Data"] as List;
    List<NewsDataModel> dataModelList = dataList.map((e) => NewsDataModel.fromJson(e)).toList();
    return NewsBigDataModel( newsDataModel: dataModelList,);
  }
  NewsBigDataModel.withError(String error):
        newsDataModel = [];
}