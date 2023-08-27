class StateResponse {
  final String status;
  final String message;
  final int length;
  final List<StateModel> data;

  StateResponse({
    required this.status,
    required this.message,
    required this.length,
    required this.data,
  });

  factory StateResponse.fromJson(Map<String, dynamic> json) {
    return StateResponse(
      status: json['status'],
      message: json['message'],
      length: json['length'],
      data: List<StateModel>.from(
        json['data'].map((data) => StateModel.fromJson(data)),
      ),
    );
  }
}

class StateModel {
  final String id;
  final String name;
  final String countryId;
  final String createdAt;
  final String updatedAt;
  final int v;

  StateModel({
    required this.id,
    required this.name,
    required this.countryId,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory StateModel.fromJson(Map<String, dynamic> json) {
    return StateModel(
      id: json['_id'],
      name: json['name'],
      countryId: json['countryid'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      v: json['__v'],
    );
  }
}
