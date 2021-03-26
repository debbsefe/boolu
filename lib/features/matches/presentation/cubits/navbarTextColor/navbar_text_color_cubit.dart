import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'navbar_text_color_state.dart';

class NavbarTextColorCubit extends Cubit<NavbarTextColorState> {
  NavbarTextColorCubit() : super(NavbarTextColorState(index: 3));

  void setIndex(int index) => emit(NavbarTextColorState(index: index));
}
