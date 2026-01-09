import 'package:imc/models/imc_history_model.dart';
import 'package:flutter/material.dart';

class CardHystory extends StatelessWidget {

  final ImcHistoryModel model;
  final VoidCallback onDelete;
  const CardHystory({super.key, required this.model, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize:MainAxisSize.min,
          children: [
            Expanded(
              child: ListTile(
                  title: Text('IMC : ${model.imc.toStringAsFixed(2)}'),
                  subtitle: Text('${model.data.day} / ${model.data.month} / ${model.data.year}')
              ),
            ),

             IconButton(onPressed: onDelete, icon: Icon(Icons.delete))
          ],
        ),
      ),
    );
  }
}
