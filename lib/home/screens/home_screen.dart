import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:training_2/home/data/input_data.dart';
import 'package:training_2/home/screens/home_detail_screen.dart';
import 'package:training_2/home/widgets/input_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey();
  InputData? _inputData;

  void _submitAction() {
    if (_formKey.currentState!.saveAndValidate()) {
      var value = _formKey.currentState!.value;

      _inputData = InputData.fromMap(value);
      // _inputData?.printData();
      // _inputData?._printData2();

      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(50),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              InputText(
                name: 'name',
              ),
              InputText(
                name: 'first_name',
              ),
              InputText(
                name: 'last_name',
              ),
              FormBuilderTextField(
                name: 'email',
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.email(),
                ]),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Input Email',
                  suffixIcon: Icon(Icons.edit),
                  prefixIcon: Icon(Icons.access_time),
                ),
              ),
              FormBuilderSwitch(
                  name: 'isSwitched',
                  title: Text(
                    'Switch',
                  )),
              SizedBox(height: 50),
              MaterialButton(
                color: Colors.red,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                onPressed: _submitAction,
                child: Text('Material button'),
              ),
              SizedBox(height: 50),
              if (_inputData != null)
                Column(
                  children: [
                    Text(
                      "Nama saya ${_inputData?.name}",
                    ),
                    Text(
                      "Email saya ${_inputData?.email}",
                    ),
                    if (_inputData?.isSwitched ?? false) Text('Switch Hidup'),
                  ],
                ),
              SizedBox(height: 50),
              IconButton(
                onPressed: () async {
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles();

                  print(result?.names);
                },
                icon: Icon(Icons.upload),
              ),
              ElevatedButton(
                onPressed: () {
                  // context.push('/home/detail');
                  context.goNamed('home.detail');
                },
                child: Text('Detail'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
