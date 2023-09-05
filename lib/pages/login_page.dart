import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/main_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController = TextEditingController();
  var senhaController = TextEditingController();
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints:
                BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Expanded(child: Container()),
                      Expanded(
                          flex: 6,
                          child: Image.asset(
                            'lib/assets/images/logo_painel.png',
                            height: 250,
                          )),
                      Expanded(child: Container()),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    height: 30,
                    alignment: Alignment.center,
                    child: TextField(
                      style: const TextStyle(color: Colors.white),
                      controller: emailController,
                      decoration: const InputDecoration(
                          hintText: 'email@email.com',
                          hintStyle: TextStyle(color: Colors.white30),
                          prefixIcon: Icon(Icons.email_outlined)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                    child: Container(),
                  ),
                  Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      height: 30,
                      alignment: Alignment.center,
                      child: TextField(
                        style: const TextStyle(color: Colors.white),
                        controller: senhaController,
                        obscureText: isObscureText,
                        decoration: InputDecoration(
                            hintText: 'Senha',
                            hintStyle: const TextStyle(color: Colors.white30),
                            prefixIcon: const Icon(Icons.lock_outline),
                            suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  isObscureText = !isObscureText;
                                });
                              },
                              child: Icon(isObscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            )),
                      )),
                  Expanded(
                    flex: 2,
                    child: Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: double.infinity,
                        child: TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const MainPage()));
                            },
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    const Color.fromARGB(255, 11, 2, 60))),
                            child: const Text(
                              'Entrar',
                              style: TextStyle(color: Colors.white),
                              textScaleFactor: 1.5,
                            )),
                      ),
                    ),
                  ),
                  Expanded(flex: 3, child: Container()),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    height: 20,
                    alignment: Alignment.center,
                    child: const Text("Esqueci minha senha",
                        style: TextStyle(color: Colors.white)),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 10),
                    height: 30,
                    alignment: Alignment.center,
                    child: const Text("Fazer cadastro",
                        style: TextStyle(color: Colors.white)),
                  ),
                  const SizedBox(
                    height: 40,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
