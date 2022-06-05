import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import '../flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ComponentTambahAnomaliWidget extends StatefulWidget {
  const ComponentTambahAnomaliWidget({Key key}) : super(key: key);

  @override
  _ComponentTambahAnomaliWidgetState createState() =>
      _ComponentTambahAnomaliWidgetState();
}

class _ComponentTambahAnomaliWidgetState
    extends State<ComponentTambahAnomaliWidget> with TickerProviderStateMixin {
  String uploadedFileUrl = '';
  String pilihBayValue;
  String pilihGarduValue;
  String pilihULTGValue;
  TextEditingController namaAnomaliController;
  TextEditingController tagAnomaliController;
  String pilihPeralatanValue;
  TextEditingController deskripsiAnomaliController;
  final formKey = GlobalKey<FormState>();
  final animationsMap = {
    'listViewOnPageLoadAnimation': AnimationInfo(
      curve: Curves.easeIn,
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 100,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 20),
        scale: 1,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
  };

  @override
  void initState() {
    super.initState();
    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );

    deskripsiAnomaliController = TextEditingController();
    namaAnomaliController = TextEditingController();
    tagAnomaliController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0, 0),
      child: Container(
        width: 340,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFFEEEEEE),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(0),
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(5, 0, 15, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FFButtonWidget(
                      onPressed: () async {
                        if (formKey.currentState == null ||
                            !formKey.currentState.validate()) {
                          return;
                        }

                        if (pilihULTGValue == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'ULTG belum dipilih',
                                style: FlutterFlowTheme.of(context)
                                    .subtitle1
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color: Color(0xFFEFEFEF),
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor: Colors.black,
                            ),
                          );
                          return;
                        }
                        if (pilihGarduValue == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Gardu belum dipilih',
                                style: GoogleFonts.getFont(
                                  'Montserrat',
                                  color: Color(0xFFEFEFEF),
                                  fontSize: 12,
                                ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor: Colors.black,
                            ),
                          );
                          return;
                        }
                        if (pilihBayValue == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Bay belum dipilih',
                                style: GoogleFonts.getFont(
                                  'Montserrat',
                                  color: Color(0xFFEFEFEF),
                                  fontSize: 12,
                                ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor: Colors.black,
                            ),
                          );
                          return;
                        }
                        if (pilihPeralatanValue == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Peralatan belum dipilih',
                                style: GoogleFonts.getFont(
                                  'Montserrat',
                                  fontSize: 12,
                                ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor: Colors.black,
                            ),
                          );
                          return;
                        }

                        if (uploadedFileUrl == null ||
                            uploadedFileUrl.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Upload foto anomali',
                                style: GoogleFonts.getFont(
                                  'Montserrat',
                                  color: Color(0xFFEFEFEF),
                                  fontSize: 12,
                                ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor: Colors.black,
                            ),
                          );
                          return;
                        }

                        final anomaliCreateData = createAnomaliRecordData(
                          namaAnomali: namaAnomaliController.text,
                          tagAnomali: tagAnomaliController.text,
                          statusAnomali: 0,
                          tanggalCreateAnomali: getCurrentTimestamp,
                          vendorAnomali: 1,
                          uidAnomali: '${random_data.randomString(
                            1,
                            5,
                            true,
                            false,
                            false,
                          )}ANOM${valueOrDefault(currentUserDocument?.userWordLocationChar, '')}',
                          fotoAnomali: uploadedFileUrl,
                          deskripsiAnomali: deskripsiAnomaliController.text,
                          isJargiValidateAnomali: false,
                          isK3lValidateAnomali: false,
                          isRenevValidateAnomali: false,
                          idCountAnomali: 6,
                          isAnomaliScheduled: false,
                          ultgLocationAnomali: pilihULTGValue,
                          bayLocationAnomali: pilihBayValue,
                          userEmailPostAnomali: currentUserEmail,
                          userPostAnomali: currentUserDisplayName,
                          prosesHierarkiAnomali: 0,
                          garduLocationAnomali: pilihGarduValue,
                        );
                        await AnomaliRecord.collection
                            .doc()
                            .set(anomaliCreateData);
                        context.pushNamed(
                          'MenuAnomali',
                          extra: <String, dynamic>{
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                              duration: Duration(milliseconds: 500),
                            ),
                          },
                        );
                      },
                      text: 'Simpan',
                      options: FFButtonOptions(
                        width: 80,
                        height: 35,
                        color: Color(0xFF507C78),
                        textStyle:
                            FlutterFlowTheme.of(context).subtitle2.override(
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
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                    child: ListView(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      children: [
                        Form(
                          key: formKey,
                          autovalidateMode: AutovalidateMode.disabled,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 5),
                                      child: Material(
                                        color: Colors.transparent,
                                        elevation: 1,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Container(
                                          width: 320,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0, 0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(15, 0, 15, 0),
                                              child: TextFormField(
                                                controller:
                                                    namaAnomaliController,
                                                onChanged: (_) =>
                                                    EasyDebounce.debounce(
                                                  'namaAnomaliController',
                                                  Duration(milliseconds: 2000),
                                                  () => setState(() {}),
                                                ),
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        color: Colors.black,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                  hintText: 'Nama Anomali',
                                                  hintStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        color: Colors.black,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(4.0),
                                                      topRight:
                                                          Radius.circular(4.0),
                                                    ),
                                                  ),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(4.0),
                                                      topRight:
                                                          Radius.circular(4.0),
                                                    ),
                                                  ),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: Colors.black,
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                validator: (val) {
                                                  if (val == null ||
                                                      val.isEmpty) {
                                                    return 'Harud diisi';
                                                  }
                                                  if (val.length < 10) {
                                                    return 'Requires at least 10 characters.';
                                                  }

                                                  return null;
                                                },
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
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0, 0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(15, 0, 15, 0),
                                              child: TextFormField(
                                                controller:
                                                    tagAnomaliController,
                                                onChanged: (_) =>
                                                    EasyDebounce.debounce(
                                                  'tagAnomaliController',
                                                  Duration(milliseconds: 2000),
                                                  () => setState(() {}),
                                                ),
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelText: 'Tag Anomali',
                                                  labelStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        color: Colors.black,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                  hintText:
                                                      'misal PMT, MCB, penyulang PG',
                                                  hintStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        color: Colors.black,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(4.0),
                                                      topRight:
                                                          Radius.circular(4.0),
                                                    ),
                                                  ),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Color(0x00000000),
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(4.0),
                                                      topRight:
                                                          Radius.circular(4.0),
                                                    ),
                                                  ),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: Colors.black,
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                validator: (val) {
                                                  if (val == null ||
                                                      val.isEmpty) {
                                                    return 'Harus diisi';
                                                  }

                                                  return null;
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 5),
                                  child: Container(
                                    width: 320,
                                    height: 35,
                                    decoration: BoxDecoration(),
                                    child: StreamBuilder<List<DataUltgRecord>>(
                                      stream: queryDataUltgRecord(
                                        queryBuilder: (dataUltgRecord) =>
                                            dataUltgRecord.orderBy('nama_ultg'),
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
                                        List<DataUltgRecord>
                                            pilihULTGDataUltgRecordList =
                                            snapshot.data;
                                        return FlutterFlowDropDown(
                                          options: pilihULTGDataUltgRecordList
                                              .map((e) => e.namaUltg)
                                              .toList()
                                              .toList(),
                                          onChanged: (val) => setState(
                                              () => pilihULTGValue = val),
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
                                          hintText: 'Pilih ULTG',
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
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 5),
                                  child: Container(
                                    width: 320,
                                    height: 35,
                                    decoration: BoxDecoration(),
                                    child: StreamBuilder<
                                        List<DataGarduIndukRecord>>(
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
                                            pilihGarduDataGarduIndukRecordList =
                                            snapshot.data;
                                        return FlutterFlowDropDown(
                                          options:
                                              pilihGarduDataGarduIndukRecordList
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
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 5),
                                  child: Container(
                                    width: 320,
                                    height: 35,
                                    decoration: BoxDecoration(),
                                    child: StreamBuilder<List<DataBayRecord>>(
                                      stream: queryDataBayRecord(
                                        queryBuilder: (dataBayRecord) =>
                                            dataBayRecord
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
                                        List<DataBayRecord>
                                            pilihBayDataBayRecordList =
                                            snapshot.data;
                                        return FlutterFlowDropDown(
                                          options: pilihBayDataBayRecordList
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
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 5),
                                  child: Container(
                                    width: 320,
                                    height: 35,
                                    decoration: BoxDecoration(),
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
                                            pilihPeralatanDataPeralatanGarduRecordList =
                                            snapshot.data;
                                        return FlutterFlowDropDown(
                                          options:
                                              pilihPeralatanDataPeralatanGarduRecordList
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
                                        );
                                      },
                                    ),
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
                                          controller:
                                              deskripsiAnomaliController,
                                          onChanged: (_) =>
                                              EasyDebounce.debounce(
                                            'deskripsiAnomaliController',
                                            Duration(milliseconds: 2000),
                                            () => setState(() {}),
                                          ),
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText: 'Deskripsikan Anomali',
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
                                              Icons.chat_rounded,
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
                                          maxLines: 3,
                                          validator: (val) {
                                            if (val == null || val.isEmpty) {
                                              return 'Deskripsikan anomali';
                                            }
                                            if (val.length < 20) {
                                              return 'Requires at least 20 characters.';
                                            }

                                            return null;
                                          },
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0, 0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 10),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  final selectedMedia =
                                                      await selectMediaWithSourceBottomSheet(
                                                    context: context,
                                                    imageQuality: 100,
                                                    allowPhoto: true,
                                                  );
                                                  if (selectedMedia != null &&
                                                      selectedMedia.every((m) =>
                                                          validateFileFormat(
                                                              m.storagePath,
                                                              context))) {
                                                    showUploadMessage(
                                                      context,
                                                      'Uploading file...',
                                                      showLoading: true,
                                                    );
                                                    final downloadUrls = (await Future
                                                            .wait(selectedMedia
                                                                .map((m) async =>
                                                                    await uploadData(
                                                                        m.storagePath,
                                                                        m.bytes))))
                                                        .where((u) => u != null)
                                                        .toList();
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .hideCurrentSnackBar();
                                                    if (downloadUrls != null &&
                                                        downloadUrls.length ==
                                                            selectedMedia
                                                                .length) {
                                                      setState(() =>
                                                          uploadedFileUrl =
                                                              downloadUrls
                                                                  .first);
                                                      showUploadMessage(
                                                        context,
                                                        'Success!',
                                                      );
                                                    } else {
                                                      showUploadMessage(
                                                        context,
                                                        'Failed to upload media',
                                                      );
                                                      return;
                                                    }
                                                  }
                                                },
                                                text: 'Upload Foto Anomali',
                                                options: FFButtonOptions(
                                                  width: 155,
                                                  height: 35,
                                                  color: Color(0xFF507C78),
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
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
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10, 0, 10, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: 70,
                                                  height: 70,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Image.network(
                                                    uploadedFileUrl,
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
                            ],
                          ),
                        ),
                      ],
                    ).animated([animationsMap['listViewOnPageLoadAnimation']]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
