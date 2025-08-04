import 'package:json_annotation/json_annotation.dart';
part 'responses.g.dart';

// > base response
@JsonSerializable()
class BaseResponse {
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "message")
  String? message;
}

// > customer response
@JsonSerializable()
class CustomerResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "numOfNotifications")
  int? numOfNotifications;
  CustomerResponse(this.id, this.name, this.numOfNotifications);

  // > from json
  factory CustomerResponse.fromJson(Map<String, dynamic> json) =>
      _$CustomerResponseFromJson(json);

  // > to json
  Map<String, dynamic> toJson() => _$CustomerResponseToJson(this);
}

// > contacts response
@JsonSerializable()
class ContactsResponse {
  @JsonKey(name: "phone")
  int? phone;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "link")
  int? link;
  ContactsResponse(this.phone, this.email, this.link);

  // > from json
  factory ContactsResponse.fromJson(Map<String, dynamic> json) =>
      _$ContactsResponseFromJson(json);

  // > to json
  Map<String, dynamic> toJson() => _$ContactsResponseToJson(this);
}

// > auth response
@JsonSerializable()
class AuthResponse extends BaseResponse {
  @JsonKey(name: "customer")
  ContactsResponse? customer;

  @JsonKey(name: "contacts")
  ContactsResponse? contacts;
  AuthResponse(this.customer, this.contacts);

  // > from json
  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);

  // > to json
  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);
}
