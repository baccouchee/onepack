import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:onepack/Components/side_menu.dart';
import 'package:onepack/Models/FuncList.dart';
import 'package:onepack/Models/RecentFile.dart';
import 'package:onepack/Widgets/Timer.dart';
import 'package:onepack/Widgets/popUps.dart';
import 'package:get/get.dart';
import 'package:onepack/Widgets/widgets.dart';
import 'package:onepack/global/constants.dart';

class ServeurScreen extends StatefulWidget {
  @override
  _ServeurScreenState createState() => _ServeurScreenState();
}

class _ServeurScreenState extends State<ServeurScreen> {
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
                              'Tableau de bord - Serveur',
                              style: Theme.of(context).textTheme.headline6,
                            ),
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
                    Expanded(
                      child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 2,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: defaultPadding,
                          mainAxisSpacing: defaultPadding,
                          childAspectRatio: 1.0,
                        ),
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, '/${funcListServeur[index]}');
                          },
                          child: CustomButtons.funcButtons(
                            title: funcListServeur[index],
                            iconPath: funcListIconS[index],
                          ),
                        ),
                      ),
                    ),
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
                            "Historique commande",
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: DataTable(
                              columnSpacing: defaultPadding,
                              columns: [
                                DataColumn(
                                  label: Text("Table name"),
                                ),
                                DataColumn(
                                  label: Text("Date"),
                                ),
                                DataColumn(
                                  label: Text("Montant"),
                                ),
                                DataColumn(
                                  label: Text("Action"),
                                ),
                              ],
                              rows: List.generate(
                                demoRecentFiles.length,
                                    (index) => recentFileDataRow(demoRecentFiles[index], context),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],),),

            ),

          ],
        ),
      ),
    );
  }

}




AlertDialog buildCommandePopupDialog(BuildContext context, String title1) {
return AlertDialog(
title: Text(title1),
content: Column(
mainAxisSize: MainAxisSize.min,
crossAxisAlignment: CrossAxisAlignment.start,
children: <Widget>[
TextButton.icon(
label: Text('Demande supression avec modification de stock'),
icon: Icon(Icons.delete),
style: TextButton.styleFrom(
backgroundColor: primaryColor.withOpacity(0.1),
primary: Colors.red,
textStyle: const TextStyle(fontSize: 17),
),
onPressed: () {
Navigator.of(context).pop();
showDialog(
context: context,
builder: (BuildContext context) => PopUp.buildDoublePopupDialog(
context,
'Confirmer votre action',
'Voulez-vous vraiment la commande avec modification de stock?',
'Succés',
'Commande Supprimée',
),
);
},
),
TextButton.icon(
label: Text('Demande supression sans modification de stock'),
icon: Icon(Icons.delete_forever),
style: TextButton.styleFrom(
backgroundColor: primaryColor.withOpacity(0.1),
primary: Colors.red,
textStyle: const TextStyle(fontSize: 17),
),
onPressed: () {
Navigator.of(context).pop();
showDialog(
context: context,
builder: (BuildContext context) => PopUp.buildDoublePopupDialog(
context,
'Confirmer votre action',
'Voulez-vous vraiment la commande sans modification de stock?',
'Succés',
'Commande Supprimée',
),
);
},
),
],
),
actions: <Widget>[
TextButton(
onPressed: () {
Navigator.of(context).pop();
},
child: Text('Fermer'),
),
],
);
}




DataRow recentFileDataRow(RecentFile fileInfo, BuildContext context) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(fileInfo.title!),
            ),
          ],
        ),
      ),
      DataCell(Text(fileInfo.date!)),
      DataCell(Text(fileInfo.size!)),
      DataCell(
          Row(
            children : [
              IconButton(onPressed: (){    showDialog(
                context: context,
                builder: (BuildContext context) =>
                    buildCommandePopupDialog(
                      context,
                      'Choisir Votre action',
                    ),
              );}, icon: Icon(Icons.delete), color: Colors.red,),

      ]

      )),
    ],
  );


}
