import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:retrofit/dio.dart';
import 'package:getx_clean_architecture/core/errors/failures.dart';

typedef ResultFuture<T> = Future<Either<Failure, T>>;
typedef DioResult<T> = Future<HttpResponse<T>>;