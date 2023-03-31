import 'package:dartz/dartz.dart';
 import '../../../../core/failures.dart';
import '../entities/cat.dart';
import '../repositories/cat_repository.dart';

class CatUseCase {
  final CatRepository repository;

  CatUseCase(this.repository);

  Future<Either<Failure, List>> call( ) async {
    return await repository.getCat( );
  }
}

