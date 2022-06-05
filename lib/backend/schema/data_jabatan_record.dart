import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'data_jabatan_record.g.dart';

abstract class DataJabatanRecord
    implements Built<DataJabatanRecord, DataJabatanRecordBuilder> {
  static Serializer<DataJabatanRecord> get serializer =>
      _$dataJabatanRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'nama_jabatan')
  String get namaJabatan;

  @nullable
  @BuiltValueField(wireName: 'jabatan_is_unit')
  bool get jabatanIsUnit;

  @nullable
  @BuiltValueField(wireName: 'nama_unit')
  DocumentReference get namaUnit;

  @nullable
  @BuiltValueField(wireName: 'jabatan_is_subunit')
  bool get jabatanIsSubunit;

  @nullable
  @BuiltValueField(wireName: 'nama_subunit')
  DocumentReference get namaSubunit;

  @nullable
  String get uid;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(DataJabatanRecordBuilder builder) => builder
    ..namaJabatan = ''
    ..jabatanIsUnit = false
    ..jabatanIsSubunit = false
    ..uid = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('data_jabatan');

  static Stream<DataJabatanRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<DataJabatanRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  DataJabatanRecord._();
  factory DataJabatanRecord([void Function(DataJabatanRecordBuilder) updates]) =
      _$DataJabatanRecord;

  static DataJabatanRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createDataJabatanRecordData({
  String namaJabatan,
  bool jabatanIsUnit,
  DocumentReference namaUnit,
  bool jabatanIsSubunit,
  DocumentReference namaSubunit,
  String uid,
}) =>
    serializers.toFirestore(
        DataJabatanRecord.serializer,
        DataJabatanRecord((d) => d
          ..namaJabatan = namaJabatan
          ..jabatanIsUnit = jabatanIsUnit
          ..namaUnit = namaUnit
          ..jabatanIsSubunit = jabatanIsSubunit
          ..namaSubunit = namaSubunit
          ..uid = uid));
