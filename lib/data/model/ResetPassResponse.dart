class ResetPassResponse {
  final String status;
  final String message;
  final Data data;

  ResetPassResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ResetPassResponse.fromJson(Map<String, dynamic> json) {
    return ResetPassResponse(
      status: json['status'],
      message: json['message'],
      data: Data.fromJson(json['data']),
    );
  }
}

class Data {
  final String userid;

  Data({required this.userid});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(userid: json['userid']);
  }
}
