import 'package:flutter/material.dart';
import 'package:sqlite_test/database/database.dart';
import 'package:sqlite_test/widgets/dialog.dart';
import 'package:sqlite_test/widgets/item_card.dart';

import 'model/fruit_model.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<FruitsModel> fruits = [];
  TextEditingController input1 = TextEditingController();
  TextEditingController input2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            ElevatedButton(
              onPressed: () {
                DialogBox.dialog(
                  context: context,
                  textEditingController1: input1,
                  textEditingController2: input2,
                  onPressed: () {
                    DatabaseManager().insertModel(
                      FruitsModel(
                        fruitName: input1.text,
                        quantity: input2.text,
                      ),
                    );
                    Navigator.pop(context);
                    setState(() {});
                  },
                );
              },
              child: const Icon(Icons.add),
            ),
          ],
        ),
        body: FutureBuilder(
          future: DatabaseManager().getFruitsList(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              fruits = snapshot.data!;
              return ListView.builder(
                //itemCount: fruits.length,
                itemCount: fruits.length,

                itemBuilder: (context, index) {
                  FruitsModel fruit = fruits[index];
                  return Cards(
                    fModel: fruit,
                    onDelete: () {
                      DatabaseManager().deleteModel(fruit);
                      setState(() {});
                    },
                    onEdit: () {
                      // input1.text = fruit.fruitName;
                      // input2.text = fruit.quantity;
                      // DialogBox.dialog(
                      //     context: context,
                      //     onPressed: () {
                      //       FruitsModel __model = FruitsModel(
                      //           id: fruit.id,
                      //           fruitName: input1.text,
                      //           quantity: input2.text);
                      //       DatabaseManager().updateModel(__model);
                      //
                      //       setState(() {
                      //         input1.text = "";
                      //         input2.text = "";
                      //       });
                      //       Navigator.of(context).pop();
                      //     },
                      //     textEditingController2: input2,
                      //     textEditingController1: input1);
                    },
                  );
                },
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
