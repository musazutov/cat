import 'package:dartz/dartz.dart';
import '../../../../core/failures.dart';
import '../entities/cat.dart';

abstract class CatRepository {
  Future<Either<Failure, List>> getCat(
       );
}
