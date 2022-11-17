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


/** This is an auto generated class representing the Comment type in your schema. */
@immutable
class Comment extends Model {
  static const classType = const _CommentModelType();
  final String id;
  final String? _commentText;
  final TemporalDateTime? _createdOn;
  final TemporalDateTime? _updatedOn;
  final List<String>? _likes;
  final String? _userId;
  final String? _postID;
  final Post? _CommentBelongsToPost;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String? get commentText {
    return _commentText;
  }
  
  TemporalDateTime? get createdOn {
    return _createdOn;
  }
  
  TemporalDateTime? get updatedOn {
    return _updatedOn;
  }
  
  List<String>? get likes {
    return _likes;
  }
  
  String? get userId {
    return _userId;
  }
  
  String get postID {
    try {
      return _postID!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  Post? get CommentBelongsToPost {
    return _CommentBelongsToPost;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Comment._internal({required this.id, commentText, createdOn, updatedOn, likes, userId, required postID, CommentBelongsToPost, createdAt, updatedAt}): _commentText = commentText, _createdOn = createdOn, _updatedOn = updatedOn, _likes = likes, _userId = userId, _postID = postID, _CommentBelongsToPost = CommentBelongsToPost, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Comment({String? id, String? commentText, TemporalDateTime? createdOn, TemporalDateTime? updatedOn, List<String>? likes, String? userId, required String postID, Post? CommentBelongsToPost}) {
    return Comment._internal(
      id: id == null ? UUID.getUUID() : id,
      commentText: commentText,
      createdOn: createdOn,
      updatedOn: updatedOn,
      likes: likes != null ? List<String>.unmodifiable(likes) : likes,
      userId: userId,
      postID: postID,
      CommentBelongsToPost: CommentBelongsToPost);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Comment &&
      id == other.id &&
      _commentText == other._commentText &&
      _createdOn == other._createdOn &&
      _updatedOn == other._updatedOn &&
      DeepCollectionEquality().equals(_likes, other._likes) &&
      _userId == other._userId &&
      _postID == other._postID &&
      _CommentBelongsToPost == other._CommentBelongsToPost;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Comment {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("commentText=" + "$_commentText" + ", ");
    buffer.write("createdOn=" + (_createdOn != null ? _createdOn!.format() : "null") + ", ");
    buffer.write("updatedOn=" + (_updatedOn != null ? _updatedOn!.format() : "null") + ", ");
    buffer.write("likes=" + (_likes != null ? _likes!.toString() : "null") + ", ");
    buffer.write("userId=" + "$_userId" + ", ");
    buffer.write("postID=" + "$_postID" + ", ");
    buffer.write("CommentBelongsToPost=" + (_CommentBelongsToPost != null ? _CommentBelongsToPost!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Comment copyWith({String? id, String? commentText, TemporalDateTime? createdOn, TemporalDateTime? updatedOn, List<String>? likes, String? userId, String? postID, Post? CommentBelongsToPost}) {
    return Comment._internal(
      id: id ?? this.id,
      commentText: commentText ?? this.commentText,
      createdOn: createdOn ?? this.createdOn,
      updatedOn: updatedOn ?? this.updatedOn,
      likes: likes ?? this.likes,
      userId: userId ?? this.userId,
      postID: postID ?? this.postID,
      CommentBelongsToPost: CommentBelongsToPost ?? this.CommentBelongsToPost);
  }
  
  Comment.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _commentText = json['commentText'],
      _createdOn = json['createdOn'] != null ? TemporalDateTime.fromString(json['createdOn']) : null,
      _updatedOn = json['updatedOn'] != null ? TemporalDateTime.fromString(json['updatedOn']) : null,
      _likes = json['likes']?.cast<String>(),
      _userId = json['userId'],
      _postID = json['postID'],
      _CommentBelongsToPost = json['CommentBelongsToPost']?['serializedData'] != null
        ? Post.fromJson(new Map<String, dynamic>.from(json['CommentBelongsToPost']['serializedData']))
        : null,
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'commentText': _commentText, 'createdOn': _createdOn?.format(), 'updatedOn': _updatedOn?.format(), 'likes': _likes, 'userId': _userId, 'postID': _postID, 'CommentBelongsToPost': _CommentBelongsToPost?.toJson(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'commentText': _commentText, 'createdOn': _createdOn, 'updatedOn': _updatedOn, 'likes': _likes, 'userId': _userId, 'postID': _postID, 'CommentBelongsToPost': _CommentBelongsToPost, 'createdAt': _createdAt, 'updatedAt': _updatedAt
  };

  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField COMMENTTEXT = QueryField(fieldName: "commentText");
  static final QueryField CREATEDON = QueryField(fieldName: "createdOn");
  static final QueryField UPDATEDON = QueryField(fieldName: "updatedOn");
  static final QueryField LIKES = QueryField(fieldName: "likes");
  static final QueryField USERID = QueryField(fieldName: "userId");
  static final QueryField POSTID = QueryField(fieldName: "postID");
  static final QueryField COMMENTBELONGSTOPOST = QueryField(
    fieldName: "CommentBelongsToPost",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Post).toString()));
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Comment";
    modelSchemaDefinition.pluralName = "Comments";
    
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
      ModelIndex(fields: const ["postID"], name: "byPost")
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Comment.COMMENTTEXT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Comment.CREATEDON,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Comment.UPDATEDON,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Comment.LIKES,
      isRequired: false,
      isArray: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.collection, ofModelName: describeEnum(ModelFieldTypeEnum.string))
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Comment.USERID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Comment.POSTID,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
      key: Comment.COMMENTBELONGSTOPOST,
      isRequired: false,
      targetName: "postCommentsId",
      ofModelName: (Post).toString()
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

class _CommentModelType extends ModelType<Comment> {
  const _CommentModelType();
  
  @override
  Comment fromJson(Map<String, dynamic> jsonData) {
    return Comment.fromJson(jsonData);
  }
}