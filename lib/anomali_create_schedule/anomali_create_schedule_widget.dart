import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_pdf_viewer.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AnomaliCreateScheduleWidget extends StatefulWidget {
  const AnomaliCreateScheduleWidget({
    Key key,
    this.anomaliCreateSchedule,
    this.anomaliScheduled,
  }) : super(key: key);

  final DocumentReference anomaliCreateSchedule;
  final DocumentReference anomaliScheduled;

  @override
  _AnomaliCreateScheduleWidgetState createState() =>
      _AnomaliCreateScheduleWidgetState();
}

class _AnomaliCreateScheduleWidgetState
    extends State<AnomaliCreateScheduleWidget> {
  DateTime datePicked1;
  String pilihBayValue;
  String pilihGarduValue;
  TextEditingController judulPekerjaanController;
  TextEditingController woAnomaliController;
  String pilihPeralatanValue;
  DateTime datePicked2;
  TextEditingController jumlahPersonilController;
  String uploadedFileUrl = '';
  String choiceMaterialValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    judulPekerjaanController = TextEditingController();
    woAnomaliController = TextEditingController();
    jumlahPersonilController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AnomaliRecord>(
      stream: AnomaliRecord.getDocument(widget.anomaliCreateSchedule),
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
        final anomaliCreateScheduleAnomaliRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: Color(0xFFEFEFEF),
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(5, 0, 15, 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1, 0),
                              child: FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30,
                                borderWidth: 1,
                                buttonSize: 40,
                                icon: Icon(
                                  Icons.arrow_back_rounded,
                                  color: Colors.black,
                                  size: 30,
                                ),
                                onPressed: () async {
                                  context.pop();
                                },
                              ),
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                final anomaliScheduledCreateData =
                                    createAnomaliScheduledRecordData(
                                  namaAnomaliScheduled:
                                      judulPekerjaanController.text,
                                  namaUserScheduled: currentUserDisplayName,
                                  workingPermitScheduled: uploadedFileUrl,
                                  isButuhMaterial:
                                      (choiceMaterialValue) == 'ya',
                                  waktuPekerjaanStartScheduled: datePicked1,
                                  waktuPekerjaanEndScheduled: datePicked2,
                                );
                                await AnomaliScheduledRecord.collection
                                    .doc()
                                    .set(anomaliScheduledCreateData);
                              },
                              text: 'Simpan',
                              options: FFButtonOptions(
                                width: 80,
                                height: 35,
                                color: Color(0xFF507C78),
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                    ),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                          child: Material(
                            color: Colors.transparent,
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Container(
                              width: 320,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            23, 5, 0, 0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 5),
                                              child: Text(
                                                anomaliCreateScheduleAnomaliRecord
                                                    .namaAnomali,
                                                maxLines: 2,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: Colors.black,
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Icon(
                                                  Icons.tag,
                                                  color: Color(0xFF507C78),
                                                  size: 15,
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(5, 0, 0, 0),
                                                  child: Text(
                                                    anomaliCreateScheduleAnomaliRecord
                                                        .tagAnomali,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: Colors.black,
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.w100,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Expanded(
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0, 0.5),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Icon(
                                                          Icons.person,
                                                          color:
                                                              Color(0xFF507C78),
                                                          size: 15,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(5,
                                                                      0, 0, 0),
                                                          child: Text(
                                                            valueOrDefault<
                                                                String>(
                                                              anomaliCreateScheduleAnomaliRecord
                                                                  .userPostAnomali,
                                                              'User Unknown',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 10,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Icon(
                                                          Icons.access_time,
                                                          color:
                                                              Color(0xFF507C78),
                                                          size: 15,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(5,
                                                                      0, 0, 0),
                                                          child: Text(
                                                            dateTimeFormat(
                                                                'd/M h:mm a',
                                                                anomaliCreateScheduleAnomaliRecord
                                                                    .tanggalCreateAnomali),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 10,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 30,
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          if ((anomaliCreateScheduleAnomaliRecord
                                                  .statusAnomali) ==
                                              0)
                                            Align(
                                              alignment:
                                                  AlignmentDirectional(0, 0),
                                              child: Container(
                                                width: 15,
                                                height: 15,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFF95341A),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                ),
                                              ),
                                            ),
                                          if ((anomaliCreateScheduleAnomaliRecord
                                                  .statusAnomali) ==
                                              1)
                                            Align(
                                              alignment:
                                                  AlignmentDirectional(0, 0),
                                              child: Container(
                                                width: 15,
                                                height: 15,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFF2A8233),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                          child: ListView(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.vertical,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(-0.7, 0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 5),
                                        child: Text(
                                          'Working Order',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Montserrat',
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 15),
                                        child: Material(
                                          color: Colors.transparent,
                                          elevation: 1,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Container(
                                            width: 320,
                                            height: 35,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0, 0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  15, 0, 15, 0),
                                                      child: StreamBuilder<
                                                          List<DataUptRecord>>(
                                                        stream:
                                                            queryDataUptRecord(
                                                          singleRecord: true,
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 30,
                                                                height: 30,
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  color: Color(
                                                                      0xB3385754),
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          List<DataUptRecord>
                                                              woAnomaliDataUptRecordList =
                                                              snapshot.data;
                                                          // Return an empty Container when the document does not exist.
                                                          if (snapshot
                                                              .data.isEmpty) {
                                                            return Container();
                                                          }
                                                          final woAnomaliDataUptRecord =
                                                              woAnomaliDataUptRecordList
                                                                      .isNotEmpty
                                                                  ? woAnomaliDataUptRecordList
                                                                      .first
                                                                  : null;
                                                          return TextFormField(
                                                            controller:
                                                                woAnomaliController,
                                                            onChanged: (_) =>
                                                                EasyDebounce
                                                                    .debounce(
                                                              'woAnomaliController',
                                                              Duration(
                                                                  milliseconds:
                                                                      2000),
                                                              () => setState(
                                                                  () {}),
                                                            ),
                                                            readOnly: true,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              labelText:
                                                                  '${woAnomaliDataUptRecord.simbolUpt}/ANOM/ULTGBNJ/012',
                                                              labelStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            12,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                              enabledBorder:
                                                                  UnderlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 1,
                                                                ),
                                                                borderRadius:
                                                                    const BorderRadius
                                                                        .only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          4.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          4.0),
                                                                ),
                                                              ),
                                                              focusedBorder:
                                                                  UnderlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 1,
                                                                ),
                                                                borderRadius:
                                                                    const BorderRadius
                                                                        .only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          4.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          4.0),
                                                                ),
                                                              ),
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () async {
                                                    await Future.delayed(
                                                        const Duration(
                                                            milliseconds:
                                                                1000));
                                                  },
                                                  child: Material(
                                                    color: Colors.transparent,
                                                    elevation: 2,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(0),
                                                        bottomRight:
                                                            Radius.circular(20),
                                                        topLeft:
                                                            Radius.circular(0),
                                                        topRight:
                                                            Radius.circular(20),
                                                      ),
                                                    ),
                                                    child: Container(
                                                      width: 100,
                                                      height: 100,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFEEEEEE),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  20),
                                                          topLeft:
                                                              Radius.circular(
                                                                  0),
                                                          topRight:
                                                              Radius.circular(
                                                                  20),
                                                        ),
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0, 0),
                                                        child: Text(
                                                          'Generate',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 15),
                                  child: Material(
                                    color: Colors.transparent,
                                    elevation: 1,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Container(
                                      width: 320,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            15, 0, 15, 0),
                                        child: TextFormField(
                                          controller: judulPekerjaanController,
                                          onChanged: (_) =>
                                              EasyDebounce.debounce(
                                            'judulPekerjaanController',
                                            Duration(milliseconds: 2000),
                                            () => setState(() {}),
                                          ),
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                            hintText: 'Judul pekerjaan',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Montserrat',
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Montserrat',
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 5),
                                  child:
                                      StreamBuilder<List<DataGarduIndukRecord>>(
                                    stream: queryDataGarduIndukRecord(
                                      queryBuilder: (dataGarduIndukRecord) =>
                                          dataGarduIndukRecord
                                              .orderBy('nama_gardu_induk'),
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
                                      List<DataGarduIndukRecord>
                                          containerDataGarduIndukRecordList =
                                          snapshot.data;
                                      return Container(
                                        width: 320,
                                        height: 35,
                                        decoration: BoxDecoration(),
                                        child: FlutterFlowDropDown(
                                          options:
                                              containerDataGarduIndukRecordList
                                                  .map((e) => e.namaGarduInduk)
                                                  .toList()
                                                  .toList(),
                                          onChanged: (val) => setState(
                                              () => pilihGarduValue = val),
                                          width: double.infinity,
                                          height: double.infinity,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: Colors.black,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                          hintText: 'Pilih Gardu Induk',
                                          icon: FaIcon(
                                            FontAwesomeIcons.building,
                                            color: Colors.black,
                                            size: 15,
                                          ),
                                          fillColor: Colors.white,
                                          elevation: 2,
                                          borderColor: Colors.transparent,
                                          borderWidth: 0,
                                          borderRadius: 20,
                                          margin:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15, 4, 15, 4),
                                          hidesUnderline: true,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 5),
                                  child: StreamBuilder<List<DataBayRecord>>(
                                    stream: queryDataBayRecord(
                                      queryBuilder: (dataBayRecord) =>
                                          dataBayRecord.orderBy('bay_nama_bay'),
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
                                      List<DataBayRecord>
                                          containerDataBayRecordList =
                                          snapshot.data;
                                      return Container(
                                        width: 320,
                                        height: 35,
                                        decoration: BoxDecoration(),
                                        child: FlutterFlowDropDown(
                                          options: containerDataBayRecordList
                                              .map((e) => e.bayNamaBay)
                                              .toList()
                                              .toList(),
                                          onChanged: (val) => setState(
                                              () => pilihBayValue = val),
                                          width: double.infinity,
                                          height: double.infinity,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: Colors.black,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                          hintText: 'Pilih Nama Bay',
                                          icon: FaIcon(
                                            FontAwesomeIcons.codeBranch,
                                            color: Colors.black,
                                            size: 15,
                                          ),
                                          fillColor: Colors.white,
                                          elevation: 2,
                                          borderColor: Colors.transparent,
                                          borderWidth: 0,
                                          borderRadius: 20,
                                          margin:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15, 4, 15, 4),
                                          hidesUnderline: true,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 5),
                                  child: StreamBuilder<
                                      List<DataPeralatanGarduRecord>>(
                                    stream: queryDataPeralatanGarduRecord(
                                      queryBuilder: (dataPeralatanGarduRecord) =>
                                          dataPeralatanGarduRecord.orderBy(
                                              'namaPeralatan_peralatangardu'),
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
                                      List<DataPeralatanGarduRecord>
                                          containerDataPeralatanGarduRecordList =
                                          snapshot.data;
                                      return Container(
                                        width: 320,
                                        height: 35,
                                        decoration: BoxDecoration(),
                                        child: FlutterFlowDropDown(
                                          options:
                                              containerDataPeralatanGarduRecordList
                                                  .map((e) => e
                                                      .namaPeralatanPeralatangardu)
                                                  .toList()
                                                  .toList(),
                                          onChanged: (val) => setState(
                                              () => pilihPeralatanValue = val),
                                          width: double.infinity,
                                          height: double.infinity,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: Colors.black,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                          hintText: 'Pilih Nama Peralatan',
                                          icon: FaIcon(
                                            FontAwesomeIcons.cubes,
                                            color: Colors.black,
                                            size: 15,
                                          ),
                                          fillColor: Colors.white,
                                          elevation: 2,
                                          borderColor: Colors.transparent,
                                          borderWidth: 0,
                                          borderRadius: 20,
                                          margin:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  15, 4, 15, 4),
                                          hidesUnderline: true,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 15, 0, 0),
                                  child: Container(
                                    width: 320,
                                    height: 35,
                                    decoration: BoxDecoration(),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 15, 0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                await DatePicker
                                                    .showDateTimePicker(
                                                  context,
                                                  showTitleActions: true,
                                                  onConfirm: (date) {
                                                    setState(() =>
                                                        datePicked1 = date);
                                                  },
                                                  currentTime: datePicked1,
                                                  minTime: DateTime(0, 0, 0),
                                                );
                                              },
                                              text: 'Waktu  Mulai Pekerjaan',
                                              options: FFButtonOptions(
                                                width: 170,
                                                height: double.infinity,
                                                color: Color(0xFF507C78),
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: Colors.white,
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1,
                                                ),
                                                borderRadius: 20,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          valueOrDefault<String>(
                                            dateTimeFormat(
                                                'd/M H:mm', datePicked1),
                                            'Not Set',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Montserrat',
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 5, 0, 15),
                                  child: Container(
                                    width: 320,
                                    height: 35,
                                    decoration: BoxDecoration(),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 15, 0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                await DatePicker
                                                    .showDateTimePicker(
                                                  context,
                                                  showTitleActions: true,
                                                  onConfirm: (date) {
                                                    setState(() =>
                                                        datePicked2 = date);
                                                  },
                                                  currentTime: datePicked1,
                                                  minTime: DateTime(0, 0, 0),
                                                );
                                              },
                                              text: 'Waktu  Selesai Pekerjaan',
                                              options: FFButtonOptions(
                                                width: 170,
                                                height: double.infinity,
                                                color: Color(0xFF507C78),
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: Colors.white,
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1,
                                                ),
                                                borderRadius: 20,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Text(
                                          valueOrDefault<String>(
                                            dateTimeFormat(
                                                'd/M H:mm', datePicked2),
                                            'Not Set',
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Montserrat',
                                                color: Colors.black,
                                                fontSize: 12,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Container(
                                  width: 320,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15, 0, 0, 0),
                                      child: TextFormField(
                                        controller: jumlahPersonilController,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          'jumlahPersonilController',
                                          Duration(milliseconds: 2000),
                                          () => setState(() {}),
                                        ),
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: Colors.black,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                          hintText: 'Jumlah Personil',
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: Colors.black,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(4.0),
                                              topRight: Radius.circular(4.0),
                                            ),
                                          ),
                                          suffixIcon: Icon(
                                            Icons.emoji_people,
                                            color: Colors.black,
                                            size: 15,
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Montserrat',
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal,
                                            ),
                                        keyboardType: TextInputType.number,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 15, 0, 20),
                                  child: Container(
                                    width: 320,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFEEEEEE),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Align(
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 10, 0, 5),
                                            child: FlutterFlowPdfViewer(
                                              networkPath:
                                                  'https://firebasestorage.googleapis.com/v0/b/jasmerah-100a.appspot.com/o/JADWAL%20PEKERJAAN%20PADAM%20UPT%20MEDAN%20BULAN%20JUNI%202022%20highlighted.pdf?alt=media&token=28986d6d-f835-48aa-9c3e-1994b1f18973',
                                              height: 300,
                                              horizontalScroll: false,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 5, 0, 20),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                final selectedFile =
                                                    await selectFile(
                                                        allowedExtensions: [
                                                      'pdf'
                                                    ]);
                                                if (selectedFile != null) {
                                                  showUploadMessage(
                                                    context,
                                                    'Uploading file...',
                                                    showLoading: true,
                                                  );
                                                  final downloadUrl =
                                                      await uploadData(
                                                          selectedFile
                                                              .storagePath,
                                                          selectedFile.bytes);
                                                  ScaffoldMessenger.of(context)
                                                      .hideCurrentSnackBar();
                                                  if (downloadUrl != null) {
                                                    setState(() =>
                                                        uploadedFileUrl =
                                                            downloadUrl);
                                                    showUploadMessage(
                                                      context,
                                                      'Success!',
                                                    );
                                                  } else {
                                                    showUploadMessage(
                                                      context,
                                                      'Failed to upload file',
                                                    );
                                                    return;
                                                  }
                                                }

                                                final anomaliUpdateData =
                                                    createAnomaliRecordData();
                                                await anomaliCreateScheduleAnomaliRecord
                                                    .reference
                                                    .update(anomaliUpdateData);
                                              },
                                              text: 'Upload Working Permit',
                                              options: FFButtonOptions(
                                                width: 170,
                                                height: 35,
                                                color: Color(0xFF507C78),
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: Colors.white,
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1,
                                                ),
                                                borderRadius: 12,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color(0xFFEEEEEE),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 10),
                                      child: Text(
                                        'Apakah pekerjaan ini membutuhkan material?',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Montserrat',
                                              fontSize: 12,
                                              fontWeight: FontWeight.normal,
                                            ),
                                      ),
                                    ),
                                    FlutterFlowChoiceChips(
                                      initiallySelected: [choiceMaterialValue],
                                      options: [
                                        ChipData('Ya', Icons.done_rounded),
                                        ChipData('Tidak', Icons.block_rounded)
                                      ],
                                      onChanged: (val) => setState(() =>
                                          choiceMaterialValue = val.first),
                                      selectedChipStyle: ChipStyle(
                                        backgroundColor: Colors.black,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Montserrat',
                                              color: Colors.white,
                                            ),
                                        iconColor: Colors.white,
                                        iconSize: 18,
                                        elevation: 4,
                                      ),
                                      unselectedChipStyle: ChipStyle(
                                        backgroundColor: Colors.white,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyText2
                                            .override(
                                              fontFamily: 'Montserrat',
                                              color: Color(0xFF323B45),
                                            ),
                                        iconColor: Color(0xFF323B45),
                                        iconSize: 18,
                                        elevation: 4,
                                      ),
                                      chipSpacing: 20,
                                      multiselect: false,
                                      alignment: WrapAlignment.center,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
