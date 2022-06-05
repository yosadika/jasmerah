import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'data_k2lh_record.g.dart';

abstract class DataK2lhRecord
    implements Built<DataK2lhRecord, DataK2lhRecordBuilder> {
  static Serializer<DataK2lhRecord> get serializer =>
      _$dataK2lhRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'namaBarang_k2lh')
  String get namaBarangK2lh;

  @nullable
  @BuiltValueField(wireName: 'namaLokasi_k2lh')
  String get namaLokasiK2lh;

  @nullable
  @BuiltValueField(wireName: 'fotoBarang_k2lh')
  String get fotoBarangK2lh;

  @nullable
  @BuiltValueField(wireName: 'jumlahBarang_k2lh')
  int get jumlahBarangK2lh;

  @nullable
  @BuiltValueField(wireName: 'lastUpdate_k2lh')
  DateTime get lastUpdateK2lh;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(DataK2lhRecordBuilder builder) => builder
    ..namaBarangK2lh = ''
    ..namaLokasiK2lh = ''
    ..fotoBarangK2lh = ''
    ..jumlahBarangK2lh = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('data_k2lh');

  static Stream<DataK2lhRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<DataK2lhRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  DataK2lhRecord._();
  factory DataK2lhRecord([void Function(DataK2lhRecordBuilder) updates]) =
      _$DataK2lhRecord;

  static DataK2lhRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createDataK2lhRecordData({
  String namaBarangK2lh,
  String namaLokasiK2lh,
  String fotoBarangK2lh,
  int jumlahBarangK2lh,
  DateTime lastUpdateK2lh,
}) =>
    serializers.toFirestore(
        DataK2lhRecord.serializer,
        DataK2lhRecord((d) => d
          ..namaBarangK2lh = namaBarangK2lh
          ..namaLokasiK2lh = namaLokasiK2lh
          ..fotoBarangK2lh = fotoBarangK2lh
          ..jumlahBarangK2lh = jumlahBarangK2lh
          ..lastUpdateK2lh = lastUpdateK2lh));
