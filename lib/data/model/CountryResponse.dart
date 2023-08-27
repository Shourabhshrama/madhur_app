class CountryResponse {
  final String status;
  final String message;
  final int length;
  final List<Country> data;

  CountryResponse({
    required this.status,
    required this.message,
    required this.length,
    required this.data,
  });

  factory CountryResponse.fromJson(Map<String, dynamic> json) {
    return CountryResponse(
      status: json['status'],
      message: json['message'],
      length: json['length'],
      data: List<Country>.from(
        json['data'].map((data) => Country.fromJson(data)),
      ),
    );
  }
}

class Country {
  final String id;
  final String name;
  final String createdAt;
  final String updatedAt;
  final int v;

  Country({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      id: json['_id'],
      name: json['name'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      v: json['__v'],
    );
  }
}
