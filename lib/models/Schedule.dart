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

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, override_on_non_overriding_member, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart' as amplify_core;


/** This is an auto generated class representing the Schedule type in your schema. */
class Schedule extends amplify_core.Model {
  static const classType = const _ScheduleModelType();
  final String id;
  final String? _author;
  final String? _description;
  final bool? _completed;
  final amplify_core.TemporalDateTime? _deadline;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  ScheduleModelIdentifier get modelIdentifier {
      return ScheduleModelIdentifier(
        id: id
      );
  }
  
  String get author {
    try {
      return _author!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get description {
    try {
      return _description!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  bool get completed {
    try {
      return _completed!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  amplify_core.TemporalDateTime? get deadline {
    return _deadline;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Schedule._internal({required this.id, required author, required description, required completed, deadline, createdAt, updatedAt}): _author = author, _description = description, _completed = completed, _deadline = deadline, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Schedule({String? id, required String author, required String description, required bool completed, amplify_core.TemporalDateTime? deadline}) {
    return Schedule._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      author: author,
      description: description,
      completed: completed,
      deadline: deadline);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Schedule &&
      id == other.id &&
      _author == other._author &&
      _description == other._description &&
      _completed == other._completed &&
      _deadline == other._deadline;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Schedule {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("author=" + "$_author" + ", ");
    buffer.write("description=" + "$_description" + ", ");
    buffer.write("completed=" + (_completed != null ? _completed!.toString() : "null") + ", ");
    buffer.write("deadline=" + (_deadline != null ? _deadline!.format() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Schedule copyWith({String? author, String? description, bool? completed, amplify_core.TemporalDateTime? deadline}) {
    return Schedule._internal(
      id: id,
      author: author ?? this.author,
      description: description ?? this.description,
      completed: completed ?? this.completed,
      deadline: deadline ?? this.deadline);
  }
  
  Schedule copyWithModelFieldValues({
    ModelFieldValue<String>? author,
    ModelFieldValue<String>? description,
    ModelFieldValue<bool>? completed,
    ModelFieldValue<amplify_core.TemporalDateTime?>? deadline
  }) {
    return Schedule._internal(
      id: id,
      author: author == null ? this.author : author.value,
      description: description == null ? this.description : description.value,
      completed: completed == null ? this.completed : completed.value,
      deadline: deadline == null ? this.deadline : deadline.value
    );
  }
  
  Schedule.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _author = json['author'],
      _description = json['description'],
      _completed = json['completed'],
      _deadline = json['deadline'] != null ? amplify_core.TemporalDateTime.fromString(json['deadline']) : null,
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'author': _author, 'description': _description, 'completed': _completed, 'deadline': _deadline?.format(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'author': _author,
    'description': _description,
    'completed': _completed,
    'deadline': _deadline,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<ScheduleModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<ScheduleModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final AUTHOR = amplify_core.QueryField(fieldName: "author");
  static final DESCRIPTION = amplify_core.QueryField(fieldName: "description");
  static final COMPLETED = amplify_core.QueryField(fieldName: "completed");
  static final DEADLINE = amplify_core.QueryField(fieldName: "deadline");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Schedule";
    modelSchemaDefinition.pluralName = "Schedules";
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Schedule.AUTHOR,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Schedule.DESCRIPTION,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Schedule.COMPLETED,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.bool)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: Schedule.DEADLINE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _ScheduleModelType extends amplify_core.ModelType<Schedule> {
  const _ScheduleModelType();
  
  @override
  Schedule fromJson(Map<String, dynamic> jsonData) {
    return Schedule.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Schedule';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Schedule] in your schema.
 */
class ScheduleModelIdentifier implements amplify_core.ModelIdentifier<Schedule> {
  final String id;

  /** Create an instance of ScheduleModelIdentifier using [id] the primary key. */
  const ScheduleModelIdentifier({
    required this.id});
  
  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{
    'id': id
  });
  
  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
    .entries
    .map((entry) => (<String, dynamic>{ entry.key: entry.value }))
    .toList();
  
  @override
  String serializeAsString() => serializeAsMap().values.join('#');
  
  @override
  String toString() => 'ScheduleModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is ScheduleModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}