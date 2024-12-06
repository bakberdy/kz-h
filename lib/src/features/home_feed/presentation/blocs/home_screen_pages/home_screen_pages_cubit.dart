import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_screen_pages_state.dart';

class HomeScreenPagesCubit extends Cubit<int> {
  HomeScreenPagesCubit() : super(0);

  void goToPage(int index) {
    emit(index);
  }
}
