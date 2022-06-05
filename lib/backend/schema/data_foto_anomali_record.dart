import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'data_foto_anomali_record.g.dart';

abstract class DataFotoAnomaliRecord
    implements Built<DataFotoAnomaliRecord, DataFotoAnomaliRecordBuilder> {
  static Serializer<DataFotoAnomaliRecord> get serializer =>
      _$dataFotoAnomaliRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'foto_Anomali')
  String get fotoAnomali;

  @nullable
  @BuiltValueField(wireName: 'userUpload_fotoAnomali')
  String get userUploadFotoAnomali;

  @nullable
  @BuiltValueField(wireName: 'namaAnomali_fotoAnomali')
  String get namaAnomaliFotoAnomali;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(DataFotoAnomaliRecordBuilder builder) =>
      builder
        ..fotoAnomali = ''
        ..userUploadFotoAnomali = ''
        ..namaAnomaliFotoAnomali = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('data_Foto_Anomali');

  static Stream<DataFotoAnomaliRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<DataFotoAnomaliRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  DataFotoAnomaliRecord._();
  factory DataFotoAnomaliRecord(
          [void Function(DataFotoAnomaliRecordBuilder) updates]) =
      _$DataFotoAnomaliRecord;

  static DataFotoAnomaliRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createDataFotoAnomaliRecordData({
  String fotoAnomali,
  String userUploadFotoAnomali,
  String namaAnomaliFotoAnomali,
}) =>
    serializers.toFirestore(
        DataFotoAnomaliRecord.serializer,
        DataFotoAnomaliRecord((d) => d
          ..fotoAnomali = fotoAnomali
          ..userUploadFotoAnomali = userUploadFotoAnomali
          ..namaAnomaliFotoAnomali = namaAnomaliFotoAnomali));
