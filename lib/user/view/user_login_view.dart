import 'package:flutter/material.dart';
import 'package:restaurants/custom_widgets/assets.dart';
import 'package:restaurants/custom_widgets/text.dart';
import 'package:restaurants/custom_widgets/utilities.dart';
import 'package:restaurants/user/controller/user_login_controller.dart';
import 'package:restaurants/user/view/user_register_view.dart';

import '../../colors.dart';

class UserLoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            iniciarSesion,
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
            logo,
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
  final controller = UserLoginController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formState,
      child: Column(
        children: [
          SizedBox(height: 10),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            controller: controller.controllerEmail,
            focusNode: controller.focusNodeEmail,
            validator: (value) {
              if (value!.isEmpty) {
                controller.focusNodeEmail.requestFocus();
                return ingreseUnEmail;
              }
            },
            decoration:
                InputDecoration(labelText: email, hintText: ingreseUnEmail),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  focusNode: controller.focusNodePass,
                  obscureText: controller.showPass,
                  controller: controller.controllerPass,
                  validator: (value) {
                    if (value!.isEmpty) {
                      controller.focusNodePass.requestFocus();
                      return ingreseUnaContrasena;
                    }
                  },
                  decoration: InputDecoration(
                    labelText: contrasena,
                    hintText: ingreseUnaContrasena,
                  ),
                ),
              ),
              IconButton(
                  icon: Icon(
                    controller.showPass
                        ? Icons.remove_red_eye_rounded
                        : Icons.remove_red_eye_outlined,
                    color: controller.showPass ? Colors.black : purpleAccent,
                  ),
                  onPressed: () {
                    setState(() {
                      controller.changueShowPass();
                    });
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
                if (controller.formState.currentState!.validate()) {
                  // context.read<UserController>().login(
                  //       mailController: _controllerMail,
                  //       passController: _controllerPass,
                  //       functionError: () {
                  //         customSnackBar(
                  //             context, usuarioYOContrasenaIncorrecta);
                  //       },
                  //       functionGood: () {
                  //         push(context, UserGuestView());
                  //       },
                  //     );
                }
              },
              child: Text(
                continuar,
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
              child: Text(aunNoTienesCuentaRegistrate,
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
