import 'package:json_annotation/json_annotation.dart';
import '../../home/model/medicine_model.dart';

part 'pharmacy.g.dart';

@JsonSerializable()
class Pharmacy extends MedicineModel {
  final String? name;
  final String? imageUrl;

  Pharmacy(this.name, this.imageUrl);

  static List<Pharmacy> getFakePharmacyList() {
    return [
      Pharmacy('Injection', 'Injection'),
      Pharmacy('Bandages', 'Bandages'),
      Pharmacy('Equipment', 'Equipment'),
      Pharmacy('Medicines', 'Medicines'),
    ];
  }

  factory Pharmacy.fromJson(Map<String, dynamic> json) =>
      _$PharmacyFromJson(json);
}
