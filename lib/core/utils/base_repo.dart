import 'package:dartz/dartz.dart';
import 'package:fruits_app/core/errors/failures.dart';

abstract class BaseRepository {
  Future<Either<Failure, T>> execute<T>(Future<T> Function() action) async {
    try {
      final result = await action();
      return Right(result);
    } catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }
}
