import 'package:mvvm/data/response/status.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;

  ApiResponse({this.status, this.data, this.message});

  ApiResponse.loading() : status = Status.Loading;

  ApiResponse.completed() : status = Status.Completed;

  ApiResponse.error() : status = Status.Error;

  @override
  String toString() {
    return "Status: $status\nmessage: $message\n data:$data";
  }
}
