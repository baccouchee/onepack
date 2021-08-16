import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:onepack/Components/side_menu.dart';
import 'package:onepack/Models/FuncList.dart';
import 'package:onepack/Widgets/Timer.dart';

import 'package:onepack/Widgets/custom_widgets.dart';
import 'package:onepack/global/constants.dart';

class AdminScreen extends StatefulWidget {
  AdminScreen({Key? key}) : super(key: key);

  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  bool tapped = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: SideMenu(),
            ),
            Expanded(
              flex: 4,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                padding: EdgeInsets.all(defaultPadding),
                color: bgColor,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(defaultPadding),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Tableau de bord - Admin',
                              style: Theme.of(context).textTheme.headline6,
                            ),

                          ),
                          Container(
                            margin: EdgeInsets.only(left: defaultPadding),
                            padding: EdgeInsets.symmetric(
                              horizontal: defaultPadding,
                              vertical: defaultPadding / 2,
                            ),
                            decoration: BoxDecoration(
                              color: secondaryColor,
                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                              border: Border.all(color: Colors.white10),
                            ),
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/images/logo.png",
                                  height: 38,
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
                                  child: Text("Nom Prénom"),
                                ),
                              ],
                            ),
                          ),
                          Badge(
                            badgeContent: Text('3', style: TextStyle(color: Colors.white),),
                            child:       PopupMenuButton(
                              icon: Icon(Icons.notifications, color: primaryColor,),
                              itemBuilder: (context) => [
                                PopupMenuItem(
                                  child: Row(
                                    children: <Widget>[
                                      Text('Working a lot harder'),
                                      IconButton(
                                        icon: new Icon(Icons.close),
                                        onPressed: (){},
                                      ),
                                    ],
                                  ),
                                ),
                                PopupMenuItem(
                                  child: Row(
                                    children: <Widget>[
                                      Text('Working a lot harder'),
                                      IconButton(
                                        icon: new Icon(Icons.close),
                                        onPressed: (){},
                                      ),
                                    ],
                                  ),
                                ),
                                PopupMenuItem(
                                  child: Row(
                                    children: <Widget>[
                                      Text('Working a lot harder'),
                                      IconButton(
                                        icon: new Icon(Icons.close),
                                        onPressed: (){},
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                    SizedBox(height: 40,),
                    Expanded(
                      child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 6,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: defaultPadding,
                          mainAxisSpacing: defaultPadding,
                          childAspectRatio: 1.0,
                        ),
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, '/${funcListProduit[index]}');
                          },
                          child: CustomWidgets.funcButtons(
                            title: funcListProduit[index],
                            iconPath: funcListIcon1[index],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
