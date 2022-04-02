import 'fetch_news_model.dart';
class NewsDataModel{
  final String id;
  final String guId;
  final num publishedOn;
  final String imageUrl;
  final String title;
  final String url;
  final String source;
  final String body;
  final String tags;
  final String categories;
  final String upVotes;
  final String downVotes;
  final String language;
  final SourceInfoModel sourceInfoModel;


  NewsDataModel(
      {required this.id,
        required this.guId,
        required this.publishedOn,
        required this.imageUrl,
        required this.title,
        required this.url,
        required this.source,
        required this.body,
        required this.tags,
        required this.categories,
        required this.upVotes,
        required this.downVotes,
        required this.language,
        required this.sourceInfoModel,
      });


  factory NewsDataModel.fromJson(Map<String, dynamic> json){
    return NewsDataModel(
      id: json["id"],
      guId: json["guid"],
      publishedOn: json["published_on"],
      imageUrl: json["imageurl"],
      title: json["title"],
      url: json["url"],
      source: json["source"],
      body: json["body"],
      tags: json["tags"],
      categories: json["categories"],
      upVotes: json["upvotes"],
      downVotes: json["downvotes"],
      language: json["lang"],
      sourceInfoModel: SourceInfoModel.fromJson(json["source_info"]),
    );
  }
}