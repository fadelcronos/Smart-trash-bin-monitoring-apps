part of 'filllevel_bloc.dart';

abstract class FilllevelState extends Equatable {
  const FilllevelState();

  @override
  List<Object> get props => [];
}

class FilllevelInitial extends FilllevelState {}

class FillDataChange extends FilllevelState {}

class FillDataLoad extends FilllevelState {}
