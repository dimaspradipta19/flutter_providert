import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn_provider/data/provider/object_provider.dart';
import 'package:flutter_learn_provider/utils/state.dart';
import 'package:provider/provider.dart';

class ObjectScreen extends StatefulWidget {
  const ObjectScreen({super.key});

  @override
  State<ObjectScreen> createState() => _ObjectScreenState();
}

class _ObjectScreenState extends State<ObjectScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ObjectProvider>(context, listen: false).getObject();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Object Response"),
      ),
      body: Consumer<ObjectProvider>(
        builder: (context, valueObject, _) {
          if (valueObject.state == ResultState.loading) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }

          if (valueObject.state == ResultState.hasData) {
            return ListView.builder(
              itemCount: valueObject.model?.results.length,
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(valueObject.model!.results[index].name),
                  subtitle: Text(valueObject.model!.results[index].overview),
                );
              },
            );
          }

          return const Text("No Data");
        },
      ),
    );
  }
}
