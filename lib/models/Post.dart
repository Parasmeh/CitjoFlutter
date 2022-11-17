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


/** This is an auto generated class representing the Post type in your schema. */
@immutable
class Post extends Model {
  static const classType = const _PostModelType();
  final String id;
  final String? _desc;
  final TemporalDateTime? _createdOn;
  final TemporalDateTime? _updatedOn;
  final String? _postVideoUrl;
  final String? _postVoiceUrl;
  final String? _postThumbUrl;
  final List<String>? _category;
  final PostStatus? _postStatus;
  final List<String>? _likes;
  final PostType? _postType;
  final String? _tags;
  final String? _location;
  final bool? _allowComments;
  final List<String>? _saves;
  final String? _userID;
  final User? _PostBelongToUser;
  final List<Comment>? _Comments;
  final List<Report>? _Reports;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String? get desc {
    return _desc;
  }
  
  TemporalDateTime? get createdOn {
    return _createdOn;
  }
  
  TemporalDateTime? get updatedOn {
    return _updatedOn;
  }
  
  String? get postVideoUrl {
    return _postVideoUrl;
  }
  
  String? get postVoiceUrl {
    return _postVoiceUrl;
  }
  
  String? get postThumbUrl {
    return _postThumbUrl;
  }
  
  List<String>? get category {
    return _category;
  }
  
  PostStatus? get postStatus {
    return _postStatus;
  }
  
  List<String>? get likes {
    return _likes;
  }
  
  PostType? get postType {
    return _postType;
  }
  
  String? get tags {
    return _tags;
  }
  
  String? get location {
    return _location;
  }
  
  bool? get allowComments {
    return _allowComments;
  }
  
  List<String>? get saves {
    return _saves;
  }
  
