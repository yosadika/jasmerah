import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewBayWidget extends StatefulWidget {
  const ViewBayWidget({
    Key key,
    this.parameterBay,
  }) : super(key: key);

  final DocumentReference parameterBay;

  @override
  _ViewBayWidgetState createState() => _ViewBayWidgetState();
}

class _ViewBayWidgetState extends State<ViewBayWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFFEFEFEF),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
        child: StreamBuilder<DataGarduIndukRecord>(
          stream: DataGarduIndukRecord.getDocument(widget.parameterBay),
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return Center(
                child: SizedBox(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(
                    color: Color(0xB3385754),
                  ),
                ),
              );
            }
            final columnDataGarduIndukRecord = snapshot.data;
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 35),
                    child: Container(
                      width: 320,
                      decoration: BoxDecoration(
                        color: Color(0xFFEEEEEE),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-1, 0),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 0, 0, 10),
                              child: Text(
                                'Bay Penghantar',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ),
                          ),
                          Container(
                            width: 320,
                            decoration: BoxDecoration(
                              color: Color(0xFFEEEEEE),
                            ),
                            child: StreamBuilder<List<DataBayRecord>>(
                              stream: queryDataBayRecord(
                                queryBuilder: (dataBayRecord) => dataBayRecord
                                    .where('bay_nama_gardu',
                                        isEqualTo: columnDataGarduIndukRecord
                                            .namaGarduInduk)
                                    .where('bay_kategori_bay',
                                        isEqualTo: 'bay Penghantar')
                                    .orderBy('bay_nama_bay'),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 30,
                                      height: 30,
                                      child: CircularProgressIndicator(
                                        color: Color(0xB3385754),
                                      ),
                                    ),
                                  );
                                }
                                List<DataBayRecord> wrapDataBayRecordList =
                                    snapshot.data;
                                return Wrap(
                                  spacing: 5,
                                  runSpacing: 5,
                                  alignment: WrapAlignment.start,
                                  crossAxisAlignment: WrapCrossAlignment.start,
                                  direction: Axis.horizontal,
                                  runAlignment: WrapAlignment.start,
                                  verticalDirection: VerticalDirection.down,
                                  clipBehavior: Clip.none,
                                  children: List.generate(
                                      wrapDataBayRecordList.length,
                                      (wrapIndex) {
                                    final wrapDataBayRecord =
                                        wrapDataBayRecordList[wrapIndex];
                                    return InkWell(
                                      onTap: () async {
                                        context.pushNamed(
                                          'dasborBay',
                                          queryParams: {
                                            'parameterBayDetail':
                                                serializeParam(
                                                    wrapDataBayRecord.reference,
                                                    ParamType
                                                        .DocumentReference),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Color(0xFF25464E),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15, 10, 15, 10),
                                          child: Text(
                                            wrapDataBayRecord.bayNamaBay,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 35),
                    child: Container(
                      width: 320,
                      decoration: BoxDecoration(
                        color: Color(0xFFEEEEEE),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-1, 0),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 0, 0, 10),
                              child: Text(
                                'Bay Trafo Daya',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ),
                          ),
                          Container(
                            width: 320,
                            decoration: BoxDecoration(
                              color: Color(0xFFEEEEEE),
                            ),
                            child: StreamBuilder<List<DataBayRecord>>(
                              stream: queryDataBayRecord(
                                queryBuilder: (dataBayRecord) => dataBayRecord
                                    .where('bay_nama_gardu',
                                        isEqualTo: columnDataGarduIndukRecord
                                            .namaGarduInduk)
                                    .where('bay_kategori_bay',
                                        isEqualTo: 'bay Trafo Daya')
                                    .orderBy('bay_nama_bay'),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 30,
                                      height: 30,
                                      child: CircularProgressIndicator(
                                        color: Color(0xB3385754),
                                      ),
                                    ),
                                  );
                                }
                                List<DataBayRecord> wrapDataBayRecordList =
                                    snapshot.data;
                                return Wrap(
                                  spacing: 5,
                                  runSpacing: 5,
                                  alignment: WrapAlignment.start,
                                  crossAxisAlignment: WrapCrossAlignment.start,
                                  direction: Axis.horizontal,
                                  runAlignment: WrapAlignment.start,
                                  verticalDirection: VerticalDirection.down,
                                  clipBehavior: Clip.none,
                                  children: List.generate(
                                      wrapDataBayRecordList.length,
                                      (wrapIndex) {
                                    final wrapDataBayRecord =
                                        wrapDataBayRecordList[wrapIndex];
                                    return InkWell(
                                      onTap: () async {
                                        context.pushNamed(
                                          'dasborBay',
                                          queryParams: {
                                            'parameterBayDetail':
                                                serializeParam(
                                                    wrapDataBayRecord.reference,
                                                    ParamType
                                                        .DocumentReference),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Color(0xFF25464E),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15, 10, 15, 10),
                                          child: Text(
                                            wrapDataBayRecord.bayNamaBay,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 35),
                    child: Container(
                      width: 320,
                      decoration: BoxDecoration(
                        color: Color(0xFFEEEEEE),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-1, 0),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 0, 0, 10),
                              child: Text(
                                'Bay Penghantar',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ),
                          ),
                          Container(
                            width: 320,
                            decoration: BoxDecoration(
                              color: Color(0xFFEEEEEE),
                            ),
                            child: StreamBuilder<List<DataBayRecord>>(
                              stream: queryDataBayRecord(
                                queryBuilder: (dataBayRecord) => dataBayRecord
                                    .where('bay_nama_gardu',
                                        isEqualTo: columnDataGarduIndukRecord
                                            .namaGarduInduk)
                                    .where('bay_kategori_bay',
                                        isEqualTo: 'bay Lainnya')
                                    .orderBy('bay_nama_bay'),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 30,
                                      height: 30,
                                      child: CircularProgressIndicator(
                                        color: Color(0xB3385754),
                                      ),
                                    ),
                                  );
                                }
                                List<DataBayRecord> wrapDataBayRecordList =
                                    snapshot.data;
                                return Wrap(
                                  spacing: 5,
                                  runSpacing: 5,
                                  alignment: WrapAlignment.start,
                                  crossAxisAlignment: WrapCrossAlignment.start,
                                  direction: Axis.horizontal,
                                  runAlignment: WrapAlignment.start,
                                  verticalDirection: VerticalDirection.down,
                                  clipBehavior: Clip.none,
                                  children: List.generate(
                                      wrapDataBayRecordList.length,
                                      (wrapIndex) {
                                    final wrapDataBayRecord =
                                        wrapDataBayRecordList[wrapIndex];
                                    return InkWell(
                                      onTap: () async {
                                        context.pushNamed(
                                          'dasborBay',
                                          queryParams: {
                                            'parameterBayDetail':
                                                serializeParam(
                                                    wrapDataBayRecord.reference,
                                                    ParamType
                                                        .DocumentReference),
                                          }.withoutNulls,
                                        );
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Color(0xFF25464E),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15, 10, 15, 10),
                                          child: Text(
                                            wrapDataBayRecord.bayNamaBay,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
