import 'package:mvvm/mvvm_tut/util/response_state.dart';

class ApiResponse<T> {
  ResponseState? state;
  T? data;
  String? message;

  ApiResponse(this.state, this.data, this.message);

  ApiResponse.loading() : state = ResponseState.LOADING;

  ApiResponse.success() : state = ResponseState.SUCCESS;

  ApiResponse.error() : state = ResponseState.ERROR;

  @override
  String toString() {
    return 'ApiResponse{state: $state, data: $data, message: $message}';
  }
}
