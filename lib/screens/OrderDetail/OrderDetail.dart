import 'dart:io';

import 'package:flutter/material.dart';
import 'package:home_water_service_rider/model/OrderHistoryModel.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../ui_widgets/OrderDetailWidgets/od_body.dart';
import '../../ui_widgets/OrderDetailWidgets/od_header.dart';

class OrderDetail extends StatelessWidget {
  final OrderHistoryModel orderDetail;

  OrderDetail({super.key, required this.orderDetail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(children: [
          const OdHeader(),
          OdBody(context, orderDetail, _openMapDirection)
        ]),
      ),
    );
  }

  Future<void> _openMapDirection() async {
    String appleUrl =
        'https://maps.apple.com/?saddr=&daddr=${orderDetail.lat},${orderDetail.long}&directionsmode=driving';
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=${orderDetail.lat},${orderDetail.long}';

    Uri appleUri = Uri.parse(appleUrl);
    Uri googleUri = Uri.parse(googleUrl);

    if (Platform.isIOS) {
      if (await canLaunchUrl(appleUri)) {
        await launchUrl(appleUri, mode: LaunchMode.externalApplication);
      } else {
        if (await canLaunchUrl(googleUri)) {
          await launchUrl(googleUri, mode: LaunchMode.externalApplication);
        }
      }
    } else {
      if (Platform.isAndroid) {
        if (await canLaunchUrl(googleUri)) {
          await launchUrl(googleUri, mode: LaunchMode.externalApplication);
        }
      }
    }
  }
}
