

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_dio_test/reqrest_resource/model/resource_model.dart';

abstract class IReqresService{
  IReqresService({required this.dio});
  final Dio dio;

Future <ResourceModel?> fechResourceItem();
}

enum _ReqResPath{ resource }

class ReqresService extends IReqresService{
  ReqresService(Dio service, {required super.dio});

  @override
  Future<ResourceModel?> fechResourceItem() async {
    final response = await dio.get('/${_ReqResPath.resource.name}');

    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = response.data;
      if (jsonBody is Map<String,dynamic>) {
        return ResourceModel.fromJson(jsonBody);
      }

    }
    return null;
  }

}