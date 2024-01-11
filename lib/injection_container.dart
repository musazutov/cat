import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'features/cat/data/datasources/cat_remote_data_source.dart';
import 'features/cat/data/repositories/cat_repository_impl.dart';
import 'features/cat/domain/repositories/cat_repository.dart';
import 'features/cat/domain/usecases/cat.dart';
import 'features/cat/presentation/bloc/cat_cubit.dart';

final sl = GetIt.instance;
 Future<void> initDI() async {
  /// Bloc
  sl.registerFactory(() => CatCubit(sl()));

  /// Use cases
  sl.registerLazySingleton(() => CatUseCase(sl()));

  /// Repository
  sl.registerLazySingleton<CatRepository>(
    () => CatRepositoryImpl(remoteDataSource: sl()),
  );

  /// Data sources
  sl.registerLazySingleton<CatRemoteDataSource>(
    () => CatRemoteDataSourceImpl(client: sl()),
  );
//dev 52 message
  /// Core
  sl.registerLazySingleton(() =>
      Dio(BaseOptions(baseUrl: 'https://cat-fact.herokuapp.com')));
}
