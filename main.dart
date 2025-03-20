import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(AppContador());
}

class AppContador extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contador de Pessoas',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: TelaContador(),
    );
  }
}

class TelaContador extends StatefulWidget {
  @override
  _TelaContadorState createState() => _TelaContadorState();
}

class _TelaContadorState extends State<TelaContador> {
  int _quantidade = 0;
  String _mensagem = "";
  final int _limite = 10;
  Color _corFundo = Colors.white;

  void _adicionarPessoa() {
    setState(() {
      _quantidade++;
      _mensagem = (_quantidade > _limite) ? "Lotação Excedida!" : "";
    });
  }

  void _removerPessoa() {
    if (_quantidade > 0) {
      setState(() {
        _quantidade--;
        if (_quantidade <= _limite) _mensagem = "";
      });
    }
  }

  void _mudarCorFundo() {
    List<Color> cores = [Colors.blue, Colors.green, Colors.red, Colors.orange, Colors.purple];
    setState(() {
      _corFundo = cores[Random().nextInt(cores.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Controle de Pessoas")),
      body: Container(
        color: _corFundo,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_mensagem, style: TextStyle(fontSize: 18, color: Colors.red)),
              Text("Pessoas Presentes:", style: TextStyle(fontSize: 22)),
              Text("$_quantidade", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    onPressed: _adicionarPessoa,
                    child: Icon(Icons.add),
                    tooltip: "Adicionar Pessoa",
                  ),
                  const SizedBox(width: 20),
                  FloatingActionButton(
                    onPressed: _removerPessoa,
                    child: Icon(Icons.remove),
                    tooltip: "Remover Pessoa",
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _mudarCorFundo,
                child: Text("Mudar Cor de Fundo"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}