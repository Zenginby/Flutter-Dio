import 'package:flutter/material.dart';
import 'package:flutter_dio_test/product/project_dio.dart';
import 'package:flutter_dio_test/reqrest_resource/model/resource_model.dart';
import 'package:flutter_dio_test/reqrest_resource/service/reqres_service.dart';

import '../view/req_res_view.dart';

abstract class ReqresViewModel extends State<ReqresView> with ProjectDioMixin {
  late final IReqresService reqresService;
  bool isLoading = false;
  List<Data> resources = [];

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  void initState() {
    super.initState();
    reqresService = ReqresService(dio: service, service);
    _fecth();
  }

  Future<void> _fecth() async {
    changeLoading();
    resources = (await reqresService.fechResourceItem())?.data ?? [] ;
    changeLoading();
  }
}
