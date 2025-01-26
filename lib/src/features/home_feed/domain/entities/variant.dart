import 'package:equatable/equatable.dart';
import 'package:kz_h/src/features/home_feed/presentation/widgets/variant_widget.dart';

class Variant extends Equatable {
  final String text;
  final QuestionStateEnum questionState;
  final bool isCorrect;

  const Variant(
      {this.isCorrect = false,
      required this.text,
      this.questionState = QuestionStateEnum.notSelected});

  @override
  List<Object?> get props => [text];
}
