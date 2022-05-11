import 'package:kdlwms/domain/model/note.dart';
import 'package:kdlwms/domain/repository/note_repository.dart';

class AddNoteUseCase {
  final NoteRepository repository;

  AddNoteUseCase(this.repository);

  Future<void> call(Note note) async {
    await repository.insertNote(note);
  }
}