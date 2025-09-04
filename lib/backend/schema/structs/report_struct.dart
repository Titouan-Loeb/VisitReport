// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReportStruct extends BaseStruct {
  ReportStruct({
    String? client,
    List<String>? imagePaths,
    List<String>? audioPaths,
    String? addressString,
    String? notes,
    DateTime? creationTime,
  })  : _client = client,
        _imagePaths = imagePaths,
        _audioPaths = audioPaths,
        _addressString = addressString,
        _notes = notes,
        _creationTime = creationTime;

  // "Client" field.
  String? _client;
  String get client => _client ?? '';
  set client(String? val) => _client = val;

  bool hasClient() => _client != null;

  // "ImagePaths" field.
  List<String>? _imagePaths;
  List<String> get imagePaths => _imagePaths ?? const [];
  set imagePaths(List<String>? val) => _imagePaths = val;

  void updateImagePaths(Function(List<String>) updateFn) {
    updateFn(_imagePaths ??= []);
  }

  bool hasImagePaths() => _imagePaths != null;

  // "AudioPaths" field.
  List<String>? _audioPaths;
  List<String> get audioPaths => _audioPaths ?? const [];
  set audioPaths(List<String>? val) => _audioPaths = val;

  void updateAudioPaths(Function(List<String>) updateFn) {
    updateFn(_audioPaths ??= []);
  }

  bool hasAudioPaths() => _audioPaths != null;

  // "AddressString" field.
  String? _addressString;
  String get addressString => _addressString ?? '';
  set addressString(String? val) => _addressString = val;

  bool hasAddressString() => _addressString != null;

  // "Notes" field.
  String? _notes;
  String get notes => _notes ?? '';
  set notes(String? val) => _notes = val;

  bool hasNotes() => _notes != null;

  // "CreationTime" field.
  DateTime? _creationTime;
  DateTime? get creationTime => _creationTime;
  set creationTime(DateTime? val) => _creationTime = val;

  bool hasCreationTime() => _creationTime != null;

  static ReportStruct fromMap(Map<String, dynamic> data) => ReportStruct(
        client: data['Client'] as String?,
        imagePaths: getDataList(data['ImagePaths']),
        audioPaths: getDataList(data['AudioPaths']),
        addressString: data['AddressString'] as String?,
        notes: data['Notes'] as String?,
        creationTime: data['CreationTime'] as DateTime?,
      );

  static ReportStruct? maybeFromMap(dynamic data) =>
      data is Map ? ReportStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'Client': _client,
        'ImagePaths': _imagePaths,
        'AudioPaths': _audioPaths,
        'AddressString': _addressString,
        'Notes': _notes,
        'CreationTime': _creationTime,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Client': serializeParam(
          _client,
          ParamType.String,
        ),
        'ImagePaths': serializeParam(
          _imagePaths,
          ParamType.String,
          isList: true,
        ),
        'AudioPaths': serializeParam(
          _audioPaths,
          ParamType.String,
          isList: true,
        ),
        'AddressString': serializeParam(
          _addressString,
          ParamType.String,
        ),
        'Notes': serializeParam(
          _notes,
          ParamType.String,
        ),
        'CreationTime': serializeParam(
          _creationTime,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static ReportStruct fromSerializableMap(Map<String, dynamic> data) =>
      ReportStruct(
        client: deserializeParam(
          data['Client'],
          ParamType.String,
          false,
        ),
        imagePaths: deserializeParam<String>(
          data['ImagePaths'],
          ParamType.String,
          true,
        ),
        audioPaths: deserializeParam<String>(
          data['AudioPaths'],
          ParamType.String,
          true,
        ),
        addressString: deserializeParam(
          data['AddressString'],
          ParamType.String,
          false,
        ),
        notes: deserializeParam(
          data['Notes'],
          ParamType.String,
          false,
        ),
        creationTime: deserializeParam(
          data['CreationTime'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'ReportStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ReportStruct &&
        client == other.client &&
        listEquality.equals(imagePaths, other.imagePaths) &&
        listEquality.equals(audioPaths, other.audioPaths) &&
        addressString == other.addressString &&
        notes == other.notes &&
        creationTime == other.creationTime;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [client, imagePaths, audioPaths, addressString, notes, creationTime]);
}

ReportStruct createReportStruct({
  String? client,
  String? addressString,
  String? notes,
  DateTime? creationTime,
}) =>
    ReportStruct(
      client: client,
      addressString: addressString,
      notes: notes,
      creationTime: creationTime,
    );
