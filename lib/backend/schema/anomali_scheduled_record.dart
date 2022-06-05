import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'anomali_scheduled_record.g.dart';

abstract class AnomaliScheduledRecord
    implements Built<AnomaliScheduledRecord, AnomaliScheduledRecordBuilder> {
  static Serializer<AnomaliScheduledRecord> get serializer =>
      _$anomaliScheduledRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'nama_anomali_scheduled')
  String get namaAnomaliScheduled;

  @nullable
  @BuiltValueField(wireName: 'nama_user_scheduled')
  String get namaUserScheduled;

  @nullable
  @BuiltValueField(wireName: 'working_permit_scheduled')
  String get workingPermitScheduled;

  @nullable
  @BuiltValueField(wireName: 'is_butuh_material')
  bool get isButuhMaterial;

  @nullable
  @BuiltValueField(wireName: 'waktuPekerjaan_start_scheduled')
  DateTime get waktuPekerjaanStartScheduled;

  @nullable
  @BuiltValueField(wireName: 'waktuPekerjaan_end_scheduled')
  DateTime get waktuPekerjaanEndScheduled;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(AnomaliScheduledRecordBuilder builder) =>
      builder
        ..namaAnomaliScheduled = ''
        ..namaUserScheduled = ''
        ..workingPermitScheduled = ''
        ..isButuhMaterial = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('anomali_scheduled');

  static Stream<AnomaliScheduledRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<AnomaliScheduledRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  AnomaliScheduledRecord._();
  factory AnomaliScheduledRecord(
          [void Function(AnomaliScheduledRecordBuilder) updates]) =
      _$AnomaliScheduledRecord;

  static AnomaliScheduledRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createAnomaliScheduledRecordData({
  String namaAnomaliScheduled,
  String namaUserScheduled,
  String workingPermitScheduled,
  bool isButuhMaterial,
  DateTime waktuPekerjaanStartScheduled,
  DateTime waktuPekerjaanEndScheduled,
}) =>
    serializers.toFirestore(
        AnomaliScheduledRecord.serializer,
        AnomaliScheduledRecord((a) => a
          ..namaAnomaliScheduled = namaAnomaliScheduled
          ..namaUserScheduled = namaUserScheduled
          ..workingPermitScheduled = workingPermitScheduled
          ..isButuhMaterial = isButuhMaterial
          ..waktuPekerjaanStartScheduled = waktuPekerjaanStartScheduled
          ..waktuPekerjaanEndScheduled = waktuPekerjaanEndScheduled));
