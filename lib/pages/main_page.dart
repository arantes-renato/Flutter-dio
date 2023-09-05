import 'dart:io';
import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/dados_conta.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int posicaoPagina = 0;
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                color: const Color.fromARGB(
                    255, 11, 2, 60), // Defina a cor de fundo desejada
                padding:
                    const EdgeInsets.all(10.0), // Espaçamento interno desejado
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage:
                          FileImage(File('lib/assets/images/minha_foto.jpg')),
                      radius: 30.0,
                      backgroundColor:
                          Colors.transparent, // Defina a cor de fundo do avatar
                      // Adicione a imagem de perfil ou ícone do usuário aqui
                    ),
                    const SizedBox(
                        height: 10.0), // Espaçamento entre avatar e texto
                    const Text("Name",
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                    const Text("emaili@email.com",
                        style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
              InkWell(
                child: const ListTile(
                  leading: Icon(Icons.account_circle_outlined),
                  title: Text('Conta'),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DadosContasPage()));
                },
              ),
              InkWell(
                child: const ListTile(
                  leading: Icon(Icons.message_outlined),
                  title: Text('Mensagens'),
                ),
                onTap: () {},
              ),
              InkWell(
                child: const ListTile(
                  leading: Icon(Icons.settings_outlined),
                  title: Text('Configuração'),
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: controller,
                onPageChanged: (value) {
                  setState(() {
                    posicaoPagina = value;
                  });
                },
                children: [
                  Container(
                    color: Colors.black,
                    child: const Center(
                      child: Text(
                        'Eu',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.black,
                    child: const Center(
                      child: Text(
                        'Te',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.black,
                    child: const Center(
                      child: Text(
                        'Amo',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            BottomNavigationBar(
                onTap: (value) {
                  controller.jumpToPage(value);
                },
                currentIndex: posicaoPagina,
                items: const [
                  BottomNavigationBarItem(
                      label: 'Page1',
                      icon:
                          Icon(Icons.arrow_back_outlined, color: Colors.white)),
                  BottomNavigationBarItem(
                      label: 'Page2',
                      icon: Icon(Icons.circle_outlined, color: Colors.white)),
                  BottomNavigationBarItem(
                      label: 'Page3',
                      icon: Icon(Icons.arrow_forward_outlined,
                          color: Colors.white))
                ])
          ],
        ),
      ),
    );
  }
}
