// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contractor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContractorModel _$ContractorModelFromJson(Map<String, dynamic> json) {
  return ContractorModel()
    ..name = json['name'] as String?
    ..workingAddress = json['workingAddress'] as String?
    ..statusVat = json['statusVat'] as String?
    ..krs = json['krs'] as String?
    ..accountNumbers = (json['accountNumbers'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList()
    ..nip = json['nip'] as String?
    ..residenceAddress = json['residenceAddress'] as String?;
}

Map<String, dynamic> _$ContractorModelToJson(ContractorModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'workingAddress': instance.workingAddress,
      'statusVat': instance.statusVat,
      'krs': instance.krs,
      'accountNumbers': instance.accountNumbers,
      'nip': instance.nip,
      'residenceAddress': instance.residenceAddress,
    };
