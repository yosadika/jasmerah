import '../flutter_flow/flutter_flow_calendar.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuPLNDailyWidget extends StatefulWidget {
  const MenuPLNDailyWidget({Key key}) : super(key: key);

  @override
  _MenuPLNDailyWidgetState createState() => _MenuPLNDailyWidgetState();
}

class _MenuPLNDailyWidgetState extends State<MenuPLNDailyWidget> {
  DateTimeRange calendarSelectedDay;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFEFEFEF),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF467E8F), Color(0xFF5DBAD8), Color(0xFFEFEFEF)],
              stops: [0, 0.4, 0.8],
              begin: AlignmentDirectional(0, 1),
              end: AlignmentDirectional(0, -1),
            ),
          ),
          child: SingleChildScrollView(
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
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 25),
                  child: Container(
                    width: 320,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: FlutterFlowCalendar(
                      color: Color(0xB2467E8F),
                      weekFormat: false,
                      weekStartsMonday: false,
                      initialDate: getCurrentTimestamp,
                      onChange: (DateTimeRange newSelectedDate) {
                        setState(() => calendarSelectedDay = newSelectedDate);
                      },
                      titleStyle: GoogleFonts.getFont(
                        'Montserrat',
                        color: Colors.black,
                        fontSize: 16,
                      ),
                      dayOfWeekStyle: GoogleFonts.getFont(
                        'Montserrat',
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      dateStyle: GoogleFonts.getFont(
                        'Montserrat',
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      selectedDateStyle: GoogleFonts.getFont(
                        'Montserrat',
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                      inactiveDateStyle: TextStyle(),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                  child: Container(
                    width: 320,
                    height: 35,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(),
                            child: Icon(
                              Icons.person_outline_rounded,
                              color: Colors.black,
                              size: 24,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                            child: Text(
                              'Yos Adika',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Montserrat',
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                  child: Container(
                    width: 320,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                                child: Container(
                                  decoration: BoxDecoration(),
                                  child: Icon(
                                    Icons.location_on,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                                child: Text(
                                  'GI Paya Geli',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300,
                                      ),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            dateTimeFormat('d/M H:mm', getCurrentTimestamp),
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Montserrat',
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 100),
                  child: Container(
                    decoration: BoxDecoration(),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                          child: Container(
                            width: 150,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Color(0xB2467E8F),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 10, 0),
                                  child: Icon(
                                    Icons.login_sharp,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Text(
                                    'Clock In',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: Colors.white,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 150,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(0xFF8F4646),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                                child: Icon(
                                  Icons.logout,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: Text(
                                  'Clock Out',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: Colors.white,
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
                Container(
                  width: 320,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Color(0x7FEFEFEF),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Icon(
                            Icons.settings_outlined,
                            color: Color(0xB2467E8F),
                            size: 20,
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: Text(
                            'kamu berada pada radius kantor',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Montserrat',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
