import 'package:kdlwms/domain/model/pallet.dart';
import 'package:kdlwms/domain/repository/pallet_repository.dart';

class GetPalletCountInDevice {
  final PalletRepository repository;

  GetPalletCountInDevice(this.repository);

  // 값조회 -> 있으면 삭제 -> 등록
  Future<int> call() async {
    return await repository.getPalletCountInDevice();
  }
}
