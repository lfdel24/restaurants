import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurants/account/controller/register_user_controller.dart';
import 'package:restaurants/r_colors.dart';

class RegisterUserView extends StatelessWidget {
  final marginHorizontal = EdgeInsets.symmetric(horizontal: 12);

  @override
  Widget build(BuildContext context) {
    print("RegisterUserView");
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Registrar usuario",
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
    print("_BuildLogo");
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
  final _controllerName = TextEditingController(text: "");
  final _controllerEmail = TextEditingController(text: "");
  final _controllerPass = TextEditingController(text: "");
  final _focusNodeName = FocusNode();
  final _focusNodeEmail = FocusNode();
  final _focusNodePass = FocusNode();

  @override
  void dispose() {
    _controllerName.dispose();
    _controllerEmail.dispose();
    _controllerPass.dispose();
    _focusNodeName.dispose();
    _focusNodeEmail.dispose();
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
              controller: _controllerName,
              focusNode: _focusNodeName,
              autofocus: true,
              validator: (value) {
                if (value!.isEmpty) {
                  _focusNodeName.requestFocus();
                  return "Ingrese un nombre";
                }
              },
              decoration: InputDecoration(
                  labelText: "Nombre", hintText: "Ingrese su nombre")),
          SizedBox(height: 10),
          TextFormField(
            controller: _controllerEmail,
            focusNode: _focusNodeEmail,
            validator: (value) {
              if (value!.isEmpty) {
                _focusNodeEmail.requestFocus();
                return "Ingrese un email";
              }
            },
            decoration: InputDecoration(
                labelText: "Email", hintText: "Ingrese un email"),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  focusNode: _focusNodePass,
                  obscureText: context.read<RegisterUserController>().showPass,
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
                    color: context.watch<RegisterUserController>().showPass
                        ? Colors.black
                        : RColors.purpleAccent,
                  ),
                  onPressed: () {
                    context.read<RegisterUserController>().changeShowPass();
                  }),
            ],
          ),
          SizedBox(height: 40),
          Container(
            color: RColors.purpleAccent,
            width: double.infinity,
            height: 50,
            child: MaterialButton(
              onPressed: () {
                if (_formKeyState.currentState!.validate()) {
                  bool validate = context
                      .read<RegisterUserController>()
                      .save(_controllerName, _controllerEmail, _controllerPass);

                  if (validate) {
                    print("User created.");
                  } else {
                    print("User not created.");
                  }

                  _focusNodeName.requestFocus();
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
          )
        ],
      ),
    );
  }
}
