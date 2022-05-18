import 'package:kdlwms/domain/model/pallet.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pallet_events.freezed.dart';

@freezed
abstract class PalletEvent with _$PalletEvent {

  const factory PalletEvent.listPallets(String sWorkShop, String sLocation, int nState) = ListPallets;
  const factory PalletEvent.getPalletBySeq(int palletSeq) = GetPalletBySeq;

  const factory PalletEvent.addPallet(String sQRData) = AddPallet;
  const factory PalletEvent.updatePallet(List<Pallet> pallets) = UpdatePallet;
  const factory PalletEvent.updatePalletState(List<Pallet> pallets) = UpdatePalletState;
  const factory PalletEvent.deletePallet(List<Pallet> pallets) = DeletePallet;
  const factory PalletEvent.deletePalletAll() = DeletePalletAll;

  const factory PalletEvent.getPalletCountInDevice()= GetPalletCountInDevice;

  const factory PalletEvent.scanQRData(String sQRData) = ScanQRData;

}
