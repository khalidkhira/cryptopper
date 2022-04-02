class SourceInfoModel{
  final String name;
  final String language;
  final String image;

  SourceInfoModel(
      {
        required this.name,
        required this.image,
        required this.language,
      });


  factory SourceInfoModel.fromJson(Map<String, dynamic> json){
    return SourceInfoModel(
      name: json["name"],
      language: json["lang"],
      image: json["img"]
    );
  }
}