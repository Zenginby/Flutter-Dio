import 'package:flutter/material.dart';
import 'package:flutter_dio_test/dummyjson_resource/model/product_model.dart';
import 'package:flutter_dio_test/dummyjson_resource/service/dummyjson_service.dart';
import 'package:flutter_dio_test/dummyjson_resource/view/dummyjson_view.dart';
import 'package:flutter_dio_test/product/project_dio.dart';


abstract class DummyjsonViewModel extends State<DummyjsonView> with ProjectDioMixin {
  late final IDummyjsonService dummyjsonService;
  bool isLoading = false;
  List<Products> clubs = [];

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  @override
  void initState() {
    super.initState();
    dummyjsonService = DummyjsonService(dio: service, service);
    _fecth();
  }

  Future<void> _fecth() async {
    changeLoading();
    clubs = (await dummyjsonService.fechResourceItem())?.products ?? [] ;
    changeLoading();
  }
}
