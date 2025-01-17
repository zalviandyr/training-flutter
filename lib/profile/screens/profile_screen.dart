import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:go_router/go_router.dart';
import 'package:training_2/core/widgets/button.dart';
import 'package:training_2/profile/blocs/events_states/profile_event.dart';
import 'package:training_2/profile/blocs/events_states/profile_state.dart';
import 'package:training_2/profile/blocs/profile_bloc.dart';

class ProfileScreen extends StatefulWidget {
  static const String path = '/profile';
  static const String name = 'profile';

  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late ProfileBloc _profileBloc;

  @override
  void initState() {
    _profileBloc = BlocProvider.of(context);

    super.initState();
  }

  void _backAction() {
    context.pop();
  }

  void _profileListener(BuildContext context, ProfileState state) {
    if (state is ProfileLoading) {
      SmartDialog.showLoading();
    }

    if (state is ProfileUpdateLabelSuccess) {
      SmartDialog.dismiss();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileState>(
      listener: _profileListener,
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  if (state is ProfileUpdateLabelSuccess) {
                    return Text(state.label);
                  }

                  if (state is ProfileError) {
                    return Text('Error nih');
                  }

                  return Text('Profile Screen');
                },
              ),
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
              SizedBox(height: 50),
              Button(onPressed: _backAction, label: 'Kembali'),
              SizedBox(height: 50),
              Button(
                onPressed: () {
                  _profileBloc.add(ProfileUpdateLabel(label: 'Keubah nih'));
                },
                label: 'Update State',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
