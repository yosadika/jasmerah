import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'kategori_peralatan_record.g.dart';

abstract class KategoriPeralatanRecord
    implements Built<KategoriPeralatanRecord, KategoriPeralatanRecordBuilder> {
  static Serializer<KategoriPeralatanRecord> get serializer =>
      _$kategoriPeralatanRecordSerializer;

  @nullable
  String get namaPeralatan;

  @nullable
  @BuiltValueField(wireName: 'bukuWiring_lastView')
  DateTime get bukuWiringLastView;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(KategoriPeralatanRecordBuilder builder) =>
      builder..namaPeralatan = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('kategori_Peralatan');

  static Stream<KategoriPeralatanRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<KategoriPeralatanRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  KategoriPeralatanRecord._();
  factory KategoriPeralatanRecord(
          [void Function(KategoriPeralatanRecordBuilder) updates]) =
      _$KategoriPeralatanRecord;

  static KategoriPeralatanRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createKategoriPeralatanRecordData({
  String namaPeralatan,
  DateTime bukuWiringLastView,
}) =>
    serializers.toFirestore(
        KategoriPeralatanRecord.serializer,
        KategoriPeralatanRecord((k) => k
          ..namaPeralatan = namaPeralatan
          ..bukuWiringLastView = bukuWiringLastView));
