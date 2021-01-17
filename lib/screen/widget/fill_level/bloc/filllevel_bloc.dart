import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'filllevel_event.dart';
part 'filllevel_state.dart';

class FilllevelBloc extends Bloc<FilllevelEvent, FilllevelState> {
  FilllevelBloc() : super(FilllevelInitial());

  @override
  Stream<FilllevelState> mapEventToState(
    FilllevelEvent event,
  ) async* {}
}
