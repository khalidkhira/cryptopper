import 'fetch_coin_model.dart';
class DataModel{
  final CoinInfoModel coinInfoModel;
  final RowModel? rowModel;

  DataModel({
    required this.coinInfoModel, required this.rowModel,
  });

  factory DataModel.fromJson(Map<String,dynamic> json){
    return DataModel(
      coinInfoModel: CoinInfoModel.fromJson(json["CoinInfo"]),
      rowModel:json["RAW"]==null?null: RowModel.fromJson(json["RAW"]),
    );
  }
}