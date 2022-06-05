import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../custom_code/widgets/index.dart' as custom_widgets;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QrcodeViewWidget extends StatefulWidget {
  const QrcodeViewWidget({
    Key key,
    this.parameterQrCode,
  }) : super(key: key);

  final DocumentReference parameterQrCode;

  @override
  _QrcodeViewWidgetState createState() => _QrcodeViewWidgetState();
}

class _QrcodeViewWidgetState extends State<QrcodeViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0, -1),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
        child: StreamBuilder<AnomaliRecord>(
          stream: AnomaliRecord.getDocument(widget.parameterQrCode),
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
            final containerAnomaliRecord = snapshot.data;
            return Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                color: Color(0xFFEEEEEE),
              ),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: custom_widgets.Qr(
                  width: double.infinity,
                  height: double.infinity,
                  data: containerAnomaliRecord.qrCodeAnomali,
                  size: 12.0,
                  backgroundColor: Color(0xFFEFEFEF),
                  foregroundColor: Colors.black,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
