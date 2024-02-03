// Bloc Response Status
// ignore_for_file: constant_identifier_names
class Response<T> {
  Status status;
  dynamic data;
  List<String>? message;

  Response.loading() : status = Status.LOADING;

  Response.completed(this.data) : status = Status.COMPLETED;

  Response.error(this.message) : status = Status.ERROR;

  @override
  String toString() {
    return "Status : $status \n Message : ${message ?? ""} \n Data : ${data ?? ""}";
  }
}

enum Status { LOADING, COMPLETED, ERROR }
