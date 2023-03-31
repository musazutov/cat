import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/variables.dart';
import '../../../../injection_container.dart';
import '../../domain/entities/cat.dart';
import '../bloc/cat_cubit.dart';
import '../bloc/cat_state.dart';

class CatPage extends StatelessWidget {
  CatPage({Key? key}) : super(key: key);

  final CatCubit _cubit = sl<CatCubit>();
  final catSet = Set();
  late int catIndex;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _cubit,
      child: Scaffold(
        // appBar: AppBar(
        //   title: const Text('Cat'),
        //   centerTitle: true,
        // ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            children: [
              Expanded(
                child: BlocBuilder<CatCubit, CatState>(
                  buildWhen: (state1, state2) {
                    return state2 is CatLoad;
                  },
                  builder: (context, state) {
                    if (state is CatLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is CatLoaded) {
                      return buildCat(state.cats);
                    } else if (state is CatError) {
                      return buildErrorWidget(state.message);
                    } else {
                      _cubit.getCat();
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
              TextButton(
                  onPressed: () {
                    _cubit.nextCat();
                  },
                  child: const Text('Another cat')),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Pages.factHistory,
                        arguments: catSet);
                  },
                  child: const Text('Fact history')),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildErrorWidget(String message) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message),
          const SizedBox(),
          IconButton(
              onPressed: () {
                _cubit.getCat();
              },
              icon: const Icon(Icons.refresh)),
        ],
      ),
    );
  }

  Widget buildCat(List cats) {
    return BlocBuilder<CatCubit, CatState>(buildWhen: (state1, state2) {
      return state2 is CatChanged;
    }, builder: (context, state) {
      catIndex = Random().nextInt(cats.length);
      Cat cat = cats[catIndex];
      catSet.add(cat);
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 250,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                  key: UniqueKey(),
                  imageUrl: 'https://cataas.com/cat',
                  cacheKey: UniqueKey().toString(),
                  fit: BoxFit.cover,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(
                          child: CircularProgressIndicator(
                              value: downloadProgress.progress)),
                  errorWidget: (context, url, error) {
                    debugPrint('erros was $error and the url was $url');
                    return Center(
                        child: Icon(
                      Icons.error,
                      color: Theme.of(context).colorScheme.primary,
                    ));
                  }),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(DateTime.parse(cat.createdDate).toLocal().toString()),
          ),
          const SizedBox(height: 20),
          Text(
            cat.text,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      );
    });
  }
}