  String get userID {
    try {
      return _userID!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  User? get PostBelongToUser {
    return _PostBelongToUser;
  }
  
  List<Comment>? get Comments {
    return _Comments;
  }
  
  List<Report>? get Reports {
    return _Reports;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Post._internal({required this.id, desc, createdOn, updatedOn, postVideoUrl, postVoiceUrl, postThumbUrl, category, postStatus, likes, postType, tags, location, allowComments, saves, required userID, PostBelongToUser, Comments, Reports, createdAt, updatedAt}): _desc = desc, _createdOn = createdOn, _updatedOn = updatedOn, _postVideoUrl = postVideoUrl, _postVoiceUrl = postVoiceUrl, _postThumbUrl = postThumbUrl, _category = category, _postStatus = postStatus, _likes = likes, _postType = postType, _tags = tags, _location = location, _allowComments = allowComments, _saves = saves, _userID = userID, _PostBelongToUser = PostBelongToUser, _Comments = Comments, _Reports = Reports, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Post({String? id, String? desc, TemporalDateTime? createdOn, TemporalDateTime? updatedOn, String? postVideoUrl, String? postVoiceUrl, String? postThumbUrl, List<String>? category, PostStatus? postStatus, List<String>? likes, PostType? postType, String? tags, String? location, bool? allowComments, List<String>? saves, required String userID, User? PostBelongToUser, List<Comment>? Comments, List<Report>? Reports}) {
    return Post._internal(
      id: id == null ? UUID.getUUID() : id,
      desc: desc,
      createdOn: createdOn,
      updatedOn: updatedOn,
      postVideoUrl: postVideoUrl,
      postVoiceUrl: postVoiceUrl,
      postThumbUrl: postThumbUrl,
      category: category != null ? List<String>.unmodifiable(category) : category,
      postStatus: postStatus,
      likes: likes != null ? List<String>.unmodifiable(likes) : likes,
      postType: postType,
      tags: tags,
      location: location,
      allowComments: allowComments,
      saves: saves != null ? List<String>.unmodifiable(saves) : saves,
      userID: userID,
      PostBelongToUser: PostBelongToUser,
      Comments: Comments != null ? List<Comment>.unmodifiable(Comments) : Comments,
      Reports: Reports != null ? List<Report>.unmodifiable(Reports) : Reports);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Post &&
      id == other.id &&
      _desc == other._desc &&
      _createdOn == other._createdOn &&
      _updatedOn == other._updatedOn &&
      _postVideoUrl == other._postVideoUrl &&
      _postVoiceUrl == other._postVoiceUrl &&
      _postThumbUrl == other._postThumbUrl &&
      DeepCollectionEquality().equals(_category, other._category) &&
      _postStatus == other._postStatus &&
      DeepCollectionEquality().equals(_likes, other._likes) &&
      _postType == other._postType &&
      _tags == other._tags &&
      _location == other._location &&
      _allowComments == other._allowComments &&
      DeepCollectionEquality().equals(_saves, other._saves) &&
      _userID == other._userID &&
      _PostBelongToUser == other._PostBelongToUser &&
      DeepCollectionEquality().equals(_Comments, other._Comments) &&
      DeepCollectionEquality().equals(_Reports, other._Reports);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Post {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("desc=" + "$_desc" + ", ");
    buffer.write("createdOn=" + (_createdOn != null ? _createdOn!.format() : "null") + ", ");
    buffer.write("updatedOn=" + (_updatedOn != null ? _updatedOn!.format() : "null") + ", ");
    buffer.write("postVideoUrl=" + "$_postVideoUrl" + ", ");
    buffer.write("postVoiceUrl=" + "$_postVoiceUrl" + ", ");
    buffer.write("postThumbUrl=" + "$_postThumbUrl" + ", ");
    buffer.write("category=" + (_category != null ? _category!.toString() : "null") + ", ");
    buffer.write("postStatus=" + (_postStatus != null ? enumToString(_postStatus)! : "null") + ", ");
    buffer.write("likes=" + (_likes != null ? _likes!.toString() : "null") + ", ");
    buffer.write("postType=" + (_postType != null ? enumToString(_postType)! : "null") + ", ");
    buffer.write("tags=" + "$_tags" + ", ");
    buffer.write("location=" + "$_location" + ", ");
    buffer.write("allowComments=" + (_allowComments != null ? _allowComments!.toString() : "null") + ", ");
    buffer.write("saves=" + (_saves != null ? _saves!.toString() : "null") + ", ");
    buffer.write("userID=" + "$_userID" + ", ");
    buffer.write("PostBelongToUser=" + (_PostBelongToUser != null ? _PostBelongToUser!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Post copyWith({String? id, String? desc, TemporalDateTime? createdOn, TemporalDateTime? updatedOn, String? postVideoUrl, String? postVoiceUrl, String? postThumbUrl, List<String>? category, PostStatus? postStatus, List<String>? likes, PostType? postType, String? tags, String? location, bool? allowComments, List<String>? saves, String? userID, User? PostBelongToUser, List<Comment>? Comments, List<Report>? Reports}) {
    return Post._internal(
      id: id ?? this.id,
      desc: desc ?? this.desc,
      createdOn: createdOn ?? this.createdOn,
      updatedOn: updatedOn ?? this.updatedOn,
      postVideoUrl: postVideoUrl ?? this.postVideoUrl,
      postVoiceUrl: postVoiceUrl ?? this.postVoiceUrl,
      postThumbUrl: postThumbUrl ?? this.postThumbUrl,
      category: category ?? this.category,
      postStatus: postStatus ?? this.postStatus,
      likes: likes ?? this.likes,
      postType: postType ?? this.postType,
      tags: tags ?? this.tags,
      location: location ?? this.location,
      allowComments: allowComments ?? this.allowComments,
      saves: saves ?? this.saves,
      userID: userID ?? this.userID,
      PostBelongToUser: PostBelongToUser ?? this.PostBelongToUser,
      Comments: Comments ?? this.Comments,
      Reports: Reports ?? this.Reports);
  }
  
  Post.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _desc = json['desc'],
      _createdOn = json['createdOn'] != null ? TemporalDateTime.fromString(json['createdOn']) : null,
      _updatedOn = json['updatedOn'] != null ? TemporalDateTime.fromString(json['updatedOn']) : null,
      _postVideoUrl = json['postVideoUrl'],
      _postVoiceUrl = json['postVoiceUrl'],
      _postThumbUrl = json['postThumbUrl'],
      _category = json['category']?.cast<String>(),
      _postStatus = enumFromString<PostStatus>(json['postStatus'], PostStatus.values),
      _likes = json['likes']?.cast<String>(),
      _postType = enumFromString<PostType>(json['postType'], PostType.values),
      _tags = json['tags'],
      _location = json['location'],
      _allowComments = json['allowComments'],
      _saves = json['saves']?.cast<String>(),
      _userID = json['userID'],
      _PostBelongToUser = json['PostBelongToUser']?['serializedData'] != null
        ? User.fromJson(new Map<String, dynamic>.from(json['PostBelongToUser']['serializedData']))
        : null,
      _Comments = json['Comments'] is List
        ? (json['Comments'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Comment.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _Reports = json['Reports'] is List
        ? (json['Reports'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Report.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'desc': _desc, 'createdOn': _createdOn?.format(), 'updatedOn': _updatedOn?.format(), 'postVideoUrl': _postVideoUrl, 'postVoiceUrl': _postVoiceUrl, 'postThumbUrl': _postThumbUrl, 'category': _category, 'postStatus': enumToString(_postStatus), 'likes': _likes, 'postType': enumToString(_postType), 'tags': _tags, 'location': _location, 'allowComments': _allowComments, 'saves': _saves, 'userID': _userID, 'PostBelongToUser': _PostBelongToUser?.toJson(), 'Comments': _Comments?.map((Comment? e) => e?.toJson()).toList(), 'Reports': _Reports?.map((Report? e) => e?.toJson()).toList(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'desc': _desc, 'createdOn': _createdOn, 'updatedOn': _updatedOn, 'postVideoUrl': _postVideoUrl, 'postVoiceUrl': _postVoiceUrl, 'postThumbUrl': _postThumbUrl, 'category': _category, 'postStatus': _postStatus, 'likes': _likes, 'postType': _postType, 'tags': _tags, 'location': _location, 'allowComments': _allowComments, 'saves': _saves, 'userID': _userID, 'PostBelongToUser': _PostBelongToUser, 'Comments': _Comments, 'Reports': _Reports, 'createdAt': _createdAt, 'updatedAt': _updatedAt
  };

  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField DESC = QueryField(fieldName: "desc");
  static final QueryField CREATEDON = QueryField(fieldName: "createdOn");
  static final QueryField UPDATEDON = QueryField(fieldName: "updatedOn");
  static final QueryField POSTVIDEOURL = QueryField(fieldName: "postVideoUrl");
  static final QueryField POSTVOICEURL = QueryField(fieldName: "postVoiceUrl");
  static final QueryField POSTTHUMBURL = QueryField(fieldName: "postThumbUrl");
  static final QueryField CATEGORY = QueryField(fieldName: "category");
  static final QueryField POSTSTATUS = QueryField(fieldName: "postStatus");
  static final QueryField LIKES = QueryField(fieldName: "likes");
  static final QueryField POSTTYPE = QueryField(fieldName: "postType");
  static final QueryField TAGS = QueryField(fieldName: "tags");
  static final QueryField LOCATION = QueryField(fieldName: "location");
  static final QueryField ALLOWCOMMENTS = QueryField(fieldName: "allowComments");
  static final QueryField SAVES = QueryField(fieldName: "saves");
  static final QueryField USERID = QueryField(fieldName: "userID");
  static final QueryField POSTBELONGTOUSER = QueryField(
    fieldName: "PostBelongToUser",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (User).toString()));
  static final QueryField COMMENTS = QueryField(
    fieldName: "Comments",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Comment).toString()));
  static final QueryField REPORTS = QueryField(
    fieldName: "Reports",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Report).toString()));
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Post";
    modelSchemaDefinition.pluralName = "Posts";
    
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
    
    modelSchemaDefinition.indexes = [
      ModelIndex(fields: const ["userID"], name: "byUser")
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Post.DESC,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Post.CREATEDON,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Post.UPDATEDON,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Post.POSTVIDEOURL,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Post.POSTVOICEURL,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Post.POSTTHUMBURL,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Post.CATEGORY,
      isRequired: false,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.collection, ofModelName: describeEnum(ModelFieldTypeEnum.string))
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Post.POSTSTATUS,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Post.LIKES,
      isRequired: false,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.collection, ofModelName: describeEnum(ModelFieldTypeEnum.string))
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Post.POSTTYPE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Post.TAGS,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Post.LOCATION,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Post.ALLOWCOMMENTS,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Post.SAVES,
      isRequired: false,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.collection, ofModelName: describeEnum(ModelFieldTypeEnum.string))
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Post.USERID,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
      key: Post.POSTBELONGTOUSER,
      isRequired: false,
      targetName: "userPostsId",
      ofModelName: (User).toString()
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: Post.COMMENTS,
      isRequired: false,
      ofModelName: (Comment).toString(),
      associatedKey: Comment.POSTID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: Post.REPORTS,
      isRequired: false,
      ofModelName: (Report).toString(),
      associatedKey: Report.POSTID
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

class _PostModelType extends ModelType<Post> {
  const _PostModelType();
  
  @override
  Post fromJson(Map<String, dynamic> jsonData) {
    return Post.fromJson(jsonData);
  }
}