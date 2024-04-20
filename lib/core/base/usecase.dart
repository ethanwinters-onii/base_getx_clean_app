import 'package:getx_clean_architecture/core/utils/typedef/typedef.dart';

abstract class UseCase<Type, Param> {
  ResultFuture<Type> call({Param param});
}

abstract class DAOUseCase<Type, Param> {
  Future<Type> call({Param param});
}
