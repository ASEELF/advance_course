import'package:json_annotation/json_annotation.dart';

part 'responses.g.dart';
@JsonSerializable()
class BaseResponse{
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "message")
  String? message;
}

@JsonSerializable()
class CustomerResponse{
  @JsonKey(name:"id")
   String? id;
  @JsonKey(name:"name")
  String? name;
  @JsonKey(name:"numOfNotifications")
  int? numOfNotifications; //there is no need to match the names
  CustomerResponse(this.id,this.name,this.numOfNotifications);
  //from Json
  factory CustomerResponse.fromJson(Map<String, dynamic> json)=>
      _$CustomerResponseFromJson(json);

  //to Json
  Map<String, dynamic> toJson() => _$CustomerResponseToJson(this);

}

@JsonSerializable()
class ContactsResponse{
  @JsonKey(name:"email")
  String? email;
  @JsonKey(name:"phone")
  String? phone;
  @JsonKey(name:"link")
  String? link;
  ContactsResponse(this.email,this.phone,this.link);
  //from Json
  factory ContactsResponse.fromJson(Map<String, dynamic> json)=>
      _$ContactsResponseFromJson(json);

  //to Json
  Map<String, dynamic> toJson() => _$ContactsResponseToJson(this);

}

@JsonSerializable()
class AuthenticationResponse extends BaseResponse {
  @JsonKey(name: "customer")
  CustomerResponse? email;
  @JsonKey(name: "contacts")
  ContactsResponse? contacts;


  AuthenticationResponse(this.contacts, this.email);

  //from Json
  factory AuthenticationResponse.fromJson(Map<String, dynamic> json)=>
      _$AuthenticationResponseFromJson(json);

  get customer => null;

  //to Json
  Map<String, dynamic> toJson() => _$AuthenticationResponseToJson(this);

}