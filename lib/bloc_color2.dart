import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

enum ColorEvent { to_indigoAccent, to_limeAccent }

class ColorBloc extends Bloc<ColorEvent, Color>{
  Color _color = Colors.indigoAccent;

  @override
  Color get initialState => Colors.indigoAccent;

  @override
  Stream<Color> mapEventToState(ColorEvent event) async* {
    _color = (event == ColorEvent.to_indigoAccent) ? Colors.indigoAccent : Colors.limeAccent;
    yield _color;
  }
}