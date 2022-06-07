import 'package:built_value/serializer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../flutter_flow/flutter_flow_util.dart';

import 'schema/users_record.dart';
import 'schema/anomali_record.dart';
import 'schema/data_upt_record.dart';
import 'schema/data_gardu_induk_record.dart';
import 'schema/data_ultg_record.dart';
import 'schema/data_jabatan_record.dart';
import 'schema/collections_name_record.dart';
import 'schema/data_foto_anomali_record.dart';
import 'schema/data_bay_record.dart';
import 'schema/data_peralatan_gardu_record.dart';
import 'schema/data_sub_peralatan_gardu_record.dart';
import 'schema/anomali_scheduled_record.dart';
import 'schema/buku_wiring_record.dart';
import 'schema/kategori_peralatan_record.dart';
import 'schema/data_alat_uji_record.dart';
import 'schema/data_material_gudang_record.dart';
import 'schema/data_k2lh_record.dart';
import 'schema/data_buletin_record.dart';
import 'schema/data_event_record.dart';
import 'schema/data_kategori_event_record.dart';
import 'schema/serializers.dart';

export 'dart:async' show StreamSubscription;
export 'package:cloud_firestore/cloud_firestore.dart';
export 'schema/index.dart';
export 'schema/serializers.dart';

export 'schema/users_record.dart';
export 'schema/anomali_record.dart';
export 'schema/data_upt_record.dart';
export 'schema/data_gardu_induk_record.dart';
export 'schema/data_ultg_record.dart';
export 'schema/data_jabatan_record.dart';
export 'schema/collections_name_record.dart';
export 'schema/data_foto_anomali_record.dart';
export 'schema/data_bay_record.dart';
export 'schema/data_peralatan_gardu_record.dart';
export 'schema/data_sub_peralatan_gardu_record.dart';
export 'schema/anomali_scheduled_record.dart';
export 'schema/buku_wiring_record.dart';
export 'schema/kategori_peralatan_record.dart';
export 'schema/data_alat_uji_record.dart';
export 'schema/data_material_gudang_record.dart';
export 'schema/data_k2lh_record.dart';
export 'schema/data_buletin_record.dart';
export 'schema/data_event_record.dart';
export 'schema/data_kategori_event_record.dart';

