class PaginationModel {
  final num? totalResults;
  final num? totalPages;
  final num? currentPage;

  PaginationModel({
    this.totalResults = 0,
    this.totalPages = 0,
    this.currentPage = 0,
  });

  factory PaginationModel.fromJson(Map<String, dynamic> json) {
    return PaginationModel(
      totalResults: json['totalResults'],
      totalPages: json['totalPages'],
      currentPage: json['currentPage'],
    );
  }
}
