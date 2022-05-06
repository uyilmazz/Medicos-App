import 'package:json_annotation/json_annotation.dart';
import '../../home/model/medicine_model.dart';

part 'pharmacy.g.dart';

@JsonSerializable()
class Pharmacy extends MedicineModel {
  @JsonKey(name: '_id')
  String? sId;
  String? name;
  String? imageUrl;

  Pharmacy({this.sId, this.name, this.imageUrl});

  factory Pharmacy.fromJson(Map<String, dynamic> json) =>
      _$PharmacyFromJson(json);

  Map<String, dynamic> toJson() => _$PharmacyToJson(this);
}
