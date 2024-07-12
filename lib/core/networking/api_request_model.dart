class ApiRequestModel {
  final String endPoint;
  final Map<String, dynamic>? headers;
  final Map<String, dynamic>? body;
  final Map<String, dynamic>? queries;

  const ApiRequestModel({
    required this.endPoint,
    this.headers,
    this.body,
    this.queries,
  });
}
