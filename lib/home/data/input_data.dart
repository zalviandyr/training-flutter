import 'package:equatable/equatable.dart';

class InputData extends Equatable {
  final String name;
  final String email;
  final bool isSwitched;

  InputData({
    required this.name,
    required this.email,
    required this.isSwitched,
  });

  factory InputData.fromMap(Map<String, dynamic> map) {
    return InputData(
      name: map['name'],
      email: map['email'],
      isSwitched: map['isSwitched'] ?? false,
    );
  }

  @override
  List<Object?> get props => [name, email, isSwitched];

  // void printData() {
  //   print('printed');
  // }

  // void _printData2() {
  //   print('printed 2');
  // }
}
