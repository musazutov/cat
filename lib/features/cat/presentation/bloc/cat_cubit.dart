import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/failures.dart';
import '../../domain/usecases/cat.dart';
import 'cat_state.dart';

class CatCubit extends Cubit<CatState> {
  CatCubit(this.getCatUseCase) : super(CatInitial());
  final CatUseCase getCatUseCase;

  Future<void> getCat() async {
     emit(CatLoading());
    debugPrint('get rpoute info called in cubit');
    final result = await getCatUseCase( );
    emit(result.fold(
        (failure) => CatError(message: _mapFailureToMessage(failure)),
        (cat) => CatLoaded(cats: cat)));
    debugPrint('can u believe that it is ready so far');
  }

  String _mapFailureToMessage(Failure failure) {
    if (failure is ServerFailure) {
      return failure.message;
    } else if (failure is JsonParseFailure) {
      return failure.message;
    } else {
      return 'Unexpected situation';
    }
  }

  void nextCat() {
    emit(CatChanged());
  }
}
