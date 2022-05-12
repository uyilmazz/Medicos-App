import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: "_id")
  String? sId;
  String? name;
  String? email;
  String? password;
  List<String>? appointments;
  String? phoneNumber;
  String? address;
  String? imageUrl;
  int? zipCode;
  String? token;

  User(
      {this.sId,
      this.name,
      this.email,
      this.password,
      this.appointments,
      this.phoneNumber,
      this.address,
      this.imageUrl,
      this.zipCode,
      this.token});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
