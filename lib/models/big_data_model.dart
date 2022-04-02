import 'fetch_coin_model.dart';
class BigDataModel{
  final List<DataModel> dataModel;
  BigDataModel({
    required this.dataModel,
  });

  factory BigDataModel.fromJson(Map<String,dynamic> json){
    var dataList = json["Data"] as List;
    List<DataModel> dataModelList = dataList.map((e) => DataModel.fromJson(e)).toList();
    return BigDataModel( dataModel: dataModelList,);
  }
  BigDataModel.withError(String error):
        dataModel = [];
}