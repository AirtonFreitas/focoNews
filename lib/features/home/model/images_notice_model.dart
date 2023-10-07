class ImagesIBGEModel {
  String? imageIntro;
  String? floatIntro;
  String? imageIntroAlt;
  String? imageIntroCaption;
  String? imageFulltext;
  String? floatFulltext;
  String? imageFulltextAlt;
  String? imageFulltextCaption;

  ImagesIBGEModel({
    this.imageIntro,
    this.floatIntro,
    this.imageIntroAlt,
    this.imageIntroCaption,
    this.imageFulltext,
    this.floatFulltext,
    this.imageFulltextAlt,
    this.imageFulltextCaption,
  });

  ImagesIBGEModel.fromJson(Map<String, dynamic> json) {
    imageIntro = json['image_intro'];
    floatIntro = json['float_intro'];
    imageIntroAlt = json['image_intro_alt'];
    imageIntroCaption = json['image_intro_caption'];
    imageFulltext = json['image_fulltext'];
    floatFulltext = json['float_fulltext'];
    imageFulltextAlt = json['image_fulltext_alt'];
    imageFulltextCaption = json['image_fulltext_caption'];
  }
}
