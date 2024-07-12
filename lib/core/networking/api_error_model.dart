class ApiErrorModel {
  final String message;
  final int? code;

  const ApiErrorModel({this.message = 'Unknown Error', this.code});

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) {
    return ApiErrorModel(
      message: json['errorMessage'] as String? ?? 'Unknown Error',
      code: json['code'],
    );
  }
}
