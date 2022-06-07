import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'data_kategori_event_record.g.dart';

abstract class DataKategoriEventRecord
    implements Built<DataKategoriEventRecord, DataKategoriEventRecordBuilder> {
  static Serializer<DataKategoriEventRecord> get serializer =>
      _$dataKategoriEventRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'nama_kategoriEvent')
  String get namaKategoriEvent;

  @nullable
  @BuiltValueField(wireName: 'foto_kategoriEvent')
  String get fotoKategoriEvent;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(DataKategoriEventRecordBuilder builder) =>
      builder
        ..namaKategoriEvent = ''
        ..fotoKategoriEvent = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('data_kategoriEvent');

  static Stream<DataKategoriEventRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<DataKategoriEventRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  DataKategoriEventRecord._();
  factory DataKategoriEventRecord(
          [void Function(DataKategoriEventRecordBuilder) updates]) =
      _$DataKategoriEventRecord;

  static DataKategoriEventRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createDataKategoriEventRecordData({
  String namaKategoriEvent,
  String fotoKategoriEvent,
}) =>
    serializers.toFirestore(
        DataKategoriEventRecord.serializer,
        DataKategoriEventRecord((d) => d
          ..namaKategoriEvent = namaKategoriEvent
          ..fotoKategoriEvent = fotoKategoriEvent));
