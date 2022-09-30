import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final int? errorCode;
  final String errorMessage;

  const Failure({this.errorCode, required this.errorMessage});

  @override
  List<Object?> get props => [errorCode, errorMessage];
}
