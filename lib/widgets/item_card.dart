import 'package:flutter/material.dart';
import 'package:sqlite_test/model/fruit_model.dart';

class Cards extends StatefulWidget {
  final FruitsModel fModel;
  final Function onDelete;
  final Function onEdit;

  const Cards(
      {Key? key,
      required this.fModel,
      required this.onDelete,
      required this.onEdit})
      : super(key: key);

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Name: ${widget.fModel.fruitName}',
                    style: const TextStyle(fontSize: 15),
                  ),
                  Text(
                    'Quantity: ${widget.fModel.quantity}',
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      onPressed: widget.onEdit(),
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      onPressed: () {
                        widget.onDelete();

                        print('delete::::::::');
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