/// Functions to query UsersRecords (as a Stream and as a Future).
Stream<List<UsersRecord>> queryUsersRecord({
  Query Function(Query) queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      UsersRecord.collection,
      UsersRecord.serializer,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<UsersRecord>> queryUsersRecordOnce({
  Query Function(Query) queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      UsersRecord.collection,
      UsersRecord.serializer,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<FFFirestorePage<UsersRecord>> queryUsersRecordPage({
  Query Function(Query) queryBuilder,
  DocumentSnapshot nextPageMarker,
  int pageSize,
  bool isStream,
}) =>
    queryCollectionPage(
      UsersRecord.collection,
      UsersRecord.serializer,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    );

/// Functions to query AnomaliRecords (as a Stream and as a Future).
Stream<List<AnomaliRecord>> queryAnomaliRecord({
  Query Function(Query) queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      AnomaliRecord.collection,
      AnomaliRecord.serializer,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<AnomaliRecord>> queryAnomaliRecordOnce({
  Query Function(Query) queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      AnomaliRecord.collection,
      AnomaliRecord.serializer,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<FFFirestorePage<AnomaliRecord>> queryAnomaliRecordPage({
  Query Function(Query) queryBuilder,
  DocumentSnapshot nextPageMarker,
  int pageSize,
  bool isStream,
}) =>
    queryCollectionPage(
      AnomaliRecord.collection,
      AnomaliRecord.serializer,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    );

/// Functions to query DataUptRecords (as a Stream and as a Future).
Stream<List<DataUptRecord>> queryDataUptRecord({
  Query Function(Query) queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      DataUptRecord.collection,
      DataUptRecord.serializer,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<DataUptRecord>> queryDataUptRecordOnce({
  Query Function(Query) queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      DataUptRecord.collection,
      DataUptRecord.serializer,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<FFFirestorePage<DataUptRecord>> queryDataUptRecordPage({
  Query Function(Query) queryBuilder,
  DocumentSnapshot nextPageMarker,
  int pageSize,
  bool isStream,
}) =>
    queryCollectionPage(
      DataUptRecord.collection,
      DataUptRecord.serializer,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    );

/// Functions to query DataGarduIndukRecords (as a Stream and as a Future).
Stream<List<DataGarduIndukRecord>> queryDataGarduIndukRecord({
  Query Function(Query) queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      DataGarduIndukRecord.collection,
      DataGarduIndukRecord.serializer,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<DataGarduIndukRecord>> queryDataGarduIndukRecordOnce({
  Query Function(Query) queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      DataGarduIndukRecord.collection,
      DataGarduIndukRecord.serializer,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<FFFirestorePage<DataGarduIndukRecord>> queryDataGarduIndukRecordPage({
  Query Function(Query) queryBuilder,
  DocumentSnapshot nextPageMarker,
  int pageSize,
  bool isStream,
}) =>
    queryCollectionPage(
      DataGarduIndukRecord.collection,
      DataGarduIndukRecord.serializer,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    );

/// Functions to query DataUltgRecords (as a Stream and as a Future).
Stream<List<DataUltgRecord>> queryDataUltgRecord({
  Query Function(Query) queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      DataUltgRecord.collection,
      DataUltgRecord.serializer,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<DataUltgRecord>> queryDataUltgRecordOnce({
  Query Function(Query) queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      DataUltgRecord.collection,
      DataUltgRecord.serializer,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<FFFirestorePage<DataUltgRecord>> queryDataUltgRecordPage({
  Query Function(Query) queryBuilder,
  DocumentSnapshot nextPageMarker,
  int pageSize,
  bool isStream,
}) =>
    queryCollectionPage(
      DataUltgRecord.collection,
      DataUltgRecord.serializer,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    );

/// Functions to query DataJabatanRecords (as a Stream and as a Future).
Stream<List<DataJabatanRecord>> queryDataJabatanRecord({
  Query Function(Query) queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      DataJabatanRecord.collection,
      DataJabatanRecord.serializer,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<DataJabatanRecord>> queryDataJabatanRecordOnce({
  Query Function(Query) queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      DataJabatanRecord.collection,
      DataJabatanRecord.serializer,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<FFFirestorePage<DataJabatanRecord>> queryDataJabatanRecordPage({
  Query Function(Query) queryBuilder,
  DocumentSnapshot nextPageMarker,
  int pageSize,
  bool isStream,
}) =>
    queryCollectionPage(
      DataJabatanRecord.collection,
      DataJabatanRecord.serializer,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    );

/// Functions to query CollectionsNameRecords (as a Stream and as a Future).
Stream<List<CollectionsNameRecord>> queryCollectionsNameRecord({
  Query Function(Query) queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      CollectionsNameRecord.collection,
      CollectionsNameRecord.serializer,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<CollectionsNameRecord>> queryCollectionsNameRecordOnce({
  Query Function(Query) queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      CollectionsNameRecord.collection,
      CollectionsNameRecord.serializer,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<FFFirestorePage<CollectionsNameRecord>> queryCollectionsNameRecordPage({
  Query Function(Query) queryBuilder,
  DocumentSnapshot nextPageMarker,
  int pageSize,
  bool isStream,
}) =>
    queryCollectionPage(
      CollectionsNameRecord.collection,
      CollectionsNameRecord.serializer,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    );

/// Functions to query DataFotoAnomaliRecords (as a Stream and as a Future).
Stream<List<DataFotoAnomaliRecord>> queryDataFotoAnomaliRecord({
  Query Function(Query) queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      DataFotoAnomaliRecord.collection,
      DataFotoAnomaliRecord.serializer,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<DataFotoAnomaliRecord>> queryDataFotoAnomaliRecordOnce({
  Query Function(Query) queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      DataFotoAnomaliRecord.collection,
      DataFotoAnomaliRecord.serializer,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<FFFirestorePage<DataFotoAnomaliRecord>> queryDataFotoAnomaliRecordPage({
  Query Function(Query) queryBuilder,
  DocumentSnapshot nextPageMarker,
  int pageSize,
  bool isStream,
}) =>
    queryCollectionPage(
      DataFotoAnomaliRecord.collection,
      DataFotoAnomaliRecord.serializer,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    );

/// Functions to query DataBayRecords (as a Stream and as a Future).
Stream<List<DataBayRecord>> queryDataBayRecord({
  Query Function(Query) queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      DataBayRecord.collection,
      DataBayRecord.serializer,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<DataBayRecord>> queryDataBayRecordOnce({
  Query Function(Query) queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      DataBayRecord.collection,
      DataBayRecord.serializer,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<FFFirestorePage<DataBayRecord>> queryDataBayRecordPage({
  Query Function(Query) queryBuilder,
  DocumentSnapshot nextPageMarker,
  int pageSize,
  bool isStream,
}) =>
    queryCollectionPage(
      DataBayRecord.collection,
      DataBayRecord.serializer,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    );

/// Functions to query DataPeralatanGarduRecords (as a Stream and as a Future).
Stream<List<DataPeralatanGarduRecord>> queryDataPeralatanGarduRecord({
  Query Function(Query) queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      DataPeralatanGarduRecord.collection,
      DataPeralatanGarduRecord.serializer,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<DataPeralatanGarduRecord>> queryDataPeralatanGarduRecordOnce({
  Query Function(Query) queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      DataPeralatanGarduRecord.collection,
      DataPeralatanGarduRecord.serializer,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<FFFirestorePage<DataPeralatanGarduRecord>>
    queryDataPeralatanGarduRecordPage({
  Query Function(Query) queryBuilder,
  DocumentSnapshot nextPageMarker,
  int pageSize,
  bool isStream,
}) =>
        queryCollectionPage(
          DataPeralatanGarduRecord.collection,
          DataPeralatanGarduRecord.serializer,
          queryBuilder: queryBuilder,
          nextPageMarker: nextPageMarker,
          pageSize: pageSize,
          isStream: isStream,
        );

/// Functions to query DataSubPeralatanGarduRecords (as a Stream and as a Future).
Stream<List<DataSubPeralatanGarduRecord>> queryDataSubPeralatanGarduRecord({
  Query Function(Query) queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      DataSubPeralatanGarduRecord.collection,
      DataSubPeralatanGarduRecord.serializer,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<DataSubPeralatanGarduRecord>> queryDataSubPeralatanGarduRecordOnce({
  Query Function(Query) queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      DataSubPeralatanGarduRecord.collection,
      DataSubPeralatanGarduRecord.serializer,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<FFFirestorePage<DataSubPeralatanGarduRecord>>
    queryDataSubPeralatanGarduRecordPage({
  Query Function(Query) queryBuilder,
  DocumentSnapshot nextPageMarker,
  int pageSize,
  bool isStream,
}) =>
        queryCollectionPage(
          DataSubPeralatanGarduRecord.collection,
          DataSubPeralatanGarduRecord.serializer,
          queryBuilder: queryBuilder,
          nextPageMarker: nextPageMarker,
          pageSize: pageSize,
          isStream: isStream,
        );

/// Functions to query AnomaliScheduledRecords (as a Stream and as a Future).
Stream<List<AnomaliScheduledRecord>> queryAnomaliScheduledRecord({
  Query Function(Query) queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      AnomaliScheduledRecord.collection,
      AnomaliScheduledRecord.serializer,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<AnomaliScheduledRecord>> queryAnomaliScheduledRecordOnce({
  Query Function(Query) queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      AnomaliScheduledRecord.collection,
      AnomaliScheduledRecord.serializer,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<FFFirestorePage<AnomaliScheduledRecord>>
    queryAnomaliScheduledRecordPage({
  Query Function(Query) queryBuilder,
  DocumentSnapshot nextPageMarker,
  int pageSize,
  bool isStream,
}) =>
        queryCollectionPage(
          AnomaliScheduledRecord.collection,
          AnomaliScheduledRecord.serializer,
          queryBuilder: queryBuilder,
          nextPageMarker: nextPageMarker,
          pageSize: pageSize,
          isStream: isStream,
        );

/// Functions to query BukuWiringRecords (as a Stream and as a Future).
Stream<List<BukuWiringRecord>> queryBukuWiringRecord({
  Query Function(Query) queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      BukuWiringRecord.collection,
      BukuWiringRecord.serializer,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<BukuWiringRecord>> queryBukuWiringRecordOnce({
  Query Function(Query) queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      BukuWiringRecord.collection,
      BukuWiringRecord.serializer,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<FFFirestorePage<BukuWiringRecord>> queryBukuWiringRecordPage({
  Query Function(Query) queryBuilder,
  DocumentSnapshot nextPageMarker,
  int pageSize,
  bool isStream,
}) =>
    queryCollectionPage(
      BukuWiringRecord.collection,
      BukuWiringRecord.serializer,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    );

/// Functions to query KategoriPeralatanRecords (as a Stream and as a Future).
Stream<List<KategoriPeralatanRecord>> queryKategoriPeralatanRecord({
  Query Function(Query) queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      KategoriPeralatanRecord.collection,
      KategoriPeralatanRecord.serializer,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<KategoriPeralatanRecord>> queryKategoriPeralatanRecordOnce({
  Query Function(Query) queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      KategoriPeralatanRecord.collection,
      KategoriPeralatanRecord.serializer,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<FFFirestorePage<KategoriPeralatanRecord>>
    queryKategoriPeralatanRecordPage({
  Query Function(Query) queryBuilder,
  DocumentSnapshot nextPageMarker,
  int pageSize,
  bool isStream,
}) =>
        queryCollectionPage(
          KategoriPeralatanRecord.collection,
          KategoriPeralatanRecord.serializer,
          queryBuilder: queryBuilder,
          nextPageMarker: nextPageMarker,
          pageSize: pageSize,
          isStream: isStream,
        );

/// Functions to query DataAlatUjiRecords (as a Stream and as a Future).
Stream<List<DataAlatUjiRecord>> queryDataAlatUjiRecord({
  Query Function(Query) queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      DataAlatUjiRecord.collection,
      DataAlatUjiRecord.serializer,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<DataAlatUjiRecord>> queryDataAlatUjiRecordOnce({
  Query Function(Query) queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      DataAlatUjiRecord.collection,
      DataAlatUjiRecord.serializer,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<FFFirestorePage<DataAlatUjiRecord>> queryDataAlatUjiRecordPage({
  Query Function(Query) queryBuilder,
  DocumentSnapshot nextPageMarker,
  int pageSize,
  bool isStream,
}) =>
    queryCollectionPage(
      DataAlatUjiRecord.collection,
      DataAlatUjiRecord.serializer,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    );

/// Functions to query DataMaterialGudangRecords (as a Stream and as a Future).
Stream<List<DataMaterialGudangRecord>> queryDataMaterialGudangRecord({
  Query Function(Query) queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      DataMaterialGudangRecord.collection,
      DataMaterialGudangRecord.serializer,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<DataMaterialGudangRecord>> queryDataMaterialGudangRecordOnce({
  Query Function(Query) queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      DataMaterialGudangRecord.collection,
      DataMaterialGudangRecord.serializer,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<FFFirestorePage<DataMaterialGudangRecord>>
    queryDataMaterialGudangRecordPage({
  Query Function(Query) queryBuilder,
  DocumentSnapshot nextPageMarker,
  int pageSize,
  bool isStream,
}) =>
        queryCollectionPage(
          DataMaterialGudangRecord.collection,
          DataMaterialGudangRecord.serializer,
          queryBuilder: queryBuilder,
          nextPageMarker: nextPageMarker,
          pageSize: pageSize,
          isStream: isStream,
        );

/// Functions to query DataK2lhRecords (as a Stream and as a Future).
Stream<List<DataK2lhRecord>> queryDataK2lhRecord({
  Query Function(Query) queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      DataK2lhRecord.collection,
      DataK2lhRecord.serializer,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<DataK2lhRecord>> queryDataK2lhRecordOnce({
  Query Function(Query) queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      DataK2lhRecord.collection,
      DataK2lhRecord.serializer,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<FFFirestorePage<DataK2lhRecord>> queryDataK2lhRecordPage({
  Query Function(Query) queryBuilder,
  DocumentSnapshot nextPageMarker,
  int pageSize,
  bool isStream,
}) =>
    queryCollectionPage(
      DataK2lhRecord.collection,
      DataK2lhRecord.serializer,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    );

/// Functions to query DataBuletinRecords (as a Stream and as a Future).
Stream<List<DataBuletinRecord>> queryDataBuletinRecord({
  Query Function(Query) queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      DataBuletinRecord.collection,
      DataBuletinRecord.serializer,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<DataBuletinRecord>> queryDataBuletinRecordOnce({
  Query Function(Query) queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      DataBuletinRecord.collection,
      DataBuletinRecord.serializer,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<FFFirestorePage<DataBuletinRecord>> queryDataBuletinRecordPage({
  Query Function(Query) queryBuilder,
  DocumentSnapshot nextPageMarker,
  int pageSize,
  bool isStream,
}) =>
    queryCollectionPage(
      DataBuletinRecord.collection,
      DataBuletinRecord.serializer,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    );

/// Functions to query DataEventRecords (as a Stream and as a Future).
Stream<List<DataEventRecord>> queryDataEventRecord({
  Query Function(Query) queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      DataEventRecord.collection,
      DataEventRecord.serializer,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<DataEventRecord>> queryDataEventRecordOnce({
  Query Function(Query) queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      DataEventRecord.collection,
      DataEventRecord.serializer,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<FFFirestorePage<DataEventRecord>> queryDataEventRecordPage({
  Query Function(Query) queryBuilder,
  DocumentSnapshot nextPageMarker,
  int pageSize,
  bool isStream,
}) =>
    queryCollectionPage(
      DataEventRecord.collection,
      DataEventRecord.serializer,
      queryBuilder: queryBuilder,
      nextPageMarker: nextPageMarker,
      pageSize: pageSize,
      isStream: isStream,
    );

/// Functions to query DataKategoriEventRecords (as a Stream and as a Future).
Stream<List<DataKategoriEventRecord>> queryDataKategoriEventRecord({
  Query Function(Query) queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollection(
      DataKategoriEventRecord.collection,
      DataKategoriEventRecord.serializer,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<List<DataKategoriEventRecord>> queryDataKategoriEventRecordOnce({
  Query Function(Query) queryBuilder,
  int limit = -1,
  bool singleRecord = false,
}) =>
    queryCollectionOnce(
      DataKategoriEventRecord.collection,
      DataKategoriEventRecord.serializer,
      queryBuilder: queryBuilder,
      limit: limit,
      singleRecord: singleRecord,
    );

Future<FFFirestorePage<DataKategoriEventRecord>>
    queryDataKategoriEventRecordPage({
  Query Function(Query) queryBuilder,
  DocumentSnapshot nextPageMarker,
  int pageSize,
  bool isStream,
}) =>
        queryCollectionPage(
          DataKategoriEventRecord.collection,
          DataKategoriEventRecord.serializer,
          queryBuilder: queryBuilder,
          nextPageMarker: nextPageMarker,
          pageSize: pageSize,
          isStream: isStream,
        );

Stream<List<T>> queryCollection<T>(Query collection, Serializer<T> serializer,
    {Query Function(Query) queryBuilder,
    int limit = -1,
    bool singleRecord = false}) {
  final builder = queryBuilder ?? (q) => q;
  var query = builder(collection);
  if (limit > 0 || singleRecord) {
    query = query.limit(singleRecord ? 1 : limit);
  }
  return query.snapshots().handleError((err) {
    print('Error querying $collection: $err');
  }).map((s) => s.docs
      .map(
        (d) => safeGet(
          () => serializers.deserializeWith(serializer, serializedData(d)),
          (e) => print('Error serializing doc ${d.reference.path}:\n$e'),
        ),
      )
      .where((d) => d != null)
      .toList());
}

Future<List<T>> queryCollectionOnce<T>(
    Query collection, Serializer<T> serializer,
    {Query Function(Query) queryBuilder,
    int limit = -1,
    bool singleRecord = false}) {
  final builder = queryBuilder ?? (q) => q;
  var query = builder(collection);
  if (limit > 0 || singleRecord) {
    query = query.limit(singleRecord ? 1 : limit);
  }
  return query.get().then((s) => s.docs
      .map(
        (d) => safeGet(
          () => serializers.deserializeWith(serializer, serializedData(d)),
          (e) => print('Error serializing doc ${d.reference.path}:\n$e'),
        ),
      )
      .where((d) => d != null)
      .toList());
}

class FFFirestorePage<T> {
  final List<T> data;
  final Stream<List<T>> dataStream;
  final QueryDocumentSnapshot nextPageMarker;

  FFFirestorePage(this.data, this.dataStream, this.nextPageMarker);
}

Future<FFFirestorePage<T>> queryCollectionPage<T>(
  Query collection,
  Serializer<T> serializer, {
  Query Function(Query) queryBuilder,
  DocumentSnapshot nextPageMarker,
  int pageSize,
  bool isStream,
}) async {
  final builder = queryBuilder ?? (q) => q;
  var query = builder(collection).limit(pageSize);
  if (nextPageMarker != null) {
    query = query.startAfterDocument(nextPageMarker);
  }
  Stream<QuerySnapshot> docSnapshotStream;
  QuerySnapshot docSnapshot;
  if (isStream) {
    docSnapshotStream = query.snapshots();
    docSnapshot = await docSnapshotStream.first;
  } else {
    docSnapshot = await query.get();
  }
  final getDocs = (QuerySnapshot s) => s.docs
      .map(
        (d) => safeGet(
          () => serializers.deserializeWith(serializer, serializedData(d)),
          (e) => print('Error serializing doc ${d.reference.path}:\n$e'),
        ),
      )
      .where((d) => d != null)
      .toList();
  final data = getDocs(docSnapshot);
  final dataStream = docSnapshotStream?.map(getDocs);
  final nextPageToken = docSnapshot.docs.isEmpty ? null : docSnapshot.docs.last;
  return FFFirestorePage(data, dataStream, nextPageToken);
}

// Creates a Firestore document representing the logged in user if it doesn't yet exist
Future maybeCreateUser(User user) async {
  final userRecord = UsersRecord.collection.doc(user.uid);
  final userExists = await userRecord.get().then((u) => u.exists);
  if (userExists) {
    return;
  }

  final userData = createUsersRecordData(
    email: user.email,
    displayName: user.displayName,
    photoUrl: user.photoURL,
    uid: user.uid,
    phoneNumber: user.phoneNumber,
    createdTime: getCurrentTimestamp,
  );

  await userRecord.set(userData);
}
