import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_video_player.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuBuletinWidget extends StatefulWidget {
  const MenuBuletinWidget({
    Key key,
    this.parameterBuletin,
  }) : super(key: key);

  final DocumentReference parameterBuletin;

  @override
  _MenuBuletinWidgetState createState() => _MenuBuletinWidgetState();
}

class _MenuBuletinWidgetState extends State<MenuBuletinWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFEFEFEF),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: StreamBuilder<DataBuletinRecord>(
          stream: DataBuletinRecord.getDocument(widget.parameterBuletin),
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
            final columnDataBuletinRecord = snapshot.data;
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0, -1),
                    child: Material(
                      color: Colors.transparent,
                      elevation: 0,
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30,
                                borderWidth: 1,
                                buttonSize: 60,
                                fillColor: Color(0x00385754),
                                icon: Icon(
                                  Icons.arrow_back_rounded,
                                  color: Colors.black,
                                  size: 30,
                                ),
                                onPressed: () async {
                                  context.pushNamed(
                                    'HomePage',
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: TransitionInfo(
                                        hasTransition: true,
                                        transitionType:
                                            PageTransitionType.leftToRight,
                                        duration: Duration(milliseconds: 500),
                                      ),
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        28, 0, 15, 0),
                                    child: Container(
                                      height: 120,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(0),
                                      ),
                                      child: Align(
                                        alignment: AlignmentDirectional(0, 0),
                                        child: FlutterFlowVideoPlayer(
                                          path: columnDataBuletinRecord
                                              .videoBuletin,
                                          videoType: VideoType.network,
                                          width: 300,
                                          autoPlay: false,
                                          looping: false,
                                          showControls: true,
                                          allowFullScreen: true,
                                          allowPlaybackSpeedMenu: false,
                                          lazyLoad: false,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 10, 0),
                                    child: Container(
                                      width: 280,
                                      height: 120,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(0),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(30),
                                        child: Image.network(
                                          columnDataBuletinRecord.fotoBuletin,
                                          fit: BoxFit.cover,
                                        ),
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
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                      child: Container(
                        width: 320,
                        decoration: BoxDecoration(
                          color: Color(0xFFEEEEEE),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Text(
                            columnDataBuletinRecord.judulBuletin,
                            textAlign: TextAlign.center,
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Montserrat',
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 20),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF797979),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 5, 10, 5),
                          child: Text(
                            columnDataBuletinRecord.userPostBuletin,
                            textAlign: TextAlign.center,
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Montserrat',
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                    child: Container(
                      width: 320,
                      decoration: BoxDecoration(
                        color: Color(0xFFEEEEEE),
                      ),
                      child: Text(
                        columnDataBuletinRecord.isiBuletin,
                        textAlign: TextAlign.justify,
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Montserrat',
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            ),
                      ),
                    ),
                  ),
                  Container(
                    width: 120,
                    decoration: BoxDecoration(
                      color: Color(0xFFEEEEEE),
                    ),
                    child: FFButtonWidget(
                      onPressed: () async {
                        final dataBuletinUpdateData = {
                          'likes_buletin': FieldValue.increment(1),
                        };
                        await columnDataBuletinRecord.reference
                            .update(dataBuletinUpdateData);
                      },
                      text: 'Sukai',
                      icon: Icon(
                        Icons.favorite_rounded,
                        size: 15,
                      ),
                      options: FFButtonOptions(
                        height: 40,
                        color: Color(0xFF385754),
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
                        borderRadius: 12,
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
