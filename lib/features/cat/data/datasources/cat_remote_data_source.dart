import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
  import 'package:flutter/material.dart';
import '../../../../core/failures.dart';
import '../../domain/entities/cat.dart';
import '../models/cat_model.dart';

abstract class CatRemoteDataSource {
  Future<Either<Failure, List>> getCat( );
}

class CatRemoteDataSourceImpl implements CatRemoteDataSource {
  final Dio client;

  CatRemoteDataSourceImpl({required this.client});

  Future<Either<Failure, List>> _getCat(
      ) async {
    try {
      debugPrint('request is going');
      final response = await client.get('/facts');
      debugPrint('response  is ready: ${response.data}');

      var cats=response.data != null
          ? (response.data as List).map((e) => CatModel.fromJson(e)).toList()
          : [];

      return Right(cats);
    } on DioError catch (error) {
      return Left(ServerFailure(error));
    } catch (e) {
      return Left(JsonParseFailure());
    }
  }

  @override
  Future<Either<Failure, List>> getCat( ) =>
      _getCat( );


}
