import 'package:flutter/material.dart';

enum DataState { idle, loading, error, success }

class DataStateModel<T> {
  //generic <T>
  DataState status = DataState.idle;
  T? data;
  String? message;

  DataStateModel();

  isLoading() => status == DataState.loading;

  isSuccess() => status == DataState.success;

  isError() => status == DataState.error;

  isIdle() => status == DataState.idle;

  loading() => status = DataState.loading;
  error(String message) {
    status = DataState.error;
    this.message = message;
  }
  success(T? data, String message) {
    status = DataState.success;
    this.message = message;
    this.data = data;
  }
  idle() {
    status = DataState.idle;
    message = "";
    data = null;
  }
}

Widget dataStateBuilder<T>(BuildContext context, {
  required DataStateModel dataStateModel,
  required Function(T?, String?) onSuccess,
  Widget? onLoading,
  Widget? onEmpty,
  Function(String?)? onError,
  Function(DataState)? onStatusListener,
}) {
  if (dataStateModel.status == DataState.loading) {
    if (onLoading != null) return onLoading;

    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  } else if (dataStateModel.status == DataState.success) {
    // untuk yang list
    if (dataStateModel.data is List) {
      List data = dataStateModel.data as List;

      if (data.isEmpty) {
        if (onEmpty != null) return onEmpty;

        return const Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(
            child: Text("Data Kosong"),
          ),
        );
      }
    }

    return onSuccess(dataStateModel.data, dataStateModel.message);
  }else if (dataStateModel.status == DataState.error) {
    if (onError != null) return onError(dataStateModel.message);
    // jika error maka tampilkan pesan error
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Text(dataStateModel.message ?? "Terjadi Kesalahan"),
      ),
    );
  }else{
    return Container();
  }
}


