import 'package:flutter/material.dart';
import 'tela2.dart';
import 'tela3.dart';



class mainScreen extends StatefulWidget {
  const mainScreen({ Key? key }) : super(key: key);

  @override
  _mainScreenState createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen> {
  final _controller = TextEditingController();
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Qr code not")),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(children: [
          SizedBox(height: 15,),
          TextFormField(
            controller: _controller,
            decoration : const InputDecoration(
              hintText: "Digite algo",
              labelText: "QrCode generator",
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.ballot),
            )
          ),
          SizedBox(height: 10,),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  tela2(str: _controller.text)));
                    },
                    child: const Text("Gerar"))
              ],
            )));
  }
}