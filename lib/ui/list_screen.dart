import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_learn_provider/data/provider/list_provider.dart';
import 'package:provider/provider.dart';

import '../utils/state.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ListProvider>(context, listen: false).getList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List Response"),
      ),
      body: Consumer<ListProvider>(
        builder: (context, valueList, _) {
          if (valueList.state == ResultState.loading) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }

          if (valueList.state == ResultState.hasData) {
            return ListView.builder(
              itemCount: valueList.listProduct!.length,
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(valueList.listProduct![index].title),
                  subtitle: Text(valueList.listProduct![index].description),
                );
              },
            );
          }

          return const Center(child: Text("No Data"));
        },
      ),
    );
  }
}
