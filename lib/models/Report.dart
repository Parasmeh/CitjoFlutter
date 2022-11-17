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
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the Report type in your schema. */
@immutable
class Report extends Model {
  static const classType = const _ReportModelType();
  final String id;
  final String? _reportText;
  final TemporalDateTime? _createdOn;
  final TemporalDateTime? _updatedOn;
  final String? _postID;
  final Post? _ReportBelongsToPost;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String? get reportText {
    return _reportText;
  }
  
  TemporalDateTime? get createdOn {
    return _createdOn;
  }
  
  TemporalDateTime? get updatedOn {
    return _updatedOn;
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
  
  Post? get ReportBelongsToPost {
    return _ReportBelongsToPost;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Report._internal({required this.id, reportText, createdOn, updatedOn, required postID, ReportBelongsToPost, createdAt, updatedAt}): _reportText = reportText, _createdOn = createdOn, _updatedOn = updatedOn, _postID = postID, _ReportBelongsToPost = ReportBelongsToPost, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Report({String? id, String? reportText, TemporalDateTime? createdOn, TemporalDateTime? updatedOn, required String postID, Post? ReportBelongsToPost}) {
    return Report._internal(
      id: id == null ? UUID.getUUID() : id,
      reportText: reportText,
      createdOn: createdOn,
      updatedOn: updatedOn,
      postID: postID,
      ReportBelongsToPost: ReportBelongsToPost);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Report &&
      id == other.id &&
      _reportText == other._reportText &&
      _createdOn == other._createdOn &&
      _updatedOn == other._updatedOn &&
      _postID == other._postID &&
      _ReportBelongsToPost == other._ReportBelongsToPost;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Report {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("reportText=" + "$_reportText" + ", ");
    buffer.write("createdOn=" + (_createdOn != null ? _createdOn!.format() : "null") + ", ");
    buffer.write("updatedOn=" + (_updatedOn != null ? _updatedOn!.format() : "null") + ", ");
    buffer.write("postID=" + "$_postID" + ", ");
    buffer.write("ReportBelongsToPost=" + (_ReportBelongsToPost != null ? _ReportBelongsToPost!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Report copyWith({String? id, String? reportText, TemporalDateTime? createdOn, TemporalDateTime? updatedOn, String? postID, Post? ReportBelongsToPost}) {
    return Report._internal(
      id: id ?? this.id,
      reportText: reportText ?? this.reportText,
      createdOn: createdOn ?? this.createdOn,
      updatedOn: updatedOn ?? this.updatedOn,
      postID: postID ?? this.postID,
      ReportBelongsToPost: ReportBelongsToPost ?? this.ReportBelongsToPost);
  }
  
  Report.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _reportText = json['reportText'],
      _createdOn = json['createdOn'] != null ? TemporalDateTime.fromString(json['createdOn']) : null,
      _updatedOn = json['updatedOn'] != null ? TemporalDateTime.fromString(json['updatedOn']) : null,
      _postID = json['postID'],
      _ReportBelongsToPost = json['ReportBelongsToPost']?['serializedData'] != null
        ? Post.fromJson(new Map<String, dynamic>.from(json['ReportBelongsToPost']['serializedData']))
        : null,
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'reportText': _reportText, 'createdOn': _createdOn?.format(), 'updatedOn': _updatedOn?.format(), 'postID': _postID, 'ReportBelongsToPost': _ReportBelongsToPost?.toJson(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'reportText': _reportText, 'createdOn': _createdOn, 'updatedOn': _updatedOn, 'postID': _postID, 'ReportBelongsToPost': _ReportBelongsToPost, 'createdAt': _createdAt, 'updatedAt': _updatedAt
  };

  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField REPORTTEXT = QueryField(fieldName: "reportText");
  static final QueryField CREATEDON = QueryField(fieldName: "createdOn");
  static final QueryField UPDATEDON = QueryField(fieldName: "updatedOn");
  static final QueryField POSTID = QueryField(fieldName: "postID");
  static final QueryField REPORTBELONGSTOPOST = QueryField(
    fieldName: "ReportBelongsToPost",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Post).toString()));
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Report";
    modelSchemaDefinition.pluralName = "Reports";
    
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
      key: Report.REPORTTEXT,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Report.CREATEDON,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Report.UPDATEDON,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Report.POSTID,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
      key: Report.REPORTBELONGSTOPOST,
      isRequired: false,
      targetName: "postReportsId",
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

class _ReportModelType extends ModelType<Report> {
  const _ReportModelType();
  
  @override
  Report fromJson(Map<String, dynamic> jsonData) {
    return Report.fromJson(jsonData);
  }
}