import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'data_alat_uji_record.g.dart';

abstract class DataAlatUjiRecord
    implements Built<DataAlatUjiRecord, DataAlatUjiRecordBuilder> {
  static Serializer<DataAlatUjiRecord> get serializer =>
      _$dataAlatUjiRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'nama_alatUji')
  String get namaAlatUji;

  @nullable
  @BuiltValueField(wireName: 'lokasi_alatUji')
  String get lokasiAlatUji;

  @nullable
  @BuiltValueField(wireName: 'foto_alatUji')
  String get fotoAlatUji;

  @nullable
  @BuiltValueField(wireName: 'lastUpdate_alatUji')
  DateTime get lastUpdateAlatUji;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(DataAlatUjiRecordBuilder builder) => builder
    ..namaAlatUji = ''
    ..lokasiAlatUji = ''
    ..fotoAlatUji = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('data_alatUji');

  static Stream<DataAlatUjiRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<DataAlatUjiRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  DataAlatUjiRecord._();
  factory DataAlatUjiRecord([void Function(DataAlatUjiRecordBuilder) updates]) =
      _$DataAlatUjiRecord;

  static DataAlatUjiRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createDataAlatUjiRecordData({
  String namaAlatUji,
  String lokasiAlatUji,
  String fotoAlatUji,
  DateTime lastUpdateAlatUji,
}) =>
    serializers.toFirestore(
        DataAlatUjiRecord.serializer,
        DataAlatUjiRecord((d) => d
          ..namaAlatUji = namaAlatUji
          ..lokasiAlatUji = lokasiAlatUji
          ..fotoAlatUji = fotoAlatUji
          ..lastUpdateAlatUji = lastUpdateAlatUji));
