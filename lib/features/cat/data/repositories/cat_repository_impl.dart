import 'package:dartz/dartz.dart';
import '../../../../core/failures.dart';
import '../../domain/entities/cat.dart';
import '../../domain/repositories/cat_repository.dart';
import '../datasources/cat_remote_data_source.dart';

class CatRepositoryImpl implements CatRepository {
  final CatRemoteDataSource remoteDataSource;

  CatRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List>> getCat(
       ) async {
    return await remoteDataSource.getCat( );
  }
}
