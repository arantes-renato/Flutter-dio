import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:trilhaapp/repositories/linguagens_repository.dart';
import 'package:trilhaapp/repositories/nivel_repository.dart';

class DadosContasPage extends StatefulWidget {
  const DadosContasPage({super.key});

  @override
  State<DadosContasPage> createState() => _DadosContasPageState();
}

class _DadosContasPageState extends State<DadosContasPage> {
  var nomeController = TextEditingController(text: "");
  var dataNascimentoController = TextEditingController(text: "");
  var nivelRepository = NivelRepository();
  var linguagensRepository = LinguagensRepository();
  var niveis = [];
  var linguagens = [];
  var nivelSelecionado = "";
  var linguagensSelecionadas = [];
  int tempoExperiencia = 1;

  @override
  void initState() {
    niveis = (nivelRepository.retornaNiveis());
    linguagens = (linguagensRepository.retornaLinguagens());
    super.initState();
  }

  List<DropdownMenuItem> returnItens(int quantidadeMaxima) {
    var itens = <DropdownMenuItem>[];
    for (var i = 1; i <= quantidadeMaxima; i++) {
      if (i == 1) {
        itens.add(DropdownMenuItem(
          value: i,
          child: Text(
            '$i ano',
            style: const TextStyle(
                color: Colors.white70,
                fontSize: 18,
                fontWeight: FontWeight.w600),
          ),
        ));
      } else {
        itens.add(DropdownMenuItem(
          value: i,
          child: Text(
            '$i anos',
            style: const TextStyle(
                color: Colors.white70,
                fontSize: 18,
                fontWeight: FontWeight.w600),
          ),
        ));
      }
    }
    return itens;
  }

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
      body: ListView(children: [
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          height: 40,
          alignment: Alignment.center,
          child: TextField(
            controller: nomeController,
            style: const TextStyle(color: Colors.white, fontSize: 18),
            decoration: const InputDecoration(
              hintText: 'Nome',
              hintStyle: TextStyle(color: Colors.white70),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          height: 40,
          alignment: Alignment.center,
          child: TextField(
            readOnly: true,
            controller: dataNascimentoController,
            onTap: () async {
              var data = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900, 1, 1),
                  lastDate: DateTime.now());
              if (data != null) {
                dataNascimentoController.text =
                    DateFormat.yMd('pt_BR').format(data);
              }
            },
            style: const TextStyle(color: Colors.white, fontSize: 18),
            decoration: const InputDecoration(
              hintText: 'Data de Nascimento',
              hintStyle: TextStyle(color: Colors.white70),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
          child: const Text(
            'Nivel de Experiencia',
            style: TextStyle(
                color: Colors.white70,
                fontSize: 18,
                fontWeight: FontWeight.w600),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: niveis
                .map((nivel) => Expanded(
                      child: RadioListTile(
                          selected: nivelSelecionado == nivel,
                          contentPadding: const EdgeInsets.all(0),
                          dense: true,
                          title: Text(
                            nivel,
                            style: const TextStyle(
                                color: Colors.white70, letterSpacing: -0.4),
                          ),
                          value: nivel,
                          groupValue: nivelSelecionado,
                          onChanged: (value) {
                            setState(() {
                              nivelSelecionado = value;
                            });
                          }),
                    ))
                .toList(),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
          child: const Text(
            'Linguagens Preferidas',
            style: TextStyle(
                color: Colors.white70,
                fontSize: 18,
                fontWeight: FontWeight.w600),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
          child: Column(
            children: linguagens
                .map((linguagem) => CheckboxListTile(
                    title: Text(
                      linguagem,
                      style: const TextStyle(
                          color: Colors.white70, letterSpacing: -0.4),
                    ),
                    value: linguagensSelecionadas.contains(linguagem),
                    dense: true,
                    onChanged: (value) {
                      if (value!) {
                        setState(() {
                          linguagensSelecionadas.add(linguagem);
                        });
                      } else {
                        setState(() {
                          linguagensSelecionadas.remove(linguagem);
                        });
                      }
                    }))
                .toList(),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
          child: const Text(
            'Tempo de Experiência',
            style: TextStyle(
                color: Colors.white70,
                fontSize: 18,
                fontWeight: FontWeight.w600),
          ),
        ),
        DropdownButton(
            isExpanded: true,
            value: tempoExperiencia,
            dropdownColor: Colors.black,
            menuMaxHeight: 200,
            padding: const EdgeInsets.symmetric(horizontal: 30),
            isDense: true,
            items: returnItens(10),
            onChanged: (value) {
              setState(() {
                tempoExperiencia = int.parse(value.toString());
              });
            }),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 28, vertical: 30),
          child: TextButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 11, 2, 60))),
              child: const Text(
                "Salvar",
                style: TextStyle(color: Colors.white),
                textScaleFactor: 1.4,
              )),
        )
      ]),
    );
  }
}
