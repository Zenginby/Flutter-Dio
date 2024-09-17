

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_dio_test/dummyjson_resource/model/product_model.dart';

abstract class IDummyjsonService{
  IDummyjsonService({required this.dio});
  final Dio dio;

Future <ProductModel?> fechResourceItem();
}

enum _DummyJsonPath{ products }

class DummyjsonService extends IDummyjsonService{
  DummyjsonService(Dio service, {required super.dio});

  @override
  Future<ProductModel?> fechResourceItem() async {
    final response = await dio.get('/${_DummyJsonPath.products.name}');

    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = response.data;
      if (jsonBody is Map<String,dynamic>) {
        return ProductModel.fromJson(jsonBody);
      }

    }
    return null;
  }

}