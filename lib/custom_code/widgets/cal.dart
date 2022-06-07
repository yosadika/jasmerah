// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
import 'package:booking_calendar/booking_calendar.dart';

class Cal extends StatefulWidget {
  const Cal({
    Key key,
    this.width,
    this.height,
    this.bookingButtonColor,
    this.bookingButtonText,
    this.bookingExplanation,
    this.bookingGridChildAspectRatio,
    this.bookingGridCrossAxisCount,
    this.formatDateTime,
    this.convertStreamResultToDateTimeRanges,
    this.availableSlotColor,
    this.availableSlotText,
    this.bookedSlotColor,
    this.bookedSlotText,
    this.selectedSlotColor,
    this.selectedSlotText,
    this.gridScrollPhysics,
    this.loadingWidget,
    this.errorWidget,
  }) : super(key: key);
  final double width;
  final double height;
  final Color bookingButtonColor;
  final String bookingButtonText;
  final String bookingExplanation;
  final int bookingGridChildAspectRatio;
  final int bookingGridCrossAxisCount;
  final DateTime formatDateTime;
  final bool convertStreamResultToDateTimeRanges;
  final Color availableSlotColor;
  final String availableSlotText;
  final Color bookedSlotColor;
  final String bookedSlotText;
  final Color selectedSlotColor;
  final String selectedSlotText;
  final int gridScrollPhysics;
  final String loadingWidget;
  final String errorWidget;
  @override
  State<Cal> createState() => _CalState();
}

class _CalState extends State<Cal> {
  final now = DateTime.now();
  BookingService mockBookingService;

  @override
  void initState() {
    super.initState();
    // DateTime.now().startOfDay
    // DateTime.now().endOfDay
    mockBookingService = BookingService(
        serviceName: 'Mock Service',
        serviceDuration: 30,
        bookingEnd: DateTime(now.year, now.month, now.day, 18, 0),
        bookingStart: DateTime(now.year, now.month, now.day, 8, 0));
  }

  Stream<dynamic> getBookingStreamMock({DateTime end, DateTime start}) {
    return Stream.value([]);
  }

  Future<dynamic> uploadBookingMock({BookingService newBooking}) async {
    await Future.delayed(const Duration(seconds: 1));
    converted.add(DateTimeRange(
        start: newBooking.bookingStart, end: newBooking.bookingEnd));
    print('${newBooking.toJson()} has been uploaded');
  }

  List<DateTimeRange> converted = [];

  List<DateTimeRange> convertStreamResultMock({dynamic streamResult}) {
    ///here you can parse the streamresult and convert to [List<DateTimeRange>]
    DateTime first = now;
    DateTime second = now.add(Duration(minutes: 55));
    DateTime third = now.subtract(Duration(minutes: 240));
    DateTime fourth = now.subtract(Duration(minutes: 500));
    converted
        .add(DateTimeRange(start: first, end: now.add(Duration(minutes: 30))));
    converted.add(
        DateTimeRange(start: second, end: second.add(Duration(minutes: 23))));
    converted.add(
        DateTimeRange(start: third, end: third.add(Duration(minutes: 15))));
    converted.add(
        DateTimeRange(start: fourth, end: fourth.add(Duration(minutes: 50))));
    return converted;
  }

  @override
  Widget build(BuildContext context) {
    return BookingCalendar(
      bookingService: mockBookingService,
      convertStreamResultToDateTimeRanges: convertStreamResultMock,
      getBookingStream: getBookingStreamMock,
      uploadBooking: uploadBookingMock,
    );
  }
}
