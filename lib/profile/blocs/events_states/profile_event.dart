import 'package:equatable/equatable.dart';
import 'package:training_2/home/data/input_data.dart';

abstract class ProfileEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProfileUpdateLabel extends ProfileEvent {
  final String label;

  ProfileUpdateLabel({required this.label});

  @override
  List<Object?> get props => [label];
}

class ProfileInputData extends ProfileEvent {
  final InputData data;

  ProfileInputData({required this.data});

  @override
  List<Object?> get props => [data];
}
