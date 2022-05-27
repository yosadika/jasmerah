import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'data_upt_record.g.dart';

abstract class DataUptRecord
    implements Built<DataUptRecord, DataUptRecordBuilder> {
  static Serializer<DataUptRecord> get serializer => _$dataUptRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'nama_upt')
  String get namaUpt;

  @nullable
  @BuiltValueField(wireName: 'alamat_upt')
  String get alamatUpt;

  @nullable
  @BuiltValueField(wireName: 'nomor_telepon_upt')
  int get nomorTeleponUpt;

  @nullable
  @BuiltValueField(wireName: 'uid_upt')
  int get uidUpt;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(DataUptRecordBuilder builder) => builder
    ..namaUpt = ''
    ..alamatUpt = ''
    ..nomorTeleponUpt = 0
    ..uidUpt = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('data_upt');

  static Stream<DataUptRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<DataUptRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  DataUptRecord._();
  factory DataUptRecord([void Function(DataUptRecordBuilder) updates]) =
      _$DataUptRecord;

  static DataUptRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createDataUptRecordData({
  String namaUpt,
  String alamatUpt,
  int nomorTeleponUpt,
  int uidUpt,
}) =>
    serializers.toFirestore(
        DataUptRecord.serializer,
        DataUptRecord((d) => d
          ..namaUpt = namaUpt
          ..alamatUpt = alamatUpt
          ..nomorTeleponUpt = nomorTeleponUpt
          ..uidUpt = uidUpt));
