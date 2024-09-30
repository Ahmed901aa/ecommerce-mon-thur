class Product {
  final String id;
  final String title;
  final String description;
  final int quantity;
  final int price;
  final String imageCoverURL;
  final int sold;
  final List<String> imagesURLs;
  final int ratingsQuantity;
  final double ratingsAverage;
  final int? priceAfterDiscount;

  const Product({
    required this.id,
    required this.title,
    required this.description,
    required this.quantity,
    required this.price,
    required this.imageCoverURL,
    required this.sold,
    required this.imagesURLs,
    required this.ratingsQuantity,
    required this.ratingsAverage,
    this.priceAfterDiscount,
  });
}
