
import 'package:flutter/material.dart';
import 'package:flutter_dio_test/product/extensions/string_extension.dart';
import 'package:flutter_dio_test/reqrest_resource/view_model/req_res_view_model.dart';

class ReqresView extends StatefulWidget {
  const ReqresView({super.key});

  @override
  State<ReqresView> createState() => _ReqresViewState();
}

class _ReqresViewState extends ReqresViewModel {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: isLoading ? const CircularProgressIndicator() : null,),
      body: ListView.builder(itemBuilder: (context, index) {
        return Card(color:Color(resources[index].color?.colorValue ?? 0) , child: Text(resources[index].name ?? ''));
      },
      itemCount: resources.length,
      ),

    );
  }
}