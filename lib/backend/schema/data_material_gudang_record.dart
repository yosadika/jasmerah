import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'data_material_gudang_record.g.dart';

abstract class DataMaterialGudangRecord
    implements
        Built<DataMaterialGudangRecord, DataMaterialGudangRecordBuilder> {
  static Serializer<DataMaterialGudangRecord> get serializer =>
      _$dataMaterialGudangRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'nama_materialGudang')
  String get namaMaterialGudang;

  @nullable
  @BuiltValueField(wireName: 'lokasi_materialGudang')
  String get lokasiMaterialGudang;

  @nullable
  @BuiltValueField(wireName: 'foto_materialGudang')
  String get fotoMaterialGudang;

  @nullable
  @BuiltValueField(wireName: 'lastUpdate_materialGudang')
  DateTime get lastUpdateMaterialGudang;

  @nullable
  @BuiltValueField(wireName: 'jumlah_materialGudang')
  int get jumlahMaterialGudang;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(DataMaterialGudangRecordBuilder builder) =>
      builder
        ..namaMaterialGudang = ''
        ..lokasiMaterialGudang = ''
        ..fotoMaterialGudang = ''
        ..jumlahMaterialGudang = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('data_materialGudang');

  static Stream<DataMaterialGudangRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<DataMaterialGudangRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  DataMaterialGudangRecord._();
  factory DataMaterialGudangRecord(
          [void Function(DataMaterialGudangRecordBuilder) updates]) =
      _$DataMaterialGudangRecord;

  static DataMaterialGudangRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createDataMaterialGudangRecordData({
  String namaMaterialGudang,
  String lokasiMaterialGudang,
  String fotoMaterialGudang,
  DateTime lastUpdateMaterialGudang,
  int jumlahMaterialGudang,
}) =>
    serializers.toFirestore(
        DataMaterialGudangRecord.serializer,
        DataMaterialGudangRecord((d) => d
          ..namaMaterialGudang = namaMaterialGudang
          ..lokasiMaterialGudang = lokasiMaterialGudang
          ..fotoMaterialGudang = fotoMaterialGudang
          ..lastUpdateMaterialGudang = lastUpdateMaterialGudang
          ..jumlahMaterialGudang = jumlahMaterialGudang));
