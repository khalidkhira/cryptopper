import 'fetch_coin_model.dart';
class RowModel{
  final UsdModel usdModel;

  RowModel({required this.usdModel});

  factory RowModel.fromJson(Map<String,dynamic>json){
    return RowModel(usdModel: UsdModel.fromJson(json["USD"]));
  }

}