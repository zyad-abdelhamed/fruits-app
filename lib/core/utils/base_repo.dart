import 'package:dartz/dartz.dart';
import 'package:fruits_app/core/errors/failures.dart';

abstract class BaseRepository {
  Future<Either<Failure, T>> execute<T>(Future<T> Function() action) async {
    try {
      final result = await action();
      return Right(result);
    } catch (e) {
      print(e);
      return Left(ServerFailure.fromException(e));
    }
  }

  /// 🔥 HANDLE STATUS FALSE
  void throwIfStatusFalse(dynamic responseData) {
    if (responseData is Map && responseData['status'] == false) {
      throw Exception(
        responseData['error_message_en'] ??
            responseData['error_message'] ??
            'Request failed',
      );
    }
  }
}
