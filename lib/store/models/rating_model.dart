class Rating {
  double? rate;
  int? count;

  Rating({
    this.rate,
    this.count,
  });

  Rating.fromJSON(Map<String, dynamic> json) {
    rate = json["rate"].toDouble();
    count = json["count"];
  }

  Map<String, dynamic> toJSON() {
    return {
      "rate": rate,
      "count": count,
    };
  }
}
