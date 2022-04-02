class CoinInfoModel{
  final String id;
  final String name;
  final String fullName;
  final String internal;
  final String imageUrl;
  final String url;
  final num maxSupply;

  CoinInfoModel(
      {required this.id,
        required this.name,
        required this.fullName,
        required this.internal,
        required this.imageUrl,
        required this.url,
        required this.maxSupply});


  factory CoinInfoModel.fromJson(Map<String, dynamic> json){
    return CoinInfoModel(
      id: json["Id"],
      name: json["Name"],
      fullName: json["FullName"],
      internal: json["Internal"],
      imageUrl: json["ImageUrl"],
      url: json["Url"],
      maxSupply: json["MaxSupply"] ?? 0,
    );
  }
}