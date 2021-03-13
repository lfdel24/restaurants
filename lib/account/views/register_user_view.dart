import 'package:flutter/material.dart';
import 'package:restaurants/account/controllers/reguster_user_controller.dart';
import 'package:restaurants/r_colors.dart';

class RegisterUserView extends StatelessWidget {
  final marginHorizontal = EdgeInsets.symmetric(horizontal: 12);

  @override
  Widget build(BuildContext context) {
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
  final controller = RegisterUserController();

  @override
  void initState() {
    controller.init();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        Container(
          width: double.infinity,
          height: 60,
          color: RColors.purple,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text(controller.errorText)],
          ),
        ),
        SizedBox(height: 20),
        TextField(
            controller: controller.controllerName,
            focusNode: controller.focusNode,
            autofocus: true,
            decoration: InputDecoration(
                labelText: "Nombre", hintText: "Ingrese su nombre")),
        SizedBox(height: 10),
        TextField(
          controller: controller.controllerEmail,
          decoration:
              InputDecoration(labelText: "Email", hintText: "Ingrese un email"),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller.controllerPass,
                obscureText: controller.showPass,
                decoration: InputDecoration(
                  labelText: "Contaseña",
                  hintText: "Ingrese una contraseña",
                ),
              ),
            ),
            IconButton(
                icon: Icon(
                  Icons.remove_red_eye_outlined,
                  color:
                      controller.showPass ? Colors.black : RColors.purpleAccent,
                ),
                onPressed: () => setState(() => {controller.changeShowPass()})),
          ],
        ),
        SizedBox(height: 40),
        Container(
          color: RColors.purpleAccent,
          width: double.infinity,
          height: 50,
          child: MaterialButton(
            onPressed: () => setState(() => {controller.save()}),
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
    );
  }
}
