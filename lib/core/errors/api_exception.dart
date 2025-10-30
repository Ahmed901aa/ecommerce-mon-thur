class ApiException implements Exception {
  final String message;
  final dynamic details;

  ApiException(this.message, {this.details});

  @override
  String toString() {
    if (details == null) return message;
    return '$message\nDetails: ${details.toString()}';
  }
}
