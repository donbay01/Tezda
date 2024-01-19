class Rating {
  final double rate;
  final int count;

  Rating(this.rate, this.count);

  Rating.fromJSON(Map<String, dynamic> json)
      : rate = json['rate'],
        count = json['count'];
}
