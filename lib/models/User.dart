/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the User type in your schema. */
@immutable
class User extends Model {
  static const classType = const _UserModelType();
  final String id;
  final String? _username;
  final String? _phoneNumber;
  final String? _location;
  final String? _language;
  final String? _email;
  final String? _profilePicUrl;
  final TemporalDateTime? _createdOn;
  final TemporalDateTime? _updatedOn;
  final String? _bio;
  final List<String>? _subscribers;
  final List<String>? _subscribed;
  final List<String>? _saves;
  final List<String>? _category;
  final UserType? _userType;
  final String? _userCogId;
  final List<Post>? _Posts;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String? get username {
    return _username;
  }
  
  String? get phoneNumber {
    return _phoneNumber;
  }
  
  String? get location {
    return _location;
  }
  
  String? get language {
    return _language;
  }
  
  String? get email {
    return _email;
  }
  
  String? get profilePicUrl {
    return _profilePicUrl;
  }
  
  TemporalDateTime? get createdOn {
    return _createdOn;
  }
  
  TemporalDateTime? get updatedOn {
    return _updatedOn;
  }
  
  String? get bio {
    return _bio;
  }
  
  List<String>? get subscribers {
    return _subscribers;
  }
  
  List<String>? get subscribed {
    return _subscribed;
  }
  
  List<String>? get saves {
    return _saves;
  }
  
  List<String>? get category {
    return _category;
  }
  
  UserType? get userType {
    return _userType;
  }
  
  String? get userCogId {
    return _userCogId;
  }
  
