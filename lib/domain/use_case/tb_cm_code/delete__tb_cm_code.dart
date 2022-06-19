import 'package:kdlwms/data/data_source/result.dart';
import 'package:kdlwms/domain/model/tb_wh_cm_code.dart';
import 'package:kdlwms/domain/repository/tb_wh_cm_code_repo.dart';

class DeleteTbWhCmCode{
  final TbWhCmCodeRepo repository;

  DeleteTbWhCmCode(this.repository);

  Future<Result<bool?>> call (TbWhCmCode tbWhCmCode) async {
    return await repository.deleteTbWhCmCode(tbWhCmCode);
  }
}

class DeleteTbWhCmCodeAll{
  final TbWhCmCodeRepo repository;

  DeleteTbWhCmCodeAll(this.repository);

  Future<Result<bool?>> call () async {
    return await repository.deleteTbWhCmCodeAll();
  }
}



