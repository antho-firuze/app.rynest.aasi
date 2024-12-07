import 'dart:io';

import 'package:app.rynest.aasi/common/model/reqs.dart';
import 'package:app.rynest.aasi/common/model/resp.dart';
import 'package:app.rynest.aasi/core/app_base.dart';
import 'package:app.rynest.aasi/features/auth/controller/auth_ctrl.dart';
import 'package:app.rynest.aasi/utils/dio_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class JsonrpcService {
  final Ref ref;
  JsonrpcService(this.ref);

  Future<Resp?> call({required Reqs reqs}) async {
    final dio = ref.read(dioApiProvider);
    final url = Uri.parse(AppBase.url).toString();
    String agent = Platform.isAndroid ? 'android' : 'ios';
    String language = "id";
    String? token = ref.read(authTokenProvider);

    dio.options.headers['Content-Type'] = 'application/json; charset=utf-8';

    FormData? formData;
    Map<String, dynamic> payload = {
      'id': 99999,
      'lang': language,
      'agent': agent,
      'method': reqs.method,
      'token': token,
    };
    if (reqs.params != null && reqs.params!.isNotEmpty) {
      payload['params'] = reqs.params;
    }
    if (reqs.filePath != null && reqs.filePath!.isNotEmpty) {
      dio.options.headers['Content-Type'] = 'multipart/form-data';

      payload['userfile'] = await MultipartFile.fromFile(reqs.filePath!);
      formData = FormData.fromMap(payload);
    }

    final state = await AsyncValue.guard(() async => await dio.post(url, data: formData ?? payload));

    final resp = Resp.fromJson(state.value?.data);
    return resp;
  }
}

final jsonRpcProvider = Provider(JsonrpcService.new);
