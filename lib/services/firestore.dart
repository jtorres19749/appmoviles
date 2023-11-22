import 'package:cloud_firestore/cloud_firestore.dart';
// tomado de https://www.youtube.com/watch?v=iQOvD0y-xnw

class FirestoreService {
  final CollectionReference notes =  FirebaseFirestore.instance.collection('notes');

  // agregar
  Future<void> addNote (String note) {

    return notes.add ({
      "nota": note,
      "timestamp": Timestamp.now()
    });
  }

  //leer
  Stream<QuerySnapshot> getNotesStream(){
    final notesStream = notes.orderBy ('timestamp', descending: true).snapshots();
    return notesStream;
  }

  //actualizar
  Future<void> updateNote(String docId, String newNote) {
    return notes.doc(docId).update(
      {
        "nota": newNote,
        "timestamp" : Timestamp.now()
      }
    );
  }


  //borrar
  Future<void> deleteNote(String docId) {
    return notes.doc(docId).delete();
  }

}