import 'package:contractor_gov/models/generic/generic_item_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FieldBuilderFactory {
  static final FieldBuilderFactory _singleton = FieldBuilderFactory._internal();

  factory FieldBuilderFactory() {
    return _singleton;
  }

  FieldBuilderFactory._internal();

  static FieldBuilderFactory get singleton => _singleton;

  Widget buildTextField({
    bool enabled = true,
    String? labelText,
    Color valueColor = Colors.white,
    Color labelColor = Colors.white,
    Function? onChangeHandler,
    dynamic initialValue,
  }) {
    return FormBuilderTextField(
      name: 'field',
      enabled: enabled,
      keyboardType: TextInputType.number,
      style: TextStyle(
        color: valueColor,
      ),
      initialValue: initialValue,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
          color: labelColor,
        ),
      ),
      onChanged: (value) =>
          onChangeHandler != null ? onChangeHandler(value) : () {},
    );
  }

  Widget buildDateField({
    bool enabled = true,
    String? labelText,
    Function? onChangedHandler,
    DateTime? initialValue,
  }) {
    return FormBuilderDateTimePicker(
      name: 'field',
      enabled: enabled,
      keyboardType: TextInputType.number,
      style: TextStyle(
        color: Colors.white,
      ),
      inputType: InputType.date,
      initialValue: initialValue,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
          color: Colors.white,
        ),
      ),
      onChanged: (value) =>
      onChangedHandler != null ? onChangedHandler(value) : () {},
    );
  }

  Widget buildDropdownField({
    String? labelText,
    List<GenericItemModel>? items,
    dynamic initialValue,
    Function? onChangedHandler,
  }) {
    return FormBuilderDropdown(
      name: labelText!,
      decoration: InputDecoration(
        border: InputBorder.none,
        labelText: labelText,
        labelStyle: TextStyle(
          color: Colors.white,
        ),
      ),
      items: items!
          .map((GenericItemModel item) => DropdownMenuItem(
                child: Text(
                  item.name,
                  style: TextStyle(color: Colors.white),
                ),
                value: item.id,
              ))
          .toList(),
      onChanged: (value) =>
          onChangedHandler != null ? onChangedHandler(value) : () {},
      dropdownColor: Colors.red.withOpacity(0.8),
      initialValue: initialValue,
    );
  }
}
