class QueryParams {
  final String? search;
  final int? page;
  final int? pageCount;
  QueryParams(this.page, this.pageCount, this.search);
  Map<String, dynamic> toMap() {
    const int maxPagecount = 10;
    final Map<String, dynamic> queryParam = {
      "search": search,
      "page": page ?? 1,
      "pageCount": pageCount ?? maxPagecount,
    };
    return queryParam;
  }
}
