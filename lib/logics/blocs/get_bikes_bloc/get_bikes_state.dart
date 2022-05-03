part of 'get_bikes_bloc.dart';

abstract class GetBikesState extends Equatable {
  const GetBikesState();
  
  @override
  List<Object> get props => [];
}

class GetBikesInitial extends GetBikesState {}
