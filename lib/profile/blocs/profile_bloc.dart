import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_2/profile/blocs/events_states/profile_event.dart';
import 'package:training_2/profile/blocs/events_states/profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileUninitialized()) {
    on(_onUpdateLabel);
    on(_onInputData);
  }

  void _onUpdateLabel(ProfileUpdateLabel event, Emitter<ProfileState> emit) {
    String label = event.label;

    emit(ProfileUpdateLabelSuccess(label: label));
  }

  void _onInputData(ProfileInputData event, Emitter<ProfileState> emit) {
    emit(ProfileInputDataSuccess(data: event.data));
  }
}
