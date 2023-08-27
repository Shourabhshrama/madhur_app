class UserResponse {
  final String status;
  final String message;
  final UserData userdata;
  final String token;

  UserResponse({
    required this.status,
    required this.message,
    required this.userdata,
    required this.token,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      status: json['status'],
      message: json['message'],
      userdata: UserData.fromJson(json['userdata']),
      token: json['token'],
    );
  }
}

class UserData {
  final String id;
  final String username;
  final String name;
  final String userAppLogintype;
  final String house;
  final String landmark;
  final String state;
  final String city;
  final String country;
  final String territorystate;
  final String territoryarea;
  final String phone;
  final String email;
  final String password;
  final String profileimage;
  final String device_id;
  final String device_type;
  final String device_notification_token_id;
  final String device_app_version;
  final String resettoken;
  final String otp;
  final String isphoneverified;
  final String isblocked;
  final String monthlytarget;
  final List<dynamic> farmers_meet;
  final List<dynamic> dealer_meet;
  final List<dynamic> notification;
  final List<dynamic> lastlogin;
  final List<dynamic> lastpasswordchange;
  final String createdAt;
  final String updatedAt;
  final int v;

  UserData({
    required this.id,
    required this.username,
    required this.name,
    required this.userAppLogintype,
    required this.house,
    required this.landmark,
    required this.state,
    required this.city,
    required this.country,
    required this.territorystate,
    required this.territoryarea,
    required this.phone,
    required this.email,
    required this.password,
    required this.profileimage,
    required this.device_id,
    required this.device_type,
    required this.device_notification_token_id,
    required this.device_app_version,
    required this.resettoken,
    required this.otp,
    required this.isphoneverified,
    required this.isblocked,
    required this.monthlytarget,
    required this.farmers_meet,
    required this.dealer_meet,
    required this.notification,
    required this.lastlogin,
    required this.lastpasswordchange,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['_id'],
      username: json['username'],
      name: json['name'],
      userAppLogintype: json['userAppLogintype'],
      house: json['house'],
      landmark: json['landmark'],
      state: json['state'],
      city: json['city'],
      country: json['country'],
      territorystate: json['territorystate'],
      territoryarea: json['territoryarea'],
      phone: json['phone'],
      email: json['email'],
      password: json['password'],
      profileimage: json['profileimage'],
      device_id: json['device_id'],
      device_type: json['device_type'],
      device_notification_token_id: json['device_notification_token_id'],
      device_app_version: json['device_app_version'],
      resettoken: json['resettoken'],
      otp: json['otp'],
      isphoneverified: json['isphoneverified'],
      isblocked: json['isblocked'],
      monthlytarget: json['monthlytarget'],
      farmers_meet: json['farmers_meet'],
      dealer_meet: json['dealer_meet'],
      notification: json['notification'],
      lastlogin: json['lastlogin'],
      lastpasswordchange: json['lastpasswordchange'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      v: json['__v'],
    );
  }
}
