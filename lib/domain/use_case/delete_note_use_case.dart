import 'package:kdlwms/domain/model/note.dart';
import 'package:kdlwms/domain/repository/note_repository.dart';

class DeleteNoteUseCase {
  final NoteRepository repository;

  DeleteNoteUseCase(this.repository);

  Future<void> call(Note note) async {
    await repository.deleteNote(note);
  }
}