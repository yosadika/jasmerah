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
  @BuiltValueField(wireName: 'uid_anomali')
  String get uidAnomali;

  @nullable
  @BuiltValueField(wireName: 'deskripsi_anomali')
  String get deskripsiAnomali;

  @nullable
  @BuiltValueField(wireName: 'is_jargi_validateAnomali')
  bool get isJargiValidateAnomali;

  @nullable
  @BuiltValueField(wireName: 'jargi_whoValidated')
  DocumentReference get jargiWhoValidated;

  @nullable
  @BuiltValueField(wireName: 'is_k3l_validateAnomali')
  bool get isK3lValidateAnomali;

  @nullable
  @BuiltValueField(wireName: 'k3l_whovalidated')
  DocumentReference get k3lWhovalidated;

  @nullable
  @BuiltValueField(wireName: 'is_renev_validateAnomali')
  bool get isRenevValidateAnomali;

  @nullable
  @BuiltValueField(wireName: 'renev_whoValidated')
  DocumentReference get renevWhoValidated;

  @nullable
  @BuiltValueField(wireName: 'id_count_anomali')
  int get idCountAnomali;

  @nullable
  @BuiltValueField(wireName: 'working_permit_anomali')
  String get workingPermitAnomali;

  @nullable
  @BuiltValueField(wireName: 'is_anomali_scheduled')
  bool get isAnomaliScheduled;

  @nullable
  @BuiltValueField(wireName: 'ultg_location_anomali')
  String get ultgLocationAnomali;

  @nullable
  @BuiltValueField(wireName: 'bay_location_anomali')
  String get bayLocationAnomali;

  @nullable
  @BuiltValueField(wireName: 'user_email_post_anomali')
  String get userEmailPostAnomali;

  @nullable
  @BuiltValueField(wireName: 'user_post_anomali')
  String get userPostAnomali;

  @nullable
  @BuiltValueField(wireName: 'prosesHierarki_anomali')
  int get prosesHierarkiAnomali;

  @nullable
  @BuiltValueField(wireName: 'foto_anomali')
  String get fotoAnomali;

  @nullable
  @BuiltValueField(wireName: 'gardu_location_anomali')
  String get garduLocationAnomali;

  @nullable
  @BuiltValueField(wireName: 'qrCode_anomali')
  String get qrCodeAnomali;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(AnomaliRecordBuilder builder) => builder
    ..namaAnomali = ''
    ..tagAnomali = ''
    ..statusAnomali = 0
    ..vendorAnomali = 0
    ..uidAnomali = ''
    ..deskripsiAnomali = ''
    ..isJargiValidateAnomali = false
    ..isK3lValidateAnomali = false
    ..isRenevValidateAnomali = false
    ..idCountAnomali = 0
    ..workingPermitAnomali = ''
    ..isAnomaliScheduled = false
    ..ultgLocationAnomali = ''
    ..bayLocationAnomali = ''
    ..userEmailPostAnomali = ''
    ..userPostAnomali = ''
    ..prosesHierarkiAnomali = 0
    ..fotoAnomali = ''
    ..garduLocationAnomali = ''
    ..qrCodeAnomali = '';

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
  String tagAnomali,
  int statusAnomali,
  DateTime tanggalCreateAnomali,
  int vendorAnomali,
  String uidAnomali,
  String deskripsiAnomali,
  bool isJargiValidateAnomali,
  DocumentReference jargiWhoValidated,
  bool isK3lValidateAnomali,
  DocumentReference k3lWhovalidated,
  bool isRenevValidateAnomali,
  DocumentReference renevWhoValidated,
  int idCountAnomali,
  String workingPermitAnomali,
  bool isAnomaliScheduled,
  String ultgLocationAnomali,
  String bayLocationAnomali,
  String userEmailPostAnomali,
  String userPostAnomali,
  int prosesHierarkiAnomali,
  String fotoAnomali,
  String garduLocationAnomali,
  String qrCodeAnomali,
}) =>
    serializers.toFirestore(
        AnomaliRecord.serializer,
        AnomaliRecord((a) => a
          ..namaAnomali = namaAnomali
          ..tagAnomali = tagAnomali
          ..statusAnomali = statusAnomali
          ..tanggalCreateAnomali = tanggalCreateAnomali
          ..vendorAnomali = vendorAnomali
          ..uidAnomali = uidAnomali
          ..deskripsiAnomali = deskripsiAnomali
          ..isJargiValidateAnomali = isJargiValidateAnomali
          ..jargiWhoValidated = jargiWhoValidated
          ..isK3lValidateAnomali = isK3lValidateAnomali
          ..k3lWhovalidated = k3lWhovalidated
          ..isRenevValidateAnomali = isRenevValidateAnomali
          ..renevWhoValidated = renevWhoValidated
          ..idCountAnomali = idCountAnomali
          ..workingPermitAnomali = workingPermitAnomali
          ..isAnomaliScheduled = isAnomaliScheduled
          ..ultgLocationAnomali = ultgLocationAnomali
          ..bayLocationAnomali = bayLocationAnomali
          ..userEmailPostAnomali = userEmailPostAnomali
          ..userPostAnomali = userPostAnomali
          ..prosesHierarkiAnomali = prosesHierarkiAnomali
          ..fotoAnomali = fotoAnomali
          ..garduLocationAnomali = garduLocationAnomali
          ..qrCodeAnomali = qrCodeAnomali));
