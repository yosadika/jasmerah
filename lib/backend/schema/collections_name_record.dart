import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'collections_name_record.g.dart';

abstract class CollectionsNameRecord
    implements Built<CollectionsNameRecord, CollectionsNameRecordBuilder> {
  static Serializer<CollectionsNameRecord> get serializer =>
      _$collectionsNameRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'collection_list')
  String get collectionList;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(CollectionsNameRecordBuilder builder) =>
      builder..collectionList = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('collections_name');

  static Stream<CollectionsNameRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<CollectionsNameRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  CollectionsNameRecord._();
  factory CollectionsNameRecord(
          [void Function(CollectionsNameRecordBuilder) updates]) =
      _$CollectionsNameRecord;

  static CollectionsNameRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createCollectionsNameRecordData({
  String collectionList,
}) =>
    serializers.toFirestore(CollectionsNameRecord.serializer,
        CollectionsNameRecord((c) => c..collectionList = collectionList));
