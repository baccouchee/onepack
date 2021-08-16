import 'package:flutter/material.dart';
import 'package:onepack/Models/Note.dart';
import 'package:onepack/Components/header.dart';
import 'package:onepack/Widgets/popUps.dart';
import 'package:onepack/Components/side_menu.dart';
import 'package:onepack/global/constants.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({Key? key}) : super(key: key);

  @override
  _NoteScreenState createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  List<Note> _notes = [];

  var _contenuTextFieldController = TextEditingController();

  _onSubmit() async {
    setState(() {
      _notes.add(
        Note(
          contenu: _contenuTextFieldController.text,
        ),
      );
    });
    if (Navigator.of(context).canPop()) Navigator.of(context).pop();
    _contenuTextFieldController.text = '';
  }

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
                    Header(title: 'Notes Personnels'),
                    SizedBox(
                      height: 40,
                    ),
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.all(8),
                        itemBuilder: (context, index) =>
                            noteWidget(_notes[index]),
                        itemCount: _notes.length,
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
                                  return SimpleDialog(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            TextFormField(
                                              controller:
                                                  _contenuTextFieldController,
                                              maxLines: 8,
                                              minLines: 6,
                                              decoration: const InputDecoration(
                                                labelText: 'Contenu',
                                              ),
                                            ),
                                            ElevatedButton(
                                              style: TextButton.styleFrom(
                                                backgroundColor: primaryColor
                                                    .withOpacity(0.9),
                                                primary: primaryColor,
                                                textStyle: const TextStyle(
                                                    fontSize: 17),
                                              ),
                                              child: Text(
                                                "Ajouter",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              onPressed: () => _onSubmit(),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                });
                          },
                          child: Text(
                            'Ajouter note',
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

  Widget noteWidget(Note note) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => PopUp.buildPopupDialog(
                    context,
                    2,
                    'Confirmer votre action',
                    'Voulez-vous vraiment supprimer cette note?',
                  ),
                );
              },
              child: Icon(
                Icons.cancel,
                color: Colors.red,
              ),
            ),
          ],
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: secondaryColor,
            border: Border.all(color: primaryColor),
          ),
          child: Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Text('${note.contenu}'),
          ),
        ),
      ],
    );
  }
}
