import 'package:equatable/equatable.dart';
import 'package:training_2/home/data/input_data.dart';

abstract class ProfileState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProfileUninitialized extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileError extends ProfileState {}

class ProfileUpdateLabelSuccess extends ProfileState {
  final String label;

  ProfileUpdateLabelSuccess({required this.label});

  @override
  List<Object?> get props => [label];
}

class ProfileInputDataSuccess extends ProfileState {
  final InputData data;

  ProfileInputDataSuccess({required this.data});

  @override
  List<Object?> get props => [data];
}
