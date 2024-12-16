class CarouselModel {
  // String? sId;
  String? image;
  String? externalLink;

  // String? caseText;
  // String? info;

  CarouselModel({
    // this.sId,
    this.image = '',
    // this.caseText,
    // this.info,
    this.externalLink = '',
  });

  CarouselModel.fromJson(Map<String, dynamic> json) {
    // sId = json['_id'];
    image = json['image'];
    externalLink = json['link'];
    // caseText = json['case'];
    // info = json['info'];
    // realId = json['realId'];
  }
}
