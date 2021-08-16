import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:onepack/Components/header.dart';
import 'package:onepack/Widgets/popUps.dart';
import 'package:onepack/Components/side_menu.dart';
import 'package:onepack/global/constants.dart';

class CommandeScreen extends StatefulWidget {
  CommandeScreen({Key? key}) : super(key: key);

  @override
  _CommandeScreenState createState() => _CommandeScreenState();
}

class _CommandeScreenState extends State<CommandeScreen> {
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
                    Header(title: 'Demandes de supression de commande'),
                    SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Flexible(
                      child: Container(
                        color: secondaryColor,
                        child: DataTable2(
                          showCheckboxColumn: false,
                          dataTextStyle: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                          ),
                          headingTextStyle: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                          columnSpacing: defaultPadding,
                          minWidth: 600,
                          columns: [
                            DataColumn(
                              label: Text("Référence commande"),
                            ),
                            DataColumn(
                              label: Text("Date"),
                            ),
                            DataColumn(
                              label: Text("Montant (DT)"),
                            ),
                            DataColumn(
                              label: Text("Serveur"),
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
                                  Text('$index'),
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          PopUp.buildPopupDialog(
                                        context,
                                        1,
                                        'Details de la commande',
                                        'liste des produits',
                                      ),
                                    );
                                  },
                                ),
                                DataCell(Text('AF,fgbh')),
                                DataCell(Text('AF,fgbh')),
                                DataCell(Text('Sucre')),
                                DataCell(
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 40,
                                        width: 40,
                                        child: TextButton(
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) =>
                                                  buildCommandePopupDialog(
                                                context,
                                                'Choisir Votre action',
                                              ),
                                            );
                                          },
                                          child: Icon(
                                            Icons.check_circle,
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
                                              builder: (BuildContext context) =>
                                                  PopUp.buildDoublePopupDialog(
                                                context,
                                                'Confirmer votre action',
                                                'Voulez-vous vraiment rejeter la demande de supression?',
                                                'Succés',
                                                'demande rejetée',
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
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  static Widget buildCommandePopupDialog(
    BuildContext context,
    String title1,
  ) {
    return AlertDialog(
      title: Text(title1),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextButton.icon(
            label: Text('Supression avec modification de stock'),
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
            label: Text('Supression sans modification de stock'),
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
}
