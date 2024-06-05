import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: Home()));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Tela Login',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
        ),
        backgroundColor: const Color.fromARGB(255, 19, 22, 21),
        body: SingleChildScrollView(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Icon(
                  Icons.person_outline,
                  color: Colors.white,
                  size: 110,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'E-mail',
                    hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w200),
                  ),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w200),
                ),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Senha',
                    hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w200),
                  ),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w200),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: SizedBox(
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5))),
                        child: Text('Entrar',
                            style: TextStyle(
                              color: Colors.white,
                            ))),
                  ),
                ),
                // inputText(texto: 'pastel')
                TextButton(onPressed: () {}, child: const Text('Cadastre-se'))
              ],
            )));
  }
}

class inputText extends StatelessWidget {
  final String texto;

  const inputText({
    Key? key,
    required this.texto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: texto,
        hintStyle: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w200),
      ),
      style: TextStyle(
          color: Colors.white, fontSize: 16, fontWeight: FontWeight.w200),
    );
  }
}
