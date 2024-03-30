class Pagination {
  Pagination({
      this.total, 
      this.count, 
      this.perPage, 
      this.currentPage, 
      this.totalPages,});

  Pagination.fromJson(dynamic json) {
    total = json['total'];
    count = json['count'];
    perPage = json['perPage'];
    currentPage = json['currentPage'];
    totalPages = json['totalPages'];
  }
  int? total;
  int? count;
  int? perPage;
  int? currentPage;
  int? totalPages;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total'] = total;
    map['count'] = count;
    map['perPage'] = perPage;
    map['currentPage'] = currentPage;
    map['totalPages'] = totalPages;
    return map;
  }

}