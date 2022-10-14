import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class tela2 extends StatefulWidget {
  String str = "oi";
   tela2({ Key? key, this.str: "oi2" }) : super(key: key);

  @override
  _tela2State createState() => _tela2State();
}

class _tela2State extends State<tela2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("QR Gerando")),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(children: [
          SizedBox(
            height: 15,
          ),
          Center(
            child: QrImage(
              data: widget.str,
              version: QrVersions.auto,
              size: 200.0,
              gapless: false,
            ),
          ),
             SizedBox(
            height: 15,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("voltar")),
          
        ],)
      )
    );
  }
}