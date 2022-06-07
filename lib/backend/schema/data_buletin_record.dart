import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'data_buletin_record.g.dart';

abstract class DataBuletinRecord
    implements Built<DataBuletinRecord, DataBuletinRecordBuilder> {
  static Serializer<DataBuletinRecord> get serializer =>
      _$dataBuletinRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'kategori_buletin')
  String get kategoriBuletin;

  @nullable
  @BuiltValueField(wireName: 'judul_buletin')
  String get judulBuletin;

  @nullable
  @BuiltValueField(wireName: 'isi_buletin')
  String get isiBuletin;

  @nullable
  @BuiltValueField(wireName: 'foto_buletin')
  String get fotoBuletin;

  @nullable
  @BuiltValueField(wireName: 'video_buletin')
  String get videoBuletin;

  @nullable
  @BuiltValueField(wireName: 'userPost_buletin')
  String get userPostBuletin;

  @nullable
  @BuiltValueField(wireName: 'lastUpdate_buletin')
  DateTime get lastUpdateBuletin;

  @nullable
  @BuiltValueField(wireName: 'likes_buletin')
  int get likesBuletin;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(DataBuletinRecordBuilder builder) => builder
    ..kategoriBuletin = ''
    ..judulBuletin = ''
    ..isiBuletin = ''
    ..fotoBuletin = ''
    ..videoBuletin = ''
    ..userPostBuletin = ''
    ..likesBuletin = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('data_buletin');

  static Stream<DataBuletinRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<DataBuletinRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  DataBuletinRecord._();
  factory DataBuletinRecord([void Function(DataBuletinRecordBuilder) updates]) =
      _$DataBuletinRecord;

  static DataBuletinRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createDataBuletinRecordData({
  String kategoriBuletin,
  String judulBuletin,
  String isiBuletin,
  String fotoBuletin,
  String videoBuletin,
  String userPostBuletin,
  DateTime lastUpdateBuletin,
  int likesBuletin,
}) =>
    serializers.toFirestore(
        DataBuletinRecord.serializer,
        DataBuletinRecord((d) => d
          ..kategoriBuletin = kategoriBuletin
          ..judulBuletin = judulBuletin
          ..isiBuletin = isiBuletin
          ..fotoBuletin = fotoBuletin
          ..videoBuletin = videoBuletin
          ..userPostBuletin = userPostBuletin
          ..lastUpdateBuletin = lastUpdateBuletin
          ..likesBuletin = likesBuletin));
