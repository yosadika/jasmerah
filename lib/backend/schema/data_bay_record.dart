import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'data_bay_record.g.dart';

abstract class DataBayRecord
    implements Built<DataBayRecord, DataBayRecordBuilder> {
  static Serializer<DataBayRecord> get serializer => _$dataBayRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'bay_nama_bay')
  String get bayNamaBay;

  @nullable
  @BuiltValueField(wireName: 'bay_kategori_bay')
  String get bayKategoriBay;

  @nullable
  @BuiltValueField(wireName: 'bay_nama_gardu')
  String get bayNamaGardu;

  @nullable
  @BuiltValueField(wireName: 'bay_anomali_count')
  int get bayAnomaliCount;

  @nullable
  @BuiltValueField(wireName: 'bay_kategoriSingkat_bay')
  String get bayKategoriSingkatBay;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(DataBayRecordBuilder builder) => builder
    ..bayNamaBay = ''
    ..bayKategoriBay = ''
    ..bayNamaGardu = ''
    ..bayAnomaliCount = 0
    ..bayKategoriSingkatBay = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('data_bay');

  static Stream<DataBayRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<DataBayRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  DataBayRecord._();
  factory DataBayRecord([void Function(DataBayRecordBuilder) updates]) =
      _$DataBayRecord;

  static DataBayRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createDataBayRecordData({
  String bayNamaBay,
  String bayKategoriBay,
  String bayNamaGardu,
  int bayAnomaliCount,
  String bayKategoriSingkatBay,
}) =>
    serializers.toFirestore(
        DataBayRecord.serializer,
        DataBayRecord((d) => d
          ..bayNamaBay = bayNamaBay
          ..bayKategoriBay = bayKategoriBay
          ..bayNamaGardu = bayNamaGardu
          ..bayAnomaliCount = bayAnomaliCount
          ..bayKategoriSingkatBay = bayKategoriSingkatBay));
