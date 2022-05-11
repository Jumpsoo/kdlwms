import 'package:kdlwms/domain/model/pallet.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pallet_events.freezed.dart';

@freezed
abstract class PalletEvent with _$PalletEvent {

  const factory PalletEvent.listPallets(String workShop) = ListPallets;
  const factory PalletEvent.getPalletBySeq(int palletSeq) = GetPalletBySeq;

  const factory PalletEvent.addPallet(String sQRData) = AddPallet;
  const factory PalletEvent.updatePallet(Pallet pallet) = UpdatePallet;
  const factory PalletEvent.deletePallet(Pallet pallet) = DeletePallet;

  const factory PalletEvent.scanQRData(String sQRData) = ScanQRData;

}
