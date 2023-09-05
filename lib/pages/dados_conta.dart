import 'package:flutter/material.dart';

class DadosContasPage extends StatelessWidget {
  const DadosContasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'lib/assets/images/logo_painel_cortado.png',
              fit: BoxFit.scaleDown,
              height: 35,
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 11, 2, 60),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: const Center(
          child: Text(
        "Dados Cadastrais",
        style: TextStyle(color: Colors.white),
      )),
    );
  }
}
