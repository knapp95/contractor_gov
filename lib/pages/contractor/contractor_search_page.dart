import 'package:contractor_gov/factory/field_builder_factory.dart';
import 'package:contractor_gov/models/contractor/contractor_model.dart';
import 'package:contractor_gov/models/gov/gov_model.dart';
import 'package:contractor_gov/pages/contractor/localWidgets/contractor_details.dart';
import 'package:contractor_gov/pages/contractor/localWidgets/contractor_empty_search.dart';
import 'package:contractor_gov/services/gov_service.dart';
import 'package:contractor_gov/utils/scripts.dart';
import 'package:flutter/material.dart';

class ContractorSearchPage extends StatefulWidget {
  const ContractorSearchPage({Key? key}) : super(key: key);

  @override
  _ContractorSearchPageState createState() => _ContractorSearchPageState();
}

class _ContractorSearchPageState extends State<ContractorSearchPage> {
  final FieldBuilderFactory _formFactory = FieldBuilderFactory();
  ContractorModel? _resultContractor;
  final GovService _govService = GovService();
  final GovModel _govModel = GovModel();
  DateTime _selectedDate = DateTime.now();
  String? _insertValue;

  void _changeSelectedTypeField(value) {
    setState(() {
      _govModel.selectedTypeField = value;
    });
  }

  void _changeInsertValue(value) {
    setState(() {
      _insertValue = value;
    });
  }

  void _changeSelectedDate(value) {
    setState(() {
      _selectedDate = value;
    });
  }

  void _searchContractor() async {
    if (FocusScope.of(context).isFirstFocus) {
      FocusScope.of(context).requestFocus(new FocusNode());
    }
    if (_insertValue == null) return;
    final value = _govModel.prepareValue(_insertValue!);
    final type = _govModel.typeString;
    final date = formatDate(_selectedDate);
    ContractorModel? contractor = await _govService.searchContractor(
      context,
      type: type,
      value: value,
      date: date,
    );
    setState(() {
      _resultContractor = contractor;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(_resultContractor);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: _resultContractor != null
              ? MainAxisAlignment.start
              : MainAxisAlignment.spaceBetween,
          children: [
            Container(
              color: Colors.red.withOpacity(0.8),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    _formFactory.buildTextField(
                      labelText: 'Wprowadź wartość',
                      onChangeHandler: _changeInsertValue,
                    ),
                    _formFactory.buildDropdownField(
                      initialValue: _govModel.selectedTypeField,
                      labelText: 'Wybierz typ pola',
                      items: _govModel.availableTypesField,
                      onChangedHandler: _changeSelectedTypeField,
                    ),
                    _formFactory.buildDateField(
                      initialValue: _selectedDate,
                      labelText: 'Dla dnia',
                      onChangedHandler: _changeSelectedDate,
                    ),
                    Visibility(
                      visible: _insertValue != null && _insertValue != '',
                      child: TextButton(
                        onPressed: _searchContractor,
                        child: Text(
                          'Wyszukaj',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _resultContractor != null
                ? Expanded(child: ContractorDetails(_resultContractor!))
                : ContractorEmptySearch()
          ],
        ),
      ),
    );
  }
}
