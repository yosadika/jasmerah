import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'anomali_record.g.dart';

abstract class AnomaliRecord
    implements Built<AnomaliRecord, AnomaliRecordBuilder> {
  static Serializer<AnomaliRecord> get serializer => _$anomaliRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'nama_anomali')
  String get namaAnomali;

  @nullable
  @BuiltValueField(wireName: 'foto_anomali')
  String get fotoAnomali;

  @nullable
  @BuiltValueField(wireName: 'tag_anomali')
  String get tagAnomali;

  @nullable
  @BuiltValueField(wireName: 'status_anomali')
  int get statusAnomali;

  @nullable
  @BuiltValueField(wireName: 'tanggal_create_anomali')
  DateTime get tanggalCreateAnomali;

  @nullable
  @BuiltValueField(wireName: 'vendor_anomali')
  int get vendorAnomali;

  @nullable
  @BuiltValueField(wireName: 'user_post_anomali')
  DocumentReference get userPostAnomali;

  @nullable
  @BuiltValueField(wireName: 'uid_ultg_anomali')
  int get uidUltgAnomali;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(AnomaliRecordBuilder builder) => builder
    ..namaAnomali = ''
    ..fotoAnomali = ''
    ..tagAnomali = ''
    ..statusAnomali = 0
    ..vendorAnomali = 0
    ..uidUltgAnomali = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('anomali');

  static Stream<AnomaliRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<AnomaliRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  AnomaliRecord._();
  factory AnomaliRecord([void Function(AnomaliRecordBuilder) updates]) =
      _$AnomaliRecord;

  static AnomaliRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createAnomaliRecordData({
  String namaAnomali,
  String fotoAnomali,
  String tagAnomali,
  int statusAnomali,
  DateTime tanggalCreateAnomali,
  int vendorAnomali,
  DocumentReference userPostAnomali,
  int uidUltgAnomali,
}) =>
    serializers.toFirestore(
        AnomaliRecord.serializer,
        AnomaliRecord((a) => a
          ..namaAnomali = namaAnomali
          ..fotoAnomali = fotoAnomali
          ..tagAnomali = tagAnomali
          ..statusAnomali = statusAnomali
          ..tanggalCreateAnomali = tanggalCreateAnomali
          ..vendorAnomali = vendorAnomali
          ..userPostAnomali = userPostAnomali
          ..uidUltgAnomali = uidUltgAnomali));
