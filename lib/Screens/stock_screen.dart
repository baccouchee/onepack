import 'package:badges/badges.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:onepack/Components/header.dart';
import 'package:onepack/Widgets/Timer.dart';
import 'package:onepack/Widgets/popUps.dart';
import 'package:onepack/Components/side_menu.dart';
import 'package:onepack/global/constants.dart';

class StockScreen extends StatefulWidget {
  const StockScreen({Key? key}) : super(key: key);

  @override
  _StockScreenState createState() => _StockScreenState();
}

class _StockScreenState extends State<StockScreen> {
  static const int numItems = 10;
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
                padding: EdgeInsets.all(defaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                      'Gestion du stock',
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
                    SizedBox(
                      height: 40,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Container(
                          color: secondaryColor,
                          child: DataTable2(
                            columnSpacing: defaultPadding,
                            minWidth: 600,
                            dataTextStyle: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                            ),
                            headingTextStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                            columns: [
                              DataColumn(
                                label: Text("Catégorie"),
                              ),
                              DataColumn(
                                label: Text("Sous-catégorie"),
                              ),
                              DataColumn(
                                label: Text("Quantité"),
                              ),
                              DataColumn(
                                label: Text("Action"),
                              ),
                            ],
                            rows: List<DataRow>.generate(
                              numItems,
                              (int index) => DataRow(
                                cells: <DataCell>[
                                  DataCell(Text('cat$index')),
                                  DataCell(Text('Sucre')),
                                  DataCell(Text('521')),
                                  DataCell(
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 40,
                                          width: 40,
                                          child: TextButton(
                                            onPressed: () {
                                              showDialog(
                                                context: context,
                                                builder: (BuildContext
                                                        context) =>
                                                    buildPopupDialogFormStock(
                                                  context,
                                                  'Modifier',
                                                ),
                                              );
                                            },
                                            child: Icon(
                                              Icons.edit,
                                              color: Colors.green,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 40,
                                          width: 40,
                                          child: TextButton(
                                            onPressed: () {
                                              showDialog(
                                                context: context,
                                                builder: (BuildContext
                                                        context) =>
                                                    PopUp
                                                        .buildDoublePopupDialog(
                                                  context,
                                                  'Confirmer votre action',
                                                  'Voulez-vous vraiment supprimer cette ligne?',
                                                  'Succés',
                                                  'Ligne Supprimée',
                                                ),
                                              );
                                            },
                                            child: Icon(
                                              Icons.delete,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: primaryColor.withOpacity(0.9),
                            primary: primaryColor,
                            textStyle: TextStyle(fontSize: 17),
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  buildPopupDialogFormStock(
                                context,
                                'Ajouter',
                              ),
                            );
                          },
                          child: Text(
                            'Ajouter un produit',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  static Widget buildPopupDialogFormStock(
    BuildContext context,
    String buttonText,
  ) {
    // final _formKey = GlobalKey<FormState>();
    return SimpleDialog(
      children: [
        Container(
          padding: EdgeInsets.all(8.0),
          height: MediaQuery.of(context).size.height * 0.7,
          width: MediaQuery.of(context).size.width * 0.32,
          child: Form(
            // key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Catégorie',
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Sous-catégorie',
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Quantité',
                  ),
                ),
                ElevatedButton(
                  style: TextButton.styleFrom(
                    backgroundColor: primaryColor.withOpacity(0.9),
                    primary: primaryColor,
                    textStyle: const TextStyle(fontSize: 17),
                  ),
                  child: Text(
                    buttonText,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    // if (_formKey.currentState.validate()) {
                    //   _formKey.currentState.save();
                    // }
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
