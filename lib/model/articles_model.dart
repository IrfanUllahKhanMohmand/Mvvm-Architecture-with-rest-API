class ArticlesListModel {
  List<Articles>? articles;

  ArticlesListModel({this.articles});

  ArticlesListModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      articles = <Articles>[];
      json['results'].forEach((v) {
        articles!.add(Articles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (articles != null) {
      data['results'] = articles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Articles {
  String? id;
  String? title;
  String? url;
  String? imageUrl;
  String? newsSite;
  String? summary;
  String? publishedAt;
  String? updatedAt;

  Articles(
      {this.id,
      this.title,
      this.url,
      this.imageUrl,
      this.newsSite,
      this.summary,
      this.publishedAt,
      this.updatedAt});

  Articles.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    title = json['title'];
    url = json['url'];
    imageUrl = json['image_url'];
    newsSite = json['news_site'];
    summary = json['summary'];
    publishedAt = json['published_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['url'] = url;
    data['image_url'] = imageUrl;
    data['news_site'] = newsSite;
    data['summary'] = summary;
    data['published_at'] = publishedAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
