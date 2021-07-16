import 'package:json_annotation/json_annotation.dart';

part 'contractor_model.g.dart';

@JsonSerializable()
class ContractorModel {
  String? name;
  String? workingAddress;
  String? statusVat;
  String? krs;
  List<String>? accountNumbers;
  String? nip;
  String? residenceAddress;

  ContractorModel();

  factory ContractorModel.fromJson(Map<String, dynamic> json) =>
      _$ContractorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ContractorModelToJson(this);

  String get accountNumbersString {
    String accountNumbersString = '';
    if (this.accountNumbers != null && this.accountNumbers!.isNotEmpty) {
      accountNumbersString = this.accountNumbers!.join('\n ');
    }
    return accountNumbersString;
  }
}
