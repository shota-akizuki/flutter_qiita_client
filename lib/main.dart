import 'package:flutter/material.dart';
import 'package:flutter_qiita_client/screens/item_list_screen.dart';
import 'package:provider/provider.dart';
import 'models/item_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<ItemModel>(
            create: (_) => ItemModel(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.green,
          ),
          home: ItemListScreen(),
        ));
  }
}
