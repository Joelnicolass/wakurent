import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QR_Code extends StatelessWidget {
  const QR_Code({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: NeumorphicAppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_outlined),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          iconTheme: const IconThemeData(
            color: Colors.grey,
          ),
        ),
        backgroundColor: NeumorphicTheme.baseColor(context),
        body: Center(
          child: Container(
            child: QrImage(
              data:
                  "https://www.mercadopago.com.ar/checkout/v1/payment/redirect/f5f2a643-976e-4e24-9334-18c93a1f049f/payment-option-form/?router-request-id=00d5c4b4-21b5-4726-bc0e-26dd91542b8c&preference-id=153980567-6b750a4d-8dd5-4573-996f-c0badd4c961c&p=5ce5cd3e52ae5b91d52d8ef309a6bbbc#/",
              version: QrVersions.auto,
              size: 350,
              foregroundColor: Colors.grey,
            ),
          ),
        ));
  }
}
