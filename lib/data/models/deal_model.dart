class DealModel {
  final int id;
  final String imageUrl;
  final int commentsCount;
  final String storeName;
  final String title;
  final String createdAt;

  DealModel({
    required this.id,
    required this.imageUrl,
    required this.commentsCount,
    required this.storeName,
    required this.title,
    required this.createdAt,
  });

  factory DealModel.fromJson(Map<String, dynamic> json) {
    return DealModel(
      id: json['id'],
      imageUrl: json['image_medium']??"",
      commentsCount: json['comments_count']??0,
      storeName: json['store'] == null ? "" : json['store']['name'] ?? "",
      title: json['title'] ?? "",
      createdAt: json['created_at'] ?? "",
    );
  }
  Map<String, dynamic> toJson() {
  return {
    'id': id,
    'title': title,
    'imageUrl': imageUrl,
    'commentsCount': commentsCount,
    'storeName': storeName,
    'createdAt': createdAt
  };
}

}