import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'data_ultg_record.g.dart';

abstract class DataUltgRecord
    implements Built<DataUltgRecord, DataUltgRecordBuilder> {
  static Serializer<DataUltgRecord> get serializer =>
      _$dataUltgRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'nama_ultg')
  String get namaUltg;

  @nullable
  @BuiltValueField(wireName: 'uid_ultg')
  int get uidUltg;

  @nullable
  @BuiltValueField(wireName: 'simbol_ultg')
  String get simbolUltg;

  @nullable
  @BuiltValueField(wireName: 'upt_ultg')
  String get uptUltg;

  @nullable
  @BuiltValueField(wireName: 'alamat_ultg')
  String get alamatUltg;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(DataUltgRecordBuilder builder) => builder
    ..namaUltg = ''
    ..uidUltg = 0
    ..simbolUltg = ''
    ..uptUltg = ''
    ..alamatUltg = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('data_ultg');

  static Stream<DataUltgRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<DataUltgRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  DataUltgRecord._();
  factory DataUltgRecord([void Function(DataUltgRecordBuilder) updates]) =
      _$DataUltgRecord;

  static DataUltgRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createDataUltgRecordData({
  String namaUltg,
  int uidUltg,
  String simbolUltg,
  String uptUltg,
  String alamatUltg,
}) =>
    serializers.toFirestore(
        DataUltgRecord.serializer,
        DataUltgRecord((d) => d
          ..namaUltg = namaUltg
          ..uidUltg = uidUltg
          ..simbolUltg = simbolUltg
          ..uptUltg = uptUltg
          ..alamatUltg = alamatUltg));
