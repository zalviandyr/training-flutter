import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_2/profile/blocs/events_states/profile_event.dart';
import 'package:training_2/profile/blocs/events_states/profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileUninitialized()) {
    on(_onUpdateLabel);
    on(_onInputData);
  }

  Future<void> _onUpdateLabel(
      ProfileUpdateLabel event, Emitter<ProfileState> emit) async {
    try {
      String label = event.label;

      emit(ProfileLoading());

      await Future.delayed(Duration(seconds: 3));

      emit(ProfileUpdateLabelSuccess(label: label));
    } catch (e) {
      emit(ProfileError());
    }
  }

  void _onInputData(ProfileInputData event, Emitter<ProfileState> emit) {
    emit(ProfileInputDataSuccess(data: event.data));
  }
}
