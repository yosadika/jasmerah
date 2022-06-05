import 'dart:async';

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

const _kDynamicLinksUrl = 'https://jasmerah.page.link';
const _kAppId = 'com.flutterflow.jasmerah';

Future<String> generateCurrentPageLink(BuildContext context) async {
  final dynamicLinkParams = DynamicLinkParameters(
    link: Uri.parse('$_kDynamicLinksUrl${GoRouter.of(context).location}'),
    uriPrefix: _kDynamicLinksUrl,
    androidParameters: const AndroidParameters(packageName: _kAppId),
    iosParameters: const IOSParameters(bundleId: _kAppId),
  );
  return FirebaseDynamicLinks.instance
      .buildLink(dynamicLinkParams)
      .then((link) => link.toString());
}

class DynamicLinksHandler extends StatefulWidget {
  const DynamicLinksHandler({Key key, this.child}) : super(key: key);

  final Widget child;

  @override
  _DynamicLinksHandlerState createState() => _DynamicLinksHandlerState();
}

class _DynamicLinksHandlerState extends State<DynamicLinksHandler> {
  StreamSubscription linkSubscription;

  static Set<String> kInitialLinks = {};

  Future handleOpenedPushNotification() async {
    final linkData = await FirebaseDynamicLinks.instance.getInitialLink();
    final link = linkData?.link?.toString();
    if (linkData != null && link != null && !kInitialLinks.contains(link)) {
      kInitialLinks.add(link);
      _handleDynamicLink(linkData);
    }
    linkSubscription ??=
        FirebaseDynamicLinks.instance.onLink.listen(_handleDynamicLink);
  }

  /// Extracts the path from the dynamic link, and routes to it.
  void _handleDynamicLink(PendingDynamicLinkData linkData) {
    final link = linkData.link.toString();
    final host = linkData.link.host;
    final location = link.split(host).last;
    context.push(location);
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  void dispose() {
    linkSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
