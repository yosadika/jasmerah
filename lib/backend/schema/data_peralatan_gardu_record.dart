import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'data_peralatan_gardu_record.g.dart';

abstract class DataPeralatanGarduRecord
    implements
        Built<DataPeralatanGarduRecord, DataPeralatanGarduRecordBuilder> {
  static Serializer<DataPeralatanGarduRecord> get serializer =>
      _$dataPeralatanGarduRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'namaPeralatan_peralatangardu')
  String get namaPeralatanPeralatangardu;

  @nullable
  @BuiltValueField(wireName: 'namaGardu_peralatanGardu')
  String get namaGarduPeralatanGardu;

  @nullable
  @BuiltValueField(wireName: 'fotoPeralatan_peralatanGardu')
  String get fotoPeralatanPeralatanGardu;

  @nullable
  @BuiltValueField(wireName: 'lastUpdate_peralatanGardu')
  DateTime get lastUpdatePeralatanGardu;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(DataPeralatanGarduRecordBuilder builder) =>
      builder
        ..namaPeralatanPeralatangardu = ''
        ..namaGarduPeralatanGardu = ''
        ..fotoPeralatanPeralatanGardu = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('data_peralatan_gardu');

  static Stream<DataPeralatanGarduRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<DataPeralatanGarduRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  DataPeralatanGarduRecord._();
  factory DataPeralatanGarduRecord(
          [void Function(DataPeralatanGarduRecordBuilder) updates]) =
      _$DataPeralatanGarduRecord;

  static DataPeralatanGarduRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createDataPeralatanGarduRecordData({
  String namaPeralatanPeralatangardu,
  String namaGarduPeralatanGardu,
  String fotoPeralatanPeralatanGardu,
  DateTime lastUpdatePeralatanGardu,
}) =>
    serializers.toFirestore(
        DataPeralatanGarduRecord.serializer,
        DataPeralatanGarduRecord((d) => d
          ..namaPeralatanPeralatangardu = namaPeralatanPeralatangardu
          ..namaGarduPeralatanGardu = namaGarduPeralatanGardu
          ..fotoPeralatanPeralatanGardu = fotoPeralatanPeralatanGardu
          ..lastUpdatePeralatanGardu = lastUpdatePeralatanGardu));
