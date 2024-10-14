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
                    returnUrl: 'https://example.flutter_klarna_payment',
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

const token = 'eyJhbGciOiJSUzI1NiIsImtpZCI6IjgyMzA1ZWJjLWI4MTEtMzYzNy1hYTRjLTY2ZWNhMTg3NGYzZCJ9.eyJzZXNzaW9uX2lkIjoiYTBiNjc5YTUtYmZhYS02MTFiLTkxM2ItNzAzMWY3MjVlZTg4IiwiYmFzZV91cmwiOiJodHRwczovL2pzLnBsYXlncm91bmQua2xhcm5hLmNvbS9uYS9rcCIsImRlc2lnbiI6ImtsYXJuYSIsImxhbmd1YWdlIjoiZW4iLCJwdXJjaGFzZV9jb3VudHJ5IjoiVVMiLCJlbnZpcm9ubWVudCI6InBsYXlncm91bmQiLCJtZXJjaGFudF9uYW1lIjoiVGVzdCBtZXJjaGFudCBidXNpbmVzcyBuYW1lIiwic2Vzc2lvbl90eXBlIjoiUEFZTUVOVFMiLCJjbGllbnRfZXZlbnRfYmFzZV91cmwiOiJodHRwczovL25hLnBsYXlncm91bmQua2xhcm5hZXZ0LmNvbSIsInNjaGVtZSI6dHJ1ZSwiZXhwZXJpbWVudHMiOlt7Im5hbWUiOiJrcGMtcHNlbC00NDI5IiwidmFyaWF0ZSI6ImEifSx7Im5hbWUiOiJrcC1jbGllbnQtb25lLXB1cmNoYXNlLWZsb3ciLCJ2YXJpYXRlIjoidmFyaWF0ZS0xIn0seyJuYW1lIjoia3BjLTFrLXNlcnZpY2UiLCJ2YXJpYXRlIjoidmFyaWF0ZS0xIn0seyJuYW1lIjoia3AtY2xpZW50LXV0b3BpYS1zdGF0aWMtd2lkZ2V0IiwidmFyaWF0ZSI6ImluZGV4IiwicGFyYW1ldGVycyI6eyJkeW5hbWljIjoidHJ1ZSJ9fSx7Im5hbWUiOiJrcC1jbGllbnQtdXRvcGlhLWZsb3ciLCJ2YXJpYXRlIjoidmFyaWF0ZS0xIn0seyJuYW1lIjoiaW4tYXBwLXNkay1uZXctaW50ZXJuYWwtYnJvd3NlciIsInBhcmFtZXRlcnMiOnsidmFyaWF0ZV9pZCI6Im5ldy1pbnRlcm5hbC1icm93c2VyLWVuYWJsZSJ9fSx7Im5hbWUiOiJrcC1jbGllbnQtdXRvcGlhLXNkay1mbG93IiwidmFyaWF0ZSI6InZhcmlhdGUtMSJ9LHsibmFtZSI6ImtwLWNsaWVudC11dG9waWEtd2Vidmlldy1mbG93IiwidmFyaWF0ZSI6InZhcmlhdGUtMSJ9LHsibmFtZSI6ImluLWFwcC1zZGstY2FyZC1zY2FubmluZyIsInBhcmFtZXRlcnMiOnsidmFyaWF0ZV9pZCI6ImNhcmQtc2Nhbm5pbmctZW5hYmxlIn19XSwicmVnaW9uIjoidXMiLCJvcmRlcl9hbW91bnQiOjI1MzIsIm9mZmVyaW5nX29wdHMiOjIsIm9vIjoiN2ciLCJ2ZXJzaW9uIjoidjEuMTAuMC0xNTkwLWczZWJjMzkwNyJ9.H4E8QjozTYgKqZP0qlUWKgeI1ygto9HBIi5lLSmXBonNOBa7cvbGz9JNjK3tDQouQbYxJ4bFvbWCXLnsSK1MTcvuzRFhjqHA54U3hdh7EIG9rOGTE5aXq6uxLs3T1ZvypTAI-IEsBKBhN4ETcMX7kuYSEjomzLdAOJkckWkW0aBSS_jkavZ_iPFEQRKBh-XTmrsm66Tf1lXSNAEwj7M4C4X-JOriDLhKe2bh59Ai_Z-e_tLmx-kX3bdQVaoq31HQf7SW5dfB_vZWFO1hm8X5cvLupQ-EeRQEruF2poJByzQ38qUKbwctzM326Usz7c2aDVtVb5Pt_2tjUWNq2hDFIQ';