  List<Post>? get Posts {
    return _Posts;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const User._internal({required this.id, username, phoneNumber, location, language, email, profilePicUrl, createdOn, updatedOn, bio, subscribers, subscribed, saves, category, userType, userCogId, Posts, createdAt, updatedAt}): _username = username, _phoneNumber = phoneNumber, _location = location, _language = language, _email = email, _profilePicUrl = profilePicUrl, _createdOn = createdOn, _updatedOn = updatedOn, _bio = bio, _subscribers = subscribers, _subscribed = subscribed, _saves = saves, _category = category, _userType = userType, _userCogId = userCogId, _Posts = Posts, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory User({String? id, String? username, String? phoneNumber, String? location, String? language, String? email, String? profilePicUrl, TemporalDateTime? createdOn, TemporalDateTime? updatedOn, String? bio, List<String>? subscribers, List<String>? subscribed, List<String>? saves, List<String>? category, UserType? userType, String? userCogId, List<Post>? Posts}) {
    return User._internal(
      id: id == null ? UUID.getUUID() : id,
      username: username,
      phoneNumber: phoneNumber,
      location: location,
      language: language,
      email: email,
      profilePicUrl: profilePicUrl,
      createdOn: createdOn,
      updatedOn: updatedOn,
      bio: bio,
      subscribers: subscribers != null ? List<String>.unmodifiable(subscribers) : subscribers,
      subscribed: subscribed != null ? List<String>.unmodifiable(subscribed) : subscribed,
      saves: saves != null ? List<String>.unmodifiable(saves) : saves,
      category: category != null ? List<String>.unmodifiable(category) : category,
      userType: userType,
      userCogId: userCogId,
      Posts: Posts != null ? List<Post>.unmodifiable(Posts) : Posts);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is User &&
      id == other.id &&
      _username == other._username &&
      _phoneNumber == other._phoneNumber &&
      _location == other._location &&
      _language == other._language &&
      _email == other._email &&
      _profilePicUrl == other._profilePicUrl &&
      _createdOn == other._createdOn &&
      _updatedOn == other._updatedOn &&
      _bio == other._bio &&
      DeepCollectionEquality().equals(_subscribers, other._subscribers) &&
      DeepCollectionEquality().equals(_subscribed, other._subscribed) &&
      DeepCollectionEquality().equals(_saves, other._saves) &&
      DeepCollectionEquality().equals(_category, other._category) &&
      _userType == other._userType &&
      _userCogId == other._userCogId &&
      DeepCollectionEquality().equals(_Posts, other._Posts);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("User {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("username=" + "$_username" + ", ");
    buffer.write("phoneNumber=" + "$_phoneNumber" + ", ");
    buffer.write("location=" + "$_location" + ", ");
    buffer.write("language=" + "$_language" + ", ");
    buffer.write("email=" + "$_email" + ", ");
    buffer.write("profilePicUrl=" + "$_profilePicUrl" + ", ");
    buffer.write("createdOn=" + (_createdOn != null ? _createdOn!.format() : "null") + ", ");
    buffer.write("updatedOn=" + (_updatedOn != null ? _updatedOn!.format() : "null") + ", ");
    buffer.write("bio=" + "$_bio" + ", ");
    buffer.write("subscribers=" + (_subscribers != null ? _subscribers!.toString() : "null") + ", ");
    buffer.write("subscribed=" + (_subscribed != null ? _subscribed!.toString() : "null") + ", ");
    buffer.write("saves=" + (_saves != null ? _saves!.toString() : "null") + ", ");
    buffer.write("category=" + (_category != null ? _category!.toString() : "null") + ", ");
    buffer.write("userType=" + (_userType != null ? enumToString(_userType)! : "null") + ", ");
    buffer.write("userCogId=" + "$_userCogId" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  User copyWith({String? id, String? username, String? phoneNumber, String? location, String? language, String? email, String? profilePicUrl, TemporalDateTime? createdOn, TemporalDateTime? updatedOn, String? bio, List<String>? subscribers, List<String>? subscribed, List<String>? saves, List<String>? category, UserType? userType, String? userCogId, List<Post>? Posts}) {
    return User._internal(
      id: id ?? this.id,
      username: username ?? this.username,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      location: location ?? this.location,
      language: language ?? this.language,
      email: email ?? this.email,
      profilePicUrl: profilePicUrl ?? this.profilePicUrl,
      createdOn: createdOn ?? this.createdOn,
      updatedOn: updatedOn ?? this.updatedOn,
      bio: bio ?? this.bio,
      subscribers: subscribers ?? this.subscribers,
      subscribed: subscribed ?? this.subscribed,
      saves: saves ?? this.saves,
      category: category ?? this.category,
      userType: userType ?? this.userType,
      userCogId: userCogId ?? this.userCogId,
      Posts: Posts ?? this.Posts);
  }
  
  User.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _username = json['username'],
      _phoneNumber = json['phoneNumber'],
      _location = json['location'],
      _language = json['language'],
      _email = json['email'],
      _profilePicUrl = json['profilePicUrl'],
      _createdOn = json['createdOn'] != null ? TemporalDateTime.fromString(json['createdOn']) : null,
      _updatedOn = json['updatedOn'] != null ? TemporalDateTime.fromString(json['updatedOn']) : null,
      _bio = json['bio'],
      _subscribers = json['subscribers']?.cast<String>(),
      _subscribed = json['subscribed']?.cast<String>(),
      _saves = json['saves']?.cast<String>(),
      _category = json['category']?.cast<String>(),
      _userType = enumFromString<UserType>(json['userType'], UserType.values),
      _userCogId = json['userCogId'],
      _Posts = json['Posts'] is List
        ? (json['Posts'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Post.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'username': _username, 'phoneNumber': _phoneNumber, 'location': _location, 'language': _language, 'email': _email, 'profilePicUrl': _profilePicUrl, 'createdOn': _createdOn?.format(), 'updatedOn': _updatedOn?.format(), 'bio': _bio, 'subscribers': _subscribers, 'subscribed': _subscribed, 'saves': _saves, 'category': _category, 'userType': enumToString(_userType), 'userCogId': _userCogId, 'Posts': _Posts?.map((Post? e) => e?.toJson()).toList(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'username': _username, 'phoneNumber': _phoneNumber, 'location': _location, 'language': _language, 'email': _email, 'profilePicUrl': _profilePicUrl, 'createdOn': _createdOn, 'updatedOn': _updatedOn, 'bio': _bio, 'subscribers': _subscribers, 'subscribed': _subscribed, 'saves': _saves, 'category': _category, 'userType': _userType, 'userCogId': _userCogId, 'Posts': _Posts, 'createdAt': _createdAt, 'updatedAt': _updatedAt
  };

  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField USERNAME = QueryField(fieldName: "username");
  static final QueryField PHONENUMBER = QueryField(fieldName: "phoneNumber");
  static final QueryField LOCATION = QueryField(fieldName: "location");
  static final QueryField LANGUAGE = QueryField(fieldName: "language");
  static final QueryField EMAIL = QueryField(fieldName: "email");
  static final QueryField PROFILEPICURL = QueryField(fieldName: "profilePicUrl");
  static final QueryField CREATEDON = QueryField(fieldName: "createdOn");
  static final QueryField UPDATEDON = QueryField(fieldName: "updatedOn");
  static final QueryField BIO = QueryField(fieldName: "bio");
  static final QueryField SUBSCRIBERS = QueryField(fieldName: "subscribers");
  static final QueryField SUBSCRIBED = QueryField(fieldName: "subscribed");
  static final QueryField SAVES = QueryField(fieldName: "saves");
  static final QueryField CATEGORY = QueryField(fieldName: "category");
  static final QueryField USERTYPE = QueryField(fieldName: "userType");
  static final QueryField USERCOGID = QueryField(fieldName: "userCogId");
  static final QueryField POSTS = QueryField(
    fieldName: "Posts",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Post).toString()));
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "User";
    modelSchemaDefinition.pluralName = "Users";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.PUBLIC,
        operations: [
          ModelOperation.CREATE,
          ModelOperation.UPDATE,
          ModelOperation.DELETE,
          ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.USERNAME,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.PHONENUMBER,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.LOCATION,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.LANGUAGE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.EMAIL,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.PROFILEPICURL,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.CREATEDON,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.UPDATEDON,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.BIO,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.SUBSCRIBERS,
      isRequired: false,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.collection, ofModelName: describeEnum(ModelFieldTypeEnum.string))
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.SUBSCRIBED,
      isRequired: false,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.collection, ofModelName: describeEnum(ModelFieldTypeEnum.string))
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.SAVES,
      isRequired: false,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.collection, ofModelName: describeEnum(ModelFieldTypeEnum.string))
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.CATEGORY,
      isRequired: false,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.collection, ofModelName: describeEnum(ModelFieldTypeEnum.string))
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.USERTYPE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.USERCOGID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: User.POSTS,
      isRequired: false,
      ofModelName: (Post).toString(),
      associatedKey: Post.USERID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _UserModelType extends ModelType<User> {
  const _UserModelType();
  
  @override
  User fromJson(Map<String, dynamic> jsonData) {
    return User.fromJson(jsonData);
  }
}