import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurants/account/controllers/register_user_controller.dart';
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
  final _nameController = TextEditingController(text: "");
  final _emailController = TextEditingController(text: "");
  final _passController = TextEditingController(text: "");
  final _focusNodeNAme = FocusNode();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passController.dispose();
    _focusNodeNAme.dispose();
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
              controller: _nameController,
              focusNode: _focusNodeNAme,
              autofocus: true,
              decoration: InputDecoration(
                  labelText: "Nombre", hintText: "Ingrese su nombre")),
          SizedBox(height: 10),
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
                labelText: "Email", hintText: "Ingrese un email"),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _passController,
                  obscureText: context.read<RegisterUserController>().showPass,
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
                context.read<RegisterUserController>().save(
                    name: _nameController.text,
                    email: _emailController.text,
                    pass: _passController.text);
                _focusNodeNAme.requestFocus();
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
