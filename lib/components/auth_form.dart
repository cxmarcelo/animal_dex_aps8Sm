import 'package:animal_dex/models/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

enum AuthMode { signup, login }

class AuthForm extends StatefulWidget {
  const AuthForm({Key? key}) : super(key: key);

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  AuthMode _authMode = AuthMode.login;

  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  bool _isLogin() => _authMode == AuthMode.login;
  bool _isSignup() => _authMode == AuthMode.signup;

  _switchAuthMode() {
    setState(() {
      if (_authMode == AuthMode.login) {
        _authMode = AuthMode.signup;
      } else {
        _authMode = AuthMode.login;
      }
    });
  }

  Map<String, String> _authData = {
    'login': '',
    'password': '',
  };

  void _showErrorDialog(String msg) {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: Text(msg),
              actions: [
                TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text("Fechar"))
              ],
            ));
  }

  Future<void> _submit(BuildContext context) async {
    print("Subimit");
    final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) {
      return;
    }

    setState(() => _isLoading = true);
    _formKey.currentState?.save();
    Auth auth = Provider.of(context, listen: false);

    try {
      if (_authMode == AuthMode.login) {
        await auth.login(
          _authData['login']!,
          _authData['password']!,
        );
      } else {
        await auth.signUp(
          _authData['login']!,
          _authData['password']!,
          _authData['name']!,
          _authData['email']!,
        );
      }
    } catch (e) {
      _showErrorDialog(e.toString());
    }
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        height: _isLogin() ? 320 : 450,
        width: deviceSize.width * 0.75,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: "Login"),
                keyboardType: TextInputType.name,
                onSaved: (login) => _authData['login'] = login ?? '',
                validator: (_login) {
                  final login = _login ?? '';
                  if (login.trim().isEmpty) {
                    return "Informe o login.";
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Senha"),
                keyboardType: TextInputType.name,
                obscureText: true,
                controller: _passwordController,
                validator: (_password) {
                  final password = _password ?? '';
                  if (password.isEmpty || password.length < 5) {
                    return "Informe uma senha válida";
                  } else {
                    return null;
                  }
                },
                onSaved: (password) => _authData['password'] = password ?? '',
              ),
              if (_isSignup())
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: "Cofirmar Senha"),
                  keyboardType: TextInputType.name,
                  obscureText: true,
                  validator: _isLogin()
                      ? null
                      : (_password) {
                          final password = _password ?? '';
                          if (password != _passwordController.text) {
                            return "Senhas informadas não conferem.";
                          } else {
                            return null;
                          }
                        },
                ),
              if (_isSignup())
                TextFormField(
                  decoration: const InputDecoration(labelText: "Nome"),
                  keyboardType: TextInputType.name,
                  onSaved: (name) => _authData['name'] = name ?? '',
                  validator: (_name) {
                    final login = _name ?? '';
                    if (login.trim().isEmpty) {
                      return "Informe o Nome.";
                    } else {
                      return null;
                    }
                  },
                ),
              if (_isSignup())
                TextFormField(
                  decoration: const InputDecoration(labelText: "Email"),
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (email) => _authData['email'] = email ?? '',
                  validator: (_email) {
                    final login = _email ?? '';
                    if (login.trim().isEmpty) {
                      return "Informe o Email.";
                    } else {
                      return null;
                    }
                  },
                ),
              const SizedBox(height: 20),
              if (_isLoading)
                const CircularProgressIndicator()
              else
                ElevatedButton(
                  onPressed: () {
                    _submit(context);
                  },
                  child: Text(
                    _isLogin() ? "ENTRAR" : "REGISTRAR",
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 8,
                      )),
                ),
              const Spacer(),
              TextButton(
                  onPressed: _switchAuthMode,
                  child:
                      Text(_isLogin() ? "REGISTRAR-SE" : "JÁ POSSUI CONTA ?"))
            ],
          ),
        ),
      ),
    );
  }
}
