import 'package:flutter/material.dart';

import 'package:flutter_klarna_payment/flutter_klarna_payment.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final controller = KlarnaPaymentController();
  String text = '';

  @override
  void initState() {
    super.initState();
    controller.stateStream.listen((event) {
      debugPrint("EVENT STATE => ${event.toString()}");
      setState(() {
        text = event.state.name;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Plugin example app'),
          ),
          body: Column(
            children: [
              Expanded(
                child: KlarnaPaymentView(
                  controller: controller,
                  request: KlarnaPaymentRequest(
                    clientToken: token,
                    returnUrl: 'https://com.flutter_klarna_payment.flutter_klarna_payment_example',
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  controller.pay();
                },
                child: Text('Pay $text'),
              ),
              const SizedBox(height: 40),
            ],
          )),
    );
  }
}

const token =
    'eyJhbGciOiJSUzI1NiIsImtpZCI6IjgyMzA1ZWJjLWI4MTEtMzYzNy1hYTRjLTY2ZWNhMTg3NGYzZCJ9.eyJzZXNzaW9uX2lkIjoiYWViY2NjYmItODVlYi02MTY0LWIzYzktYTIzMWZlMzRhMTk4IiwiYmFzZV91cmwiOiJodHRwczovL2pzLnBsYXlncm91bmQua2xhcm5hLmNvbS9uYS9rcCIsImRlc2lnbiI6ImtsYXJuYSIsImxhbmd1YWdlIjoiZW4iLCJwdXJjaGFzZV9jb3VudHJ5IjoiVVMiLCJlbnZpcm9ubWVudCI6InBsYXlncm91bmQiLCJtZXJjaGFudF9uYW1lIjoiVGVzdCBtZXJjaGFudCBidXNpbmVzcyBuYW1lIiwic2Vzc2lvbl90eXBlIjoiUEFZTUVOVFMiLCJjbGllbnRfZXZlbnRfYmFzZV91cmwiOiJodHRwczovL25hLnBsYXlncm91bmQua2xhcm5hZXZ0LmNvbSIsInNjaGVtZSI6dHJ1ZSwiZXhwZXJpbWVudHMiOlt7Im5hbWUiOiJrcGMtcHNlbC00NDI5IiwidmFyaWF0ZSI6ImEifSx7Im5hbWUiOiJrcC1jbGllbnQtb25lLXB1cmNoYXNlLWZsb3ciLCJ2YXJpYXRlIjoidmFyaWF0ZS0xIn0seyJuYW1lIjoia3BjLTFrLXNlcnZpY2UiLCJ2YXJpYXRlIjoidmFyaWF0ZS0xIn0seyJuYW1lIjoia3AtY2xpZW50LXV0b3BpYS1zdGF0aWMtd2lkZ2V0IiwidmFyaWF0ZSI6ImluZGV4IiwicGFyYW1ldGVycyI6eyJkeW5hbWljIjoidHJ1ZSJ9fSx7Im5hbWUiOiJrcC1jbGllbnQtdXRvcGlhLWZsb3ciLCJ2YXJpYXRlIjoidmFyaWF0ZS0xIn0seyJuYW1lIjoiaW4tYXBwLXNkay1uZXctaW50ZXJuYWwtYnJvd3NlciIsInBhcmFtZXRlcnMiOnsidmFyaWF0ZV9pZCI6Im5ldy1pbnRlcm5hbC1icm93c2VyLWVuYWJsZSJ9fSx7Im5hbWUiOiJrcC1jbGllbnQtdXRvcGlhLXNkay1mbG93IiwidmFyaWF0ZSI6InZhcmlhdGUtMSJ9LHsibmFtZSI6ImtwLWNsaWVudC11dG9waWEtd2Vidmlldy1mbG93IiwidmFyaWF0ZSI6InZhcmlhdGUtMSJ9LHsibmFtZSI6ImluLWFwcC1zZGstY2FyZC1zY2FubmluZyIsInBhcmFtZXRlcnMiOnsidmFyaWF0ZV9pZCI6ImNhcmQtc2Nhbm5pbmctZW5hYmxlIn19XSwicmVnaW9uIjoidXMiLCJvcmRlcl9hbW91bnQiOjE2NTksIm9mZmVyaW5nX29wdHMiOjIsIm9vIjoiN2ciLCJ2ZXJzaW9uIjoidjEuMTAuMC0xNTkwLWczZWJjMzkwNyJ9.R7-Z2h6iZ5zPcvpkI-eEhrH0i4Ada5FhfX3hHtwsJ3X13VXQNbLsTzfmZ4sOiL3yQlsWIqFLrEviO5eTtUKJ0aErggpv8oMt8ur84EpZQcs-hBSaL8nFf9nfHsoseMF7qLUiy6c8fe7sCcWz_Ucfz4uEWzF8BXpuYbNXTQHp_WDDbyiu8Y2uOdXHGle9IHhlS1LHaBYOEFhzM-JizqNV1Em8N-PEIML7vW-7UvmhytXmKhwB_Nu-rfFK0WRVV9qKoeBPWyNCE-aB1ZtmCI6oDTBSePhT8REC9EjJ9iT7_hBGRtf6PmYUmJHu16qo5yJCen-QOsS6chxXOO37UGOClw';
