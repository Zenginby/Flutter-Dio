import 'package:flutter/material.dart';
import 'package:flutter_dio_test/dummyjson_resource/model/product_model.dart';
import 'package:flutter_dio_test/dummyjson_resource/view_model/dummyjson_view_model.dart';

class DummyjsonView extends StatefulWidget {
  const DummyjsonView({super.key});

  @override
  State<DummyjsonView> createState() => _DummyJsonState();
}

class _DummyJsonState extends DummyjsonViewModel {
  List<Products> _foundUsers = [];
  @override
  initState() {
    _foundUsers = clubs;
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Products> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = clubs;
    } else {
      results = clubs
          .where((element) =>
              element.title!.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }
    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(20),
          child: TextField(
            onChanged: (value) => _runFilter(value),
            cursorColor: Colors.white,
            keyboardType: TextInputType.text,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
                labelText: "Search",
                suffixIcon: Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 20,
                ),
                labelStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                )),
          ),
        ),
      ),
      body: _foundUsers.isNotEmpty
          ? ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  key: ValueKey(_foundUsers[index].id),
                  elevation: 4,
                  clipBehavior: Clip.antiAlias,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                      child: Column(children: [
                       
                             ListTile(
                              // leading: Text(
                              //   _foundUsers[index]["id"].toString(),
                              //   style: const TextStyle(
                              //       fontSize: 24, color: Colors.white),
                              // ),
                              title: Text(_foundUsers[index].title.toString(),
                                  style: const TextStyle(color: Colors.black)),
                              subtitle: Text(_foundUsers[index].description.toString(),
                                  maxLines: 2,
                                  style: const TextStyle(color: Colors.black)),
                            ),
                            const SizedBox(
                              height: 12,
                            ),         
                            ]),
                );
              },
              itemCount: _foundUsers.length,
            )
          : Text("data"),
    );
  }
}
