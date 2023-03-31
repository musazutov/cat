 import 'package:equatable/equatable.dart';

class Cat extends Equatable {
   final String createdDate;
  final String text;

  const Cat(
      {required this.text,
      required this.createdDate
       });

  @override
  List<Object> get props => [text, createdDate];
}
