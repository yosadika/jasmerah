import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'data_gardu_induk_record.g.dart';

abstract class DataGarduIndukRecord
    implements Built<DataGarduIndukRecord, DataGarduIndukRecordBuilder> {
  static Serializer<DataGarduIndukRecord> get serializer =>
      _$dataGarduIndukRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'nama_gardu_induk')
  String get namaGarduInduk;

  @nullable
  @BuiltValueField(wireName: 'uid_gardu_induk')
  int get uidGarduInduk;

  @nullable
  @BuiltValueField(wireName: 'ultg_garduInduk')
  String get ultgGarduInduk;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(DataGarduIndukRecordBuilder builder) => builder
    ..namaGarduInduk = ''
    ..uidGarduInduk = 0
    ..ultgGarduInduk = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('data_gardu_induk');

  static Stream<DataGarduIndukRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<DataGarduIndukRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  DataGarduIndukRecord._();
  factory DataGarduIndukRecord(
          [void Function(DataGarduIndukRecordBuilder) updates]) =
      _$DataGarduIndukRecord;

  static DataGarduIndukRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createDataGarduIndukRecordData({
  String namaGarduInduk,
  int uidGarduInduk,
  String ultgGarduInduk,
}) =>
    serializers.toFirestore(
        DataGarduIndukRecord.serializer,
        DataGarduIndukRecord((d) => d
          ..namaGarduInduk = namaGarduInduk
          ..uidGarduInduk = uidGarduInduk
          ..ultgGarduInduk = ultgGarduInduk));
