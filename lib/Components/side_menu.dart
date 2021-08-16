import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onepack/Widgets/popUps.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      child: Column(children: <Widget>[
        Expanded(
          child: Column(
            children: <Widget>[
              DrawerHeader(
                child: Image.asset("assets/images/logo.png"),
              ),
              DrawerListTile(
                title: "Tableau de bord",
                svgSrc: "assets/icons/menu_dashbord.svg",
                press: () {
                  if (ModalRoute.of(context)!.settings.name != '/Home')
                    Navigator.pushNamed(context, '/Home');
                },
              ),
              DrawerListTile(
                title: "Calculatrice",
                svgSrc: "assets/icons/calcul.svg",
                press: () {
                  Navigator.pushNamed(context, '/Calc');
                },
              ),
              DrawerListTile(
                title: "Notes",
                svgSrc: "assets/icons/notes.svg",
                press: () {
                  Navigator.pushNamed(context, '/Notes');
                },
              ),
              Container(
                child: Expanded(
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Divider(),
                        DrawerListTile(
                          title: "Demande fin de service",
                          svgSrc: "assets/icons/right-arrow.svg",
                          press: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext
                              context) =>
                                  PopUp.buildDoublePopupDialog(
                                    context,
                                    'Confirmer votre action',
                                    'Voulez-vous vraiment faire une demande de fin service?',
                                    'Succés',
                                    'Demande envoyer',
                                  ),
                            );
                          }
                        ),
                        DrawerListTile(
                          title: "Se Déconnecter",
                          svgSrc: "assets/icons/logout.svg",
                          press: () {
                            Navigator.pushNamed(context, '/');

                          },
                        ),
                        DrawerListTile(
                            title: "Serveur",
                            svgSrc: "",
                            press: () {Navigator.pushNamed(
                                context, '/Serveur');}),

                        DrawerListTile(
                            title: "Admin",
                            svgSrc: "",
                            press: () {Navigator.pushNamed(
                                context, '/Admin');})
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ]),
    ));
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        color: Color(0xFF18184E),
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(color: Color(0xFF18184E)),
      ),
    );
  }
}
