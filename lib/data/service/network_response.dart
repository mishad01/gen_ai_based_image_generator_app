class NetworkResponse {
  final int stausCode;
  final bool isSuccess;
  final dynamic responseData;
  final String? errorMessage;

  NetworkResponse({
    required this.stausCode,
    required this.isSuccess,
    required this.responseData,
    this.errorMessage,
  });
}
