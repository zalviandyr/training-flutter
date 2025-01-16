import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:training_2/core/widgets/button.dart';
import 'package:training_2/home/data/input_data.dart';
import 'package:training_2/home/screens/home_detail_screen.dart';
import 'package:training_2/home/widgets/input_text.dart';
import 'package:training_2/profile/blocs/events_states/profile_event.dart';
import 'package:training_2/profile/blocs/events_states/profile_state.dart';
import 'package:training_2/profile/blocs/profile_bloc.dart';
import 'package:training_2/profile/screens/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String path = '/home';
  static const String name = 'home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey();
  late ProfileBloc _profileBloc;

  @override
  void initState() {
    _profileBloc = BlocProvider.of(context);

    super.initState();
  }

  void _submitAction() {
    if (_formKey.currentState!.saveAndValidate()) {
      var value = _formKey.currentState!.value;

      InputData inputData = InputData.fromMap(value);

      _profileBloc.add(ProfileInputData(data: inputData));
    }
  }

  void _toProfile() {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => ProfileScreen()),
    // );

    context.push(ProfileScreen.path);
  }

  void _toDetail() => context.pushNamed(HomeDetailScreen.name);

  void _compareAction() {
    InputData inputData1 = InputData(
      name: 'zukron',
      email: 'zukronalviandy@gmail.com',
      isSwitched: true,
    );

    InputData inputData2 = InputData(
      name: 'zukron',
      email: 'zukronalviandy@gmail.com',
      isSwitched: true,
    );

    print(inputData1.hashCode);
    print(inputData2.hashCode);
    print(inputData1 == inputData2);
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
              InputText(name: 'name'),
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
              Button(onPressed: _submitAction, label: 'Submit'),
              SizedBox(height: 50),

              BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  if (state is ProfileInputDataSuccess) {
                    return Column(
                      children: [
                        Text(
                          "Nama saya ${state.data.name}",
                        ),
                        Text(
                          "Email saya ${state.data.email}",
                        ),
                        if (state.data.isSwitched) Text('Switch Hidup'),
                      ],
                    );
                  }

                  return SizedBox.shrink();
                },
              ),

              SizedBox(height: 100),
              Button(onPressed: _toProfile, label: 'Profile Screen'),
              SizedBox(height: 50),
              Button(onPressed: _toDetail, label: 'Home Detail Screen'),
              SizedBox(height: 50),
              Button(onPressed: _compareAction, label: 'Komparasi'),
              // IconButton(
              //   onPressed: () async {
              //     FilePickerResult? result =
              //         await FilePicker.platform.pickFiles();

              //     print(result?.names);
              //   },
              //   icon: Icon(Icons.upload),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
