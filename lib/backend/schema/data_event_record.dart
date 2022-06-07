import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'data_event_record.g.dart';

abstract class DataEventRecord
    implements Built<DataEventRecord, DataEventRecordBuilder> {
  static Serializer<DataEventRecord> get serializer =>
      _$dataEventRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'kategori_event')
  String get kategoriEvent;

  @nullable
  @BuiltValueField(wireName: 'nama_event')
  String get namaEvent;

  @nullable
  @BuiltValueField(wireName: 'dateTime_event')
  DateTime get dateTimeEvent;

  @nullable
  @BuiltValueField(wireName: 'onlineOffline_event')
  String get onlineOfflineEvent;

  @nullable
  @BuiltValueField(wireName: 'foto_event')
  String get fotoEvent;

  @nullable
  @BuiltValueField(wireName: 'video_event')
  String get videoEvent;

  @nullable
  @BuiltValueField(wireName: 'tanggalCreate_event')
  DateTime get tanggalCreateEvent;

  @nullable
  @BuiltValueField(wireName: 'linkZoom_event')
  String get linkZoomEvent;

  @nullable
  @BuiltValueField(wireName: 'link_event')
  String get linkEvent;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(DataEventRecordBuilder builder) => builder
    ..kategoriEvent = ''
    ..namaEvent = ''
    ..onlineOfflineEvent = ''
    ..fotoEvent = ''
    ..videoEvent = ''
    ..linkZoomEvent = ''
    ..linkEvent = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('data_event');

  static Stream<DataEventRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<DataEventRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  DataEventRecord._();
  factory DataEventRecord([void Function(DataEventRecordBuilder) updates]) =
      _$DataEventRecord;

  static DataEventRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createDataEventRecordData({
  String kategoriEvent,
  String namaEvent,
  DateTime dateTimeEvent,
  String onlineOfflineEvent,
  String fotoEvent,
  String videoEvent,
  DateTime tanggalCreateEvent,
  String linkZoomEvent,
  String linkEvent,
}) =>
    serializers.toFirestore(
        DataEventRecord.serializer,
        DataEventRecord((d) => d
          ..kategoriEvent = kategoriEvent
          ..namaEvent = namaEvent
          ..dateTimeEvent = dateTimeEvent
          ..onlineOfflineEvent = onlineOfflineEvent
          ..fotoEvent = fotoEvent
          ..videoEvent = videoEvent
          ..tanggalCreateEvent = tanggalCreateEvent
          ..linkZoomEvent = linkZoomEvent
          ..linkEvent = linkEvent));
