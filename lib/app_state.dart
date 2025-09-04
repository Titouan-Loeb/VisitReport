import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _notes = await secureStorage.getString('ff_notes') ?? _notes;
    });
    await _safeInitAsync(() async {
      _newNotes = await secureStorage.getString('ff_newNotes') ?? _newNotes;
    });
    await _safeInitAsync(() async {
      _addressString =
          await secureStorage.getString('ff_addressString') ?? _addressString;
    });
    await _safeInitAsync(() async {
      _client = await secureStorage.getString('ff_client') ?? _client;
    });
    await _safeInitAsync(() async {
      _lastFileName =
          await secureStorage.getString('ff_lastFileName') ?? _lastFileName;
    });
    await _safeInitAsync(() async {
      _imageFilepaths =
          await secureStorage.getStringList('ff_imageFilepaths') ??
              _imageFilepaths;
    });
    await _safeInitAsync(() async {
      _audioPaths =
          await secureStorage.getStringList('ff_audioPaths') ?? _audioPaths;
    });
    await _safeInitAsync(() async {
      _History = (await secureStorage.getStringList('ff_History'))
              ?.map((x) {
                try {
                  return ReportStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _History;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  String _notes = '';
  String get notes => _notes;
  set notes(String value) {
    _notes = value;
    secureStorage.setString('ff_notes', value);
  }

  void deleteNotes() {
    secureStorage.delete(key: 'ff_notes');
  }

  String _newNotes = '';
  String get newNotes => _newNotes;
  set newNotes(String value) {
    _newNotes = value;
    secureStorage.setString('ff_newNotes', value);
  }

  void deleteNewNotes() {
    secureStorage.delete(key: 'ff_newNotes');
  }

  String _addressString = '';
  String get addressString => _addressString;
  set addressString(String value) {
    _addressString = value;
    secureStorage.setString('ff_addressString', value);
  }

  void deleteAddressString() {
    secureStorage.delete(key: 'ff_addressString');
  }

  String _client = '';
  String get client => _client;
  set client(String value) {
    _client = value;
    secureStorage.setString('ff_client', value);
  }

  void deleteClient() {
    secureStorage.delete(key: 'ff_client');
  }

  String _lastFileName = '';
  String get lastFileName => _lastFileName;
  set lastFileName(String value) {
    _lastFileName = value;
    secureStorage.setString('ff_lastFileName', value);
  }

  void deleteLastFileName() {
    secureStorage.delete(key: 'ff_lastFileName');
  }

  List<String> _imageFilepaths = [];
  List<String> get imageFilepaths => _imageFilepaths;
  set imageFilepaths(List<String> value) {
    _imageFilepaths = value;
    secureStorage.setStringList('ff_imageFilepaths', value);
  }

  void deleteImageFilepaths() {
    secureStorage.delete(key: 'ff_imageFilepaths');
  }

  void addToImageFilepaths(String value) {
    imageFilepaths.add(value);
    secureStorage.setStringList('ff_imageFilepaths', _imageFilepaths);
  }

  void removeFromImageFilepaths(String value) {
    imageFilepaths.remove(value);
    secureStorage.setStringList('ff_imageFilepaths', _imageFilepaths);
  }

  void removeAtIndexFromImageFilepaths(int index) {
    imageFilepaths.removeAt(index);
    secureStorage.setStringList('ff_imageFilepaths', _imageFilepaths);
  }

  void updateImageFilepathsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    imageFilepaths[index] = updateFn(_imageFilepaths[index]);
    secureStorage.setStringList('ff_imageFilepaths', _imageFilepaths);
  }

  void insertAtIndexInImageFilepaths(int index, String value) {
    imageFilepaths.insert(index, value);
    secureStorage.setStringList('ff_imageFilepaths', _imageFilepaths);
  }

  bool _isRecording = false;
  bool get isRecording => _isRecording;
  set isRecording(bool value) {
    _isRecording = value;
  }

  List<String> _audioPaths = [];
  List<String> get audioPaths => _audioPaths;
  set audioPaths(List<String> value) {
    _audioPaths = value;
    secureStorage.setStringList('ff_audioPaths', value);
  }

  void deleteAudioPaths() {
    secureStorage.delete(key: 'ff_audioPaths');
  }

  void addToAudioPaths(String value) {
    audioPaths.add(value);
    secureStorage.setStringList('ff_audioPaths', _audioPaths);
  }

  void removeFromAudioPaths(String value) {
    audioPaths.remove(value);
    secureStorage.setStringList('ff_audioPaths', _audioPaths);
  }

  void removeAtIndexFromAudioPaths(int index) {
    audioPaths.removeAt(index);
    secureStorage.setStringList('ff_audioPaths', _audioPaths);
  }

  void updateAudioPathsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    audioPaths[index] = updateFn(_audioPaths[index]);
    secureStorage.setStringList('ff_audioPaths', _audioPaths);
  }

  void insertAtIndexInAudioPaths(int index, String value) {
    audioPaths.insert(index, value);
    secureStorage.setStringList('ff_audioPaths', _audioPaths);
  }

  List<ReportStruct> _History = [];
  List<ReportStruct> get History => _History;
  set History(List<ReportStruct> value) {
    _History = value;
    secureStorage.setStringList(
        'ff_History', value.map((x) => x.serialize()).toList());
  }

  void deleteHistory() {
    secureStorage.delete(key: 'ff_History');
  }

  void addToHistory(ReportStruct value) {
    History.add(value);
    secureStorage.setStringList(
        'ff_History', _History.map((x) => x.serialize()).toList());
  }

  void removeFromHistory(ReportStruct value) {
    History.remove(value);
    secureStorage.setStringList(
        'ff_History', _History.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromHistory(int index) {
    History.removeAt(index);
    secureStorage.setStringList(
        'ff_History', _History.map((x) => x.serialize()).toList());
  }

  void updateHistoryAtIndex(
    int index,
    ReportStruct Function(ReportStruct) updateFn,
  ) {
    History[index] = updateFn(_History[index]);
    secureStorage.setStringList(
        'ff_History', _History.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInHistory(int index, ReportStruct value) {
    History.insert(index, value);
    secureStorage.setStringList(
        'ff_History', _History.map((x) => x.serialize()).toList());
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
