import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: "Contador de Pessoas", home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _pessoas = 0;
  String _textoHome = "Pode entrar!";

  void _alterarPessoa(int delta) {
    setState(() {
      _pessoas += delta;

      if (_pessoas < 0) {
        _textoHome = "Mundo invertido?!";
      } else if (_pessoas <= 10) {
        _textoHome = "Pode entrar!";
      } else {
        _textoHome = "Lotado!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/restaurante.jpg",
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Pessoas: $_pessoas",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text("+1",
                        style: TextStyle(color: Colors.white, fontSize: 40.0)),
                    onPressed: () {
                      _alterarPessoa(1);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                    child: Text("-1",
                        style: TextStyle(color: Colors.white, fontSize: 40.0)),
                    onPressed: () {
                      _alterarPessoa(-1);
                    },
                  ),
                ),
              ],
            ),
            Text(_textoHome,
                style: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontSize: 30.0)),
          ],
        )
      ],
    );
  }
}
