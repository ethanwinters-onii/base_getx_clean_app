import 'package:dartz/dartz.dart';
import 'package:getx_clean_architecture/core/base/snackbar.dart';
import 'package:getx_clean_architecture/core/errors/failures.dart';
import 'package:getx_clean_architecture/core/values/enums/status.dart';
import 'package:get/get.dart';

class BaseController extends GetxController {
  Rx<Status> status = Status.loading.obs;

  @override
  void onInit() {
    super.onInit();
    initialData();
  }

  Future<void> initialData() async {
    await fetchData();
  }

  Future<void> fetchData() async {}

  void setStatus(Status s) {
    status.value = s;
  }

  Status getStatus() => status.value;

  void showErrorMessage(String title, String message) async {
    setStatus(Status.error);
    return SnackBar.show(
      title: title,
      message: message,
    );
  }

  void processUsecaseResult<T>({
    required Either<Failure, T> result,
    Function(T)? onSuccess,
    Function(Failure)? onFail,
    bool? shouldShowError,
  }) {
    result.fold((error) {
      setStatus(Status.success);
      if (shouldShowError ?? true) {
        showErrorMessage(
          '[ERROR]',
          '${error.statusCode} ${error.message}',
        );
      }
      if (onFail != null) {
        onFail(error);
      }
    }, (data) {
      setStatus(Status.success);
      if (onSuccess != null) {
        onSuccess(data);
      }
    });
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
