import '../../domain/entities/cat.dart';

abstract class CatState {}
abstract class CatLoad extends CatState {}

class CatInitial extends CatState {}

class CatLoading extends CatLoad {}
class CatChanged extends CatState {}

class CatLoaded extends CatLoad {
  final List cats;

  CatLoaded({required this.cats});
}

class CatError extends CatLoad {
  final String message;

  CatError({required this.message});
}
