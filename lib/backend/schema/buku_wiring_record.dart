import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'buku_wiring_record.g.dart';

abstract class BukuWiringRecord
    implements Built<BukuWiringRecord, BukuWiringRecordBuilder> {
  static Serializer<BukuWiringRecord> get serializer =>
      _$bukuWiringRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'namaBuku_bukuWiring')
  String get namaBukuBukuWiring;

  @nullable
  @BuiltValueField(wireName: 'kategoriBuku_bukuwiring')
  String get kategoriBukuBukuwiring;

  @nullable
  @BuiltValueField(wireName: 'fileBuku_bukuWiring')
  String get fileBukuBukuWiring;

  @nullable
  @BuiltValueField(wireName: 'terakhirDilihat_bukuWiring')
  DateTime get terakhirDilihatBukuWiring;

  @nullable
  @BuiltValueField(wireName: 'countView_bukuWiring')
  int get countViewBukuWiring;

  @nullable
  @BuiltValueField(wireName: 'tanggalUpload_bukuWiring')
  DateTime get tanggalUploadBukuWiring;

  @nullable
  @BuiltValueField(wireName: 'merk_bukuWiring')
  String get merkBukuWiring;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(BukuWiringRecordBuilder builder) => builder
    ..namaBukuBukuWiring = ''
    ..kategoriBukuBukuwiring = ''
    ..fileBukuBukuWiring = ''
    ..countViewBukuWiring = 0
    ..merkBukuWiring = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('bukuWiring');

  static Stream<BukuWiringRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<BukuWiringRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  BukuWiringRecord._();
  factory BukuWiringRecord([void Function(BukuWiringRecordBuilder) updates]) =
      _$BukuWiringRecord;

  static BukuWiringRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createBukuWiringRecordData({
  String namaBukuBukuWiring,
  String kategoriBukuBukuwiring,
  String fileBukuBukuWiring,
  DateTime terakhirDilihatBukuWiring,
  int countViewBukuWiring,
  DateTime tanggalUploadBukuWiring,
  String merkBukuWiring,
}) =>
    serializers.toFirestore(
        BukuWiringRecord.serializer,
        BukuWiringRecord((b) => b
          ..namaBukuBukuWiring = namaBukuBukuWiring
          ..kategoriBukuBukuwiring = kategoriBukuBukuwiring
          ..fileBukuBukuWiring = fileBukuBukuWiring
          ..terakhirDilihatBukuWiring = terakhirDilihatBukuWiring
          ..countViewBukuWiring = countViewBukuWiring
          ..tanggalUploadBukuWiring = tanggalUploadBukuWiring
          ..merkBukuWiring = merkBukuWiring));
