class PortfolioItemModel {
  String id;
  String title;
  List<String> images;

  PortfolioItemModel({
    required this.id,
    required this.title,
    required this.images,
  });

  factory PortfolioItemModel.fromJson(Map<String, dynamic> json) {
    var imagesFromJson = json['images'] as List;
    List<String> imagesList = List<String>.from(imagesFromJson);

    return PortfolioItemModel(
      id: json['_id'],
      title: json['title'],
      images: imagesList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'images': images,
    };
  }
}