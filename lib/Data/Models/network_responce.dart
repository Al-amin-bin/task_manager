class NetworkResponse{
   final bool success;
   final int statusCode;
   final Map <String, dynamic>? body;
   NetworkResponse(this.success, this.statusCode, this.body);
}