import 'package:cat/features/cat/presentation/pages/cat_fact_history_page.dart';
import 'package:cat/features/cat/presentation/pages/cat_page.dart';
import 'package:flutter/material.dart';
import 'variables.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Pages.factHistory:
        return MaterialPageRoute(
            settings: settings, builder: (_) => CatFactHistoryPage(cats: (settings.arguments??[]) as Set,));


      case Pages.cat:
        return MaterialPageRoute(
            settings: settings, builder: (_) => CatPage());



      default:
        return MaterialPageRoute(
            settings: settings,
            builder: (_) => const Center(
                  child: Text('undefined route'),
                ));
    }
  }
}
