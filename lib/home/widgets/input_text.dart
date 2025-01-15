import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class InputText extends StatelessWidget {
  final String name;

  const InputText({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: name,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.minLength(5),
      ]),
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Input Nama',
        suffixIcon: Icon(Icons.edit),
        prefixIcon: Icon(Icons.access_time),
      ),
    );
  }
}
