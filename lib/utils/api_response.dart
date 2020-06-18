class ApiResponse<T> {
  bool ok;
  T result;

  ApiResponse.ok(this.result) {
    ok = true;
  }

  ApiResponse.error(this.result) {
    ok = false;
  }
}