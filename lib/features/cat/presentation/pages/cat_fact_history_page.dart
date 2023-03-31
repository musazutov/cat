import 'package:cat/features/cat/presentation/widgets/cat_fact_history_row.dart';
import 'package:flutter/material.dart';

class CatFactHistoryPage extends StatelessWidget {
  const CatFactHistoryPage({Key? key,required this.cats}) : super(key: key);
final Set cats;
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(centerTitle: true,title: const Text('Fact history'),),body: Center(child:  ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      shrinkWrap: true,
    itemCount:cats.length,
    itemBuilder: (context,index){
      return CatFactHistoryRow(cat: cats.elementAt(index));
    }, separatorBuilder: (context,index){
      return Divider(color: Colors.grey.shade300,thickness: .5,);
    } )));
  }
}
