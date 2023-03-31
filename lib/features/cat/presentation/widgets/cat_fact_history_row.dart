import 'package:flutter/material.dart';

import '../../domain/entities/cat.dart';

class CatFactHistoryRow extends StatelessWidget {
  const CatFactHistoryRow({Key? key,required this.cat}) : super(key: key);
final Cat cat;
   @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
      Text(cat.text,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),      const SizedBox(height: 5),
      Text('Date: ${DateTime.parse(cat.createdDate).toLocal()}'),
    ],);
  }
}
