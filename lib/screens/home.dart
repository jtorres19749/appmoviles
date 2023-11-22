import 'package:act3_7/services/firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:act3_7/widgets/app_logo.dart';
import 'package:act3_7/widgets/app_button.dart';
import 'package:act3_7/widgets/app_textfield.dart';


class Home extends StatefulWidget {
  const Home({super.key});
  static const String routeName = '/Home';
  
  @override
  State<Home> createState() => _HomeState();

}

class _HomeState extends State<Home> {
final FirestoreService firestoreService = FirestoreService();
final TextEditingController textController = TextEditingController();

openNoteBox(String? docId) async {
  showDialog(
    context: context, 
    builder: (context)=> AlertDialog(
      content: TextField (controller: textController),
      actions: [
        ElevatedButton(
          onPressed: (){

            if (docId == null) {
              // agrega la nota
              firestoreService.addNote(textController.text);

            } else {
              firestoreService.updateNote(docId, textController.text);

            }
            textController.clear();
            Navigator.pop(context);
          }, 
          child: const Text("Guardar"))
      ],
    )
  );
}

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("UDG Act. 3.7"),), 
      floatingActionButton: FloatingActionButton (
        onPressed: () {openNoteBox(null);},
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: firestoreService.getNotesStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List notesList = snapshot.data!.docs;

            //mostrar
            return ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: notesList.length,
              itemBuilder: (context, index) {
                  DocumentSnapshot document = notesList[index];
                  String docId = document.id;

                  Map<String, dynamic> data = document.data() as Map<String, dynamic>;
                  String noteText = data["nota"];

                  return ListTile (
                    title: Text(noteText),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        //actualizar
                        IconButton(
                          onPressed: () => {
                            openNoteBox(docId)
                          },
                          icon: const Icon(Icons.settings),
                        ),

                        //borrar
                        IconButton(
                          onPressed: () => firestoreService.deleteNote(docId),
                          icon: const Icon(Icons.delete),
                        ),
                    ],)

                      
                  );
                }, 
            );
          } else {
            return const Text("No hay notas!");
          }
          
        },
      ),
    );
  }
}

