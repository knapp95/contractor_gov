import 'package:contractor_gov/factory/field_builder_factory.dart';
import 'package:contractor_gov/models/contractor/contractor_model.dart';
import 'package:flutter/material.dart';

class ContractorDetails extends StatelessWidget {
  final ContractorModel _contractor;
  final FieldBuilderFactory _formFactory = FieldBuilderFactory();

  ContractorDetails(this._contractor);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildField('Kontrahent', _contractor.name),
          Row(
            children: [
              Expanded(child: _buildField('NIP', _contractor.nip)),
              Expanded(child: _buildField('KRS', _contractor.krs)),
            ],
          ),
          _buildField('Konta bankowe', _contractor.accountNumbersString),
          _buildField('Adres firmowy', _contractor.workingAddress),
          _buildField('Adres zamieszkania', _contractor.residenceAddress),
        ],
      ),
    );
  }

  Widget _buildField(String label, String? value) {
    return _formFactory.buildTextField(
      enabled: false,
      labelText: label,
      initialValue: value,
      labelColor: Colors.black,
      valueColor: Colors.black,
    );
  }
}
