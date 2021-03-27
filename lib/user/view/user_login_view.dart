import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurants/custom_widgets/custom_widgets.dart';
import 'package:restaurants/user/controller/user_controller.dart';
import 'package:restaurants/user/view/user_guest_view.dart';
import 'package:restaurants/user/view/user_register_view.dart';

import '../../colors.dart';

class UserLoginView extends StatelessWidget {
  final marginHorizontal = EdgeInsets.symmetric(horizontal: 12);

  @override
  Widget build(BuildContext context) {
    print("RegisterUserView");
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Iniciar sesión",
            style: Theme.of(context).textTheme.headline6,
          ),
          elevation: 1,
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: marginHorizontal,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _BuildLogo(),
                _BuildForm(),
              ],
            ),
          ),
        ));
  }
}

class _BuildLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 45),
        Container(
          height: 150,
          child: Image.asset(
            "assets/images/logo.png",
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}

class _BuildForm extends StatefulWidget {
  @override
  __BuildFormState createState() => __BuildFormState();
}

class __BuildFormState extends State<_BuildForm> {
  final _formKeyState = GlobalKey<FormState>();
  final _controllerMail = TextEditingController(text: "");
  final _controllerPass = TextEditingController(text: "");
  final _focusNodeMail = FocusNode();
  final _focusNodePass = FocusNode();

  @override
  void dispose() {
    _controllerMail.dispose();
    _controllerPass.dispose();
    _focusNodeMail.dispose();
    _focusNodePass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKeyState,
      child: Column(
        children: [
          SizedBox(height: 10),
          TextFormField(
            controller: _controllerMail,
            focusNode: _focusNodeMail,
            validator: (value) {
              if (value!.isEmpty) {
                _focusNodeMail.requestFocus();
                return "Ingrese un email";
              }
            },
            decoration: InputDecoration(
                labelText: "Correo", hintText: "Ingrese un correo"),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  focusNode: _focusNodePass,
                  obscureText: context.read<UserController>().showPass,
                  controller: _controllerPass,
                  validator: (value) {
                    if (value!.isEmpty) {
                      _focusNodePass.requestFocus();
                      return "Ingrese una contraseña";
                    }
                  },
                  decoration: InputDecoration(
                    labelText: "Contaseña",
                    hintText: "Ingrese una contraseña",
                  ),
                ),
              ),
              IconButton(
                  icon: Icon(
                    Icons.remove_red_eye_outlined,
                    color: context.watch<UserController>().showPass
                        ? Colors.black
                        : purpleAccent,
                  ),
                  onPressed: () {
                    context.read<UserController>().changeShowPass();
                  }),
            ],
          ),
          SizedBox(height: 40),
          Container(
            color: purpleAccent,
            width: double.infinity,
            height: 50,
            child: MaterialButton(
              onPressed: () async {
                if (_formKeyState.currentState!.validate()) {
                  context.read<UserController>().login(
                        mailController: _controllerMail,
                        passController: _controllerPass,
                        functionError: () {
                          customSnackBar(
                              context, "Usuario y/o contraseña incorrecta");
                        },
                        functionGood: () {
                          push(context, UserGuestView());
                        },
                      );
                }
              },
              child: Text(
                "Continuar",
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    ?.copyWith(color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          InkWell(
              child: Text("¿Aún no tienes cuenta? Regístrate",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      ?.copyWith(color: purpleAccent)),
              onTap: () {
                push(context, UserRegisterView());
              })
        ],
      ),
    );
  }
}
