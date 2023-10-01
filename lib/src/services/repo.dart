import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/datamodels.dart';

class DioClient {
  static const baseUrl =
      "https://api.github.com/search/repositories?q=created:>2022-04-29&sort=stars&order=desc";
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
    ),
  );
  final Options options = Options(
    followRedirects: false,
    validateStatus: (status) {
      return status! < 500;
    },
  );
  errorMessage(e) {
    if (e.response != null) {
      debugPrint('Dio error!');
      debugPrint('STATUS: ${e.response?.statusCode}');
      debugPrint('DATA: ${e.response?.data}');
      debugPrint('HEADERS: ${e.response?.headers}');
    } else {
      debugPrint('Error sending request!');
      debugPrint(e.message);
    }
  }

  ///GetUserDetail =============>>>>>>>>>>>>>
  ///@Authour : Karthikeyan
  ///@function: GetUserDetail dynamic Data Link =>
  ///
  Future<DataModel> getUserDetail() async {
    var url = baseUrl;
    _dio.options.headers["content-Type"] = "application/json";

    try {
      debugPrint("url");
      debugPrint(url);
      Response response = await _dio.get(url);
      if (response.statusCode == 200) {
        debugPrint("response");
        var data = response.data;
        print(data);
        return DataModel.fromJson(data);
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioException catch (e) {
      errorMessage(e);
      throw Exception(e.message);
    }
  }
}

final dataProvider = Provider<DioClient>((ref) => DioClient());
