import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_2/core/widgets/snackbar.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('ada error nih', error: error);

    if (error is HandshakeException) {
      showSnackbar('Kesalahan pada SSL');
    } else if (error is DioException) {
      showSnackbar('Gagal mengambil data');
    } else {
      showSnackbar(error.toString());
    }

    super.onError(bloc, error, stackTrace);
  }
}
