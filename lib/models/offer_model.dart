class OfferModel {
  int? id;
  String? title;
  String? description;
  int? likes;
  int? reviews;
  int? rate;

  OfferModel({
    this.id,
    this.title,
    this.description,
    this.likes,
    this.reviews,
    this.rate,
  });

  factory OfferModel.fromJson(Map<String, dynamic> json) => OfferModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        likes: json["likes"],
        reviews: json["reviews"],
        rate: json["rate"],
      );

  static List<OfferModel> listFromJson(List<dynamic> json) {
    return json.map((value) => OfferModel.fromJson(value)).toList();
  }
}
