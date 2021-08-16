import 'package:flutter/material.dart';
import 'package:onepack/Components/side_menu.dart';
import 'package:onepack/Models/FuncList.dart';
import 'package:onepack/Models/storage_info_card.dart';
import 'package:onepack/Widgets/Timer.dart';
import 'package:onepack/Widgets/popUps.dart';
import 'package:onepack/Widgets/widgets.dart';



import 'package:onepack/global/constants.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:badges/badges.dart';

class CatScreen extends StatefulWidget {
  @override
  _CatScreenState createState() => _CatScreenState();
}
Icon notif = Icon(Icons.notifications, color: primaryColor);


class _CatScreenState extends State<CatScreen> {


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
                            child : Row(
                            children: [
                              IconButton(onPressed: (){
                                Navigator.of(context).pop();
                              }, icon: Icon(Icons.arrow_back)),
                            Text(
                              'Gestion des commandes',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                ]
              )
                          ),
                          Time(),
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
                              icon: notif,
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
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Expanded(
                        flex: 4,
                        child: Container(
                          width: 200,
                          height: 700,
                          padding: EdgeInsets.all(defaultPadding),
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                          ),
                          child: ContainedTabBarView(
                            tabs: [
                              Text('Café', style: Theme.of(context).textTheme.headline6,),
                              Text('Chicha', style: Theme.of(context).textTheme.headline6,),
                              Text('Jus', style: Theme.of(context).textTheme.headline6,),
                              Text('Carte', style: Theme.of(context).textTheme.headline6,),
                              Text('Gateaux', style: Theme.of(context).textTheme.headline6,),
                            ],
                            views: [
                              Container(
                                  child: GridView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: 5,
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount:3,
                                  crossAxisSpacing: defaultPadding,
                                  mainAxisSpacing: defaultPadding,
                                  childAspectRatio: 1.0,
                                ),
                                itemBuilder: (context, index) => GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, '/Product');
                                  },
                                  child: CustomButtons.funcButtons(
                                    title: funcListCat[index],
                                    iconPath: funcListIconCat[index],
                                  ),
                                ),
                              )
                              ),
                              Container(color: Colors.white),
                Container(color: Colors.white),
                              Container(color: Colors.white),
                              Container(color: Colors.white),
                            ],
                            onChange: (index) => print(index),
                          ),
                        ),

                      ),
                          SizedBox(width: defaultPadding),
                          Expanded(
                            flex: 2,
                              child: Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(defaultPadding),
                                        decoration: BoxDecoration(
                                          color: secondaryColor,
                                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Commande Details",
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            SizedBox(height: defaultPadding),

                                            StorageInfoCard(
                                              title: "Cappucin",
                                            ),
                                            StorageInfoCard(
                                              title: "Expresse",
                                            ),
                                            StorageInfoCard(
                                              title: "Jus de fraise",
                                            ),
                                            StorageInfoCard(
                                              title: "Eau",
                                            ),
                                            SizedBox(height: 20,),
                                            Divider(),
                                            Padding(padding: EdgeInsets.all(defaultPadding),
                                            child: Column(
                                                children: [
                                                  Row(
                                                    children : [
                                                      Text("Montant : ",
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight: FontWeight.w500,
                                                        ),),
                                                      SizedBox(width: 20,),
                                                      Text("20.400 DT",
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight: FontWeight.w500,
                                                        ),),
                                                    ]

                                                  ),
                                          Row(
                                            children : [
                                              ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  primary: Color(0xFF04e3a3), // background
                                                  onPrimary: Colors.white, // foreground
                                                ),
                                                onPressed: () {
                                                  showDialog(
                                                    context: context,
                                                    builder: (BuildContext
                                                    context) =>
                                                        PopUp.buildDoublePopupDialog(
                                                          context,
                                                          'Confirmer votre action',
                                                          'Valider la commande ?',
                                                          'Succés',
                                                          'Commande validée',
                                                        ),
                                                  );
                                                },
                                                child: Text('Valider'),
                                              ),

                                              SizedBox(width: 20,),
                                              ElevatedButton(
                                                child: Text('Annuler'),
                                                style: ElevatedButton.styleFrom(
                                                  primary: Colors.red, // background
                                                  onPrimary: Colors.white, // foreground
                                                ), onPressed: () {          showDialog(
                                                context: context,
                                                builder: (BuildContext
                                                context) =>
                                                    PopUp.buildDoublePopupDialog(
                                                      context,
                                                      'Confirmer votre action',
                                                      'Vider le tableau',
                                                      'Succés',
                                                      'Tableau vidé',
                                                    ),
                                              ); },

                                              )
                                            ]
                                          ),

                                          ],
                                        )
                                            )


                                          ],
                                        ),

                                      ),


                                    ],
                                  )
                              )

      ]
                    )


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


