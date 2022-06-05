import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_pdf_viewer.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PdfViewWidget extends StatefulWidget {
  const PdfViewWidget({
    Key key,
    this.parameterWiring,
  }) : super(key: key);

  final DocumentReference parameterWiring;

  @override
  _PdfViewWidgetState createState() => _PdfViewWidgetState();
}

class _PdfViewWidgetState extends State<PdfViewWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<BukuWiringRecord>(
      stream: BukuWiringRecord.getDocument(widget.parameterWiring),
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
        final containerBukuWiringRecord = snapshot.data;
        return Container(
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
            padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  containerBukuWiringRecord.namaBukuBukuWiring,
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Montserrat',
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                ),
                Expanded(
                  child: Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
                      child: FlutterFlowPdfViewer(
                        networkPath:
                            containerBukuWiringRecord.fileBukuBukuWiring,
                        horizontalScroll: false,
                      ),
                    ),
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
