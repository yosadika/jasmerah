import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'data_sub_peralatan_gardu_record.g.dart';

abstract class DataSubPeralatanGarduRecord
    implements
        Built<DataSubPeralatanGarduRecord, DataSubPeralatanGarduRecordBuilder> {
  static Serializer<DataSubPeralatanGarduRecord> get serializer =>
      _$dataSubPeralatanGarduRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'nama_subPeralatan_gardu')
  String get namaSubPeralatanGardu;

  @nullable
  @BuiltValueField(wireName: 'nama_peralatanGardu')
  String get namaPeralatanGardu;

  @nullable
  @BuiltValueField(wireName: 'namaGardu_subPeralatanGardu')
  String get namaGarduSubPeralatanGardu;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(DataSubPeralatanGarduRecordBuilder builder) =>
      builder
        ..namaSubPeralatanGardu = ''
        ..namaPeralatanGardu = ''
        ..namaGarduSubPeralatanGardu = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('data_subPeralatan_gardu');

  static Stream<DataSubPeralatanGarduRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<DataSubPeralatanGarduRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  DataSubPeralatanGarduRecord._();
  factory DataSubPeralatanGarduRecord(
          [void Function(DataSubPeralatanGarduRecordBuilder) updates]) =
      _$DataSubPeralatanGarduRecord;

  static DataSubPeralatanGarduRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createDataSubPeralatanGarduRecordData({
  String namaSubPeralatanGardu,
  String namaPeralatanGardu,
  String namaGarduSubPeralatanGardu,
}) =>
    serializers.toFirestore(
        DataSubPeralatanGarduRecord.serializer,
        DataSubPeralatanGarduRecord((d) => d
          ..namaSubPeralatanGardu = namaSubPeralatanGardu
          ..namaPeralatanGardu = namaPeralatanGardu
          ..namaGarduSubPeralatanGardu = namaGarduSubPeralatanGardu));
