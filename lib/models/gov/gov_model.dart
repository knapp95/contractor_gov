import 'package:contractor_gov/models/generic/generic_item_model.dart';

enum Types { bankAccount, nip, regon }

class GovModel {
  static final GovModel _singleton = GovModel._internal();

  factory GovModel() {
    return _singleton;
  }

  GovModel._internal();

  static GovModel get singleton => _singleton;

  late Types selectedTypeField = availableTypesField.first.id as Types;
  final List<GenericItemModel> availableTypesField = [
    GenericItemModel(Types.bankAccount, 'Numer rachunku bankowego'),
    GenericItemModel(Types.nip, 'Numer NIP'),
    GenericItemModel(Types.regon, 'Numer regon'),
  ];

  String get typeString {
    String typeName;
    switch (this.selectedTypeField) {
      case Types.nip:
        typeName = 'nip';
        break;
      case Types.regon:
        typeName = 'regon';
        break;
      case Types.bankAccount:
        typeName = 'bank-account';
        break;
    }
    return typeName;
  }


  String prepareValue(String value) {
    /// Remove whitespaces from insert bank account
    if (this.selectedTypeField == Types.bankAccount) {
      value = value.replaceAll(new RegExp(r"\s+"), "");
    }
    return value;
  }
}
