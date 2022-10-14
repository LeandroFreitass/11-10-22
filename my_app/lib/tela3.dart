import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class tela3 extends StatefulWidget {
  const tela3({ Key? key }) : super(key: key);

  @override
  _tela3State createState() => _tela3State();
}

class _tela3State extends State<tela3> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrkey = GlobalKey(debugLabel: 'QR');

  void _onQrViewCreated(QRViewController controller){
    setState(() {
      this.controller = controller;
      controller.scannedDataStream.listen((scanData) {
        setState(() => result = scanData);
      });
    });
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid){
      controller!.pauseCamera();
    }else if (Platform.isIOS){
      controller!.resumeCamera();
    }
  }
  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void readQr() async {
    if (result != null){
      controller!.pauseCamera();
      print(result!.code);
      controller!.dispose();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ler QR")),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Expanded(
              flex: 5, // 5 vão pro expanded, 1 pro próximo
              child: QRView(
                key: qrkey,
                onQRViewCreated: _onQrViewCreated,
                overlay: QrScannerOverlayShape(
                    borderColor: Colors.red,
                    borderRadius: 10,
                    borderLength: 20,
                    borderWidth: 10,
                    cutOutSize:
                        250), // abre a camera e coloca uma imagem por cima
              ),
            ),
            Expanded(
                flex: 1,
                child: Center(
                  child: (result != null)
                      ? Text(
                          'Barcode type: ${result!.format} Data: ${result!.code}')
                      : Text('Scan a code'),
                ))
          ],
        ),
      ),
    );
  }
}