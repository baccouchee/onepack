import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:onepack/Components/header.dart';
import 'package:onepack/Widgets/popUps.dart';
import 'package:onepack/Components/side_menu.dart';
import 'package:onepack/global/constants.dart';

class FournisseurScreen extends StatefulWidget {
  const FournisseurScreen({Key? key}) : super(key: key);

  @override
  _FournisseurScreenState createState() => _FournisseurScreenState();
}

class _FournisseurScreenState extends State<FournisseurScreen> {
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
                    Header(title: 'Gestion Des fournisseur'),
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
                                label: Text("Prénom"),
                              ),
                              DataColumn(
                                label: Text("Adresse"),
                              ),
                              DataColumn(
                                label: Text("Téléphone"),
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
                                            onPressed: () {
                                              showDialog(
                                                context: context,
                                                builder: (BuildContext
                                                        context) =>
                                                    buildPopupDialogFormFournisseur(
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
                            textStyle: const TextStyle(fontSize: 17),
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  buildPopupDialogFormFournisseur(
                                context,
                                'Ajouter',
                              ),
                            );
                          },
                          child: Text(
                            'Ajouter un Fournisseur',
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

  static Widget buildPopupDialogFormFournisseur(
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
                    labelText: 'Nom',
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Prénom',
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Adresse',
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Téléphone',
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
