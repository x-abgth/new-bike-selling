part of 'get_bikes_bloc.dart';

abstract class GetBikesEvent extends Equatable {
  const GetBikesEvent();
}

class LoadData extends GetBikesEvent {
  @override
  List<Object> get props => [];
}
