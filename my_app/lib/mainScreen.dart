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
 @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Qr code not")),
        body: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: _controller,
                  decoration: const InputDecoration(
                      hintText: "Digite algo",
                      labelText: "Qr code decorator",
                      //errorText: "Sua capivara....",
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.ballot)),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  tela2(str: _controller.text)));
                    },
                    child: const Text("Gerar")),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => tela3()));
                    },
                    child: const Text("Ler QR"))
              ],
            )));
  }
}