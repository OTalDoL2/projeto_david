import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:teste/auth/auth_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: Home()));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _auth = AuthService();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  bool entrar = true;
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _senhaController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            entrar ? "Tela Login" : "Tela Cadastro",
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
                inputText(texto: 'E-mail', controller: _emailController),

                inputText(texto: 'Senha', controller: _senhaController),

                Visibility(
                    visible: !entrar,
                    child: Column(
                      children: [
                        inputText(
                            texto: 'Digite a Senha Novamente',
                            controller: _senhaController),
                        inputText(texto: '', controller: _senhaController)
                      ],
                    )),

                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: SizedBox(
                    child: ElevatedButton(
                        onPressed: () async{
                          String email = _emailController.text.trim();
                          String password = _senhaController.text.trim();
                        if (entrar) {
                          User? user = await _auth.loginUserWithEmailAndPassword(email, password);
                          if (user != null) {
                            print("Login bem-sucedido!");
                          } else {
                            print("Falha no login. Verifique suas credenciais.");
                          }
                        } else {
                          User? user = await _auth.createUserWithEmailAndPassword(email, password);
                          if (user != null) {
                            print("Cadastro bem-sucedido!");
                          } else {
                            print("Falha no cadastro. Verifique suas informações.");
                          }
                        }
                        }, 
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
                TextButton(
                    onPressed: () {
                      setState(() {
                        entrar = !entrar;
                      });
                    },
                    // _authService.cadastrarUsuario(email: _emailController.text, senha: _senhaController.text),

                    child: Text(
                        entrar ? 'Cadastre-se' : 'Já tem uma conta? Entre'))
              ],
            )));
  }
  _registra() async {
    final user =
        await _auth.createUserWithEmailAndPassword(_emailController.text, _senhaController.text);
    if (user != null) {
      print('criou');
      
    }
  }

  _login() async {
    final user =
        await _auth.loginUserWithEmailAndPassword(_emailController.text, _senhaController.text);

    if (user != null) {
      print('logou');
    }
  }
}

class inputText extends StatelessWidget {
  final String texto;
  final TextEditingController controller;

  const inputText({
    Key? key,
    required this.texto,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: texto == 'Senha'
          ? true
          : texto == 'Digite a Senha Novamente'
              ? true
              : false,
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
