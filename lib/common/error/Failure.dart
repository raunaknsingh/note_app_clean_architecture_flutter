import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final int? errorCode;
  final String errorMessage;

  const Failure({this.errorCode, required this.errorMessage});

  @override
  List<Object?> get props => [errorCode, errorMessage];
}

// class ServerFailure extends Failure {
//   final String errorMessage;
//
//   const ServerFailure({required this.errorMessage});
//   @override
//   List<Object?> get props => [errorMessage];
// }
//
// class Cachefailure extends Failure {
//   final String errorMessage;
//
//   const Cachefailure({required this.errorMessage});
//   @override
//   List<Object?> get props => [errorMessage];
// }
//
// class GeneralFailure extends Failure {
//   final String errorMessage;
//
//   const GeneralFailure({required this.errorMessage});
//   @override
//   List<Object?> get props => [errorMessage];
// }
