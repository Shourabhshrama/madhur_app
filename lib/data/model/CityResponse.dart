class CityResponse {
  final String status;
  final String message;
  final int length;
  final List<City> data;

  CityResponse({
    required this.status,
    required this.message,
    required this.length,
    required this.data,
  });

  factory CityResponse.fromJson(Map<String, dynamic> json) {
    return CityResponse(
      status: json['status'],
      message: json['message'],
      length: json['length'],
      data: List<City>.from(
        json['data'].map((data) => City.fromJson(data)),
      ),
    );
  }
}

class City {
  final String id;
  final String name;
  final String countryId;
  final String stateId;
  final String createdAt;
  final String updatedAt;
  final int v;

  City({
    required this.id,
    required this.name,
    required this.countryId,
    required this.stateId,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json['_id'],
      name: json['name'],
      countryId: json['countryid'],
      stateId: json['stateid'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      v: json['__v'],
    );
  }
}
