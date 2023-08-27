class VillageResponse {
  final String status;
  final String message;
  final int length;
  final List<Village> data;

  VillageResponse({
    required this.status,
    required this.message,
    required this.length,
    required this.data,
  });

  factory VillageResponse.fromJson(Map<String, dynamic> json) {
    return VillageResponse(
      status: json['status'],
      message: json['message'],
      length: json['length'],
      data: List<Village>.from(
        json['data'].map((data) => Village.fromJson(data)),
      ),
    );
  }
}

class Village {
  final String id;
  final String name;
  final String createdAt;
  final String updatedAt;
  final int v;

  Village({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Village.fromJson(Map<String, dynamic> json) {
    return Village(
      id: json['_id'],
      name: json['name'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      v: json['__v'],
    );
  }
}
