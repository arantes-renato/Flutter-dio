import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trilhaapp/services/gerador_numero_aleatorio_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var numeroGerado = 0;
  var quantidadeCliques = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My App",
          style: GoogleFonts.eduSaBeginner(),
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Ações do usuário.",
              style: GoogleFonts.galada(fontSize: 20),
            ),
            quantidadeCliques == 1
                ? Text(
                    "O botão foi clicado $quantidadeCliques vez.",
                    style: GoogleFonts.galada(fontSize: 20),
                  )
                : Text(
                    "O botão foi clicado $quantidadeCliques vezes.",
                    style: GoogleFonts.galada(fontSize: 20),
                  ),
            Text(
              "O número aleatório é: $numeroGerado.",
              style: GoogleFonts.galada(fontSize: 20),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_box),
        onPressed: () {
          setState(() {
            quantidadeCliques += 1;
            numeroGerado =
                GeradorNumeroAleatorioService.gerarNumeroAleatorio(1000);
          });
        },
      ),
    );
  }
}
