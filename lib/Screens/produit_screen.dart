import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:onepack/Components/header.dart';
import 'package:onepack/Components/side_menu.dart';
import 'package:onepack/Models/FuncList.dart';
import 'package:onepack/Widgets/popUps.dart';

import 'package:onepack/global/constants.dart';

class ProduitScreen extends StatefulWidget {
  ProduitScreen({Key? key}) : super(key: key);

  @override
  _ProduitScreenState createState() => _ProduitScreenState();
}

class _ProduitScreenState extends State<ProduitScreen> {
  static const int numItems = 10;
  final _formKey = GlobalKey<FormState>();

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
                    Header(title: "Gestion des produits"),
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
                                label: Text("Nom"),
                              ),
                              DataColumn(
                                label: Text("Catégorie"),
                              ),
                              DataColumn(
                                label: Text("Quantité"),
                              ),
                              DataColumn(
                                label: Text("Prix unitaire"),
                              ),
                              DataColumn(
                                label: Text("Action"),
                              ),
                            ],
                            rows: List<DataRow>.generate(
                              numItems,
                                  (int index) => DataRow(
                                cells: <DataCell>[
                                  DataCell(
                                    Text('cat$index'),
                                    onTap: () {

                                    },
                                  ),
                                  DataCell(Text('Sucre')),
                                  DataCell(Text('732')),
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
                                            onPressed: () {},
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
                                                    PopUp.buildDoublePopupDialog(
                                                      context,
                                                      'Confirmer votre action',
                                                      'Voulez-vous vraiment supprimer le produit?',
                                                      'Succés',
                                                      'Produit supprimer',
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
                            textStyle: const TextStyle(fontSize: 17),
                          ),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    content: Stack(
                                      overflow: Overflow.visible,
                                      children: <Widget>[
                                        Positioned(
                                          right: -40.0,
                                          top: -40.0,
                                          child: InkResponse(
                                            onTap: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: CircleAvatar(
                                              child: Icon(Icons.close),
                                              backgroundColor: Colors.red,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                            padding: const EdgeInsets.all(8.0),

                                            child: Container(
                                                height: 500,
                                                width: 400,
                                                child: Column(
                                                  children: [
                                                    Text("Ajouter un produit ?"),
                                                Form(
                                                    key: _formKey,
                                                    child: Column(
                                                      mainAxisSize: MainAxisSize.min,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: EdgeInsets.all(8.0),
                                                          child: Container(
                                                              decoration: BoxDecoration(
                                                                color: Colors.grey,
                                                                borderRadius: new BorderRadius.circular(10.0),
                                                              ),
                                                              child: Padding(
                                                                  padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                                                                  child: TextFormField(
                                                                      decoration: InputDecoration(
                                                                        border: InputBorder.none,
                                                                        labelText: 'Nom',
                                                                      ))))

                                                        ),
                                                        Padding(
                                                            padding: EdgeInsets.all(8.0),
                                                            child: Container(
                                                                decoration: BoxDecoration(
                                                                  color: Colors.grey,
                                                                  borderRadius: new BorderRadius.circular(10.0),
                                                                ),
                                                                child: Padding(
                                                                    padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                                                                    child: TextFormField(
                                                                        decoration: InputDecoration(
                                                                          border: InputBorder.none,
                                                                          labelText: 'Prix',
                                                                        ))))

                                                        ),
                                                        Padding(
                                                            padding: EdgeInsets.all(8.0),
                                                            child: Container(
                                                                decoration: BoxDecoration(
                                                                  color: Colors.grey,
                                                                  borderRadius: new BorderRadius.circular(10.0),
                                                                ),
                                                                child: Padding(
                                                                    padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                                                                    child: TextFormField(
                                                                        decoration: InputDecoration(
                                                                          border: InputBorder.none,
                                                                          labelText: 'Quantité',
                                                                        ))))

                                                        ),
                                                        Padding(
                                                            padding: EdgeInsets.all(8.0),
                                                            child: Container(
                                                                decoration: BoxDecoration(
                                                                  color: Colors.grey,
                                                                  borderRadius: new BorderRadius.circular(10.0),
                                                                ),
                                                                child: Padding(
                                                                    padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                                                                    child: DropdownButtonFormField<String>(items: [
                                                                      DropdownMenuItem<String>(
                                                                        child: Text('Item 1'),
                                                                        value: 'one',
                                                                      ),
                                                                      DropdownMenuItem<String>(
                                                                        child: Text('Item 2'),
                                                                        value: 'two',
                                                                      ),
                                                                      DropdownMenuItem<String>(
                                                                        child: Text('Item 3'),
                                                                        value: 'three',
                                                                      ),
                                                                    ],
                                                                      onChanged: (String? value) {
                                                                        setState(() {

                                                                        });
                                                                      },
                                                                      hint: Text('Categorie'),
                                                                      value: null,
                                                                    ),)
                                                                )
                                                        ),



                                                    TextButton.icon(onPressed: (){  if (_formKey.currentState!.validate()) {
                                                      _formKey.currentState!.save();
                                                    }}
                                                        , icon: Icon(Icons.check), label: Text("Valider")),


                                                  ],
                                                )
                                            )
                                                ]
                                        ),

)
                                        )
                                      ],
                                    ),


                                  );
                                });
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
                ]
            )
              )
            )
          ],
        ),
      ),
    );
  }
}
