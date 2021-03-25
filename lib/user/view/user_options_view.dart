import 'package:flutter/material.dart';
import 'package:restaurants/custom_widgets/custom_material_button.dart';
import 'package:restaurants/r_colors.dart';
import 'package:restaurants/user/controller/user_controller.dart';

class UserOptionsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cuenta"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  height: 125,
                ),
                GestureDetector(
                  onTap: () {
                    UserController controller = UserController();
                    controller.picker(context);
                  },
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Container(
                          margin: EdgeInsets.all(9),
                          width: 80,
                          height: 80,
                          color: RColors.purpleAccent)),
                ),
                Column(
                  children: [
                    Text("Leonardo de la cruz"),
                    Text("lfdel24@gmail.com"),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              onTap: () {},
              title: Text("Cambiar nombre"),
              leading: Icon(Icons.accessibility_new_outlined),
              trailing: Icon(Icons.arrow_forward_ios_outlined),
            ),
            SizedBox(
              height: 5,
            ),
            ListTile(
              onTap: () {},
              title: Text("Cambiar correo"),
              leading: Icon(Icons.mail_outline),
              trailing: Icon(Icons.arrow_forward_ios_outlined),
            ),
            SizedBox(
              height: 5,
            ),
            ListTile(
              onTap: () {},
              title: Text("Cambiar contraseña"),
              leading: Icon(Icons.admin_panel_settings_outlined),
              trailing: Icon(Icons.arrow_forward_ios_outlined),
            ),
            SizedBox(
              height: 30,
            ),
            CustomMaterialButton(
              onPressed: () {},
              label: "Cerrar sesión",
            )
          ],
        ),
      ),
    );
  }
}
