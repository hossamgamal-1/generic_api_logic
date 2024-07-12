class ApiErrorModel {
  final String message;
  final int? code;
  static const _unknownError = 'Unknown Error';

  const ApiErrorModel({this.message = _unknownError, this.code});

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) {
    return ApiErrorModel(
      message: json['errorMessage'] as String? ?? _unknownError,
      code: json['code'],
    );
  }
}
