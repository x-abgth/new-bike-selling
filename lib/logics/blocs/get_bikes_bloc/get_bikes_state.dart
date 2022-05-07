part of 'get_bikes_bloc.dart';

abstract class GetBikesState extends Equatable {
  const GetBikesState();
}

class GetBikesDataLoading extends GetBikesState {
  @override
  List<Object> get props => [];
}

class GetBikesDataLoaded extends GetBikesState {
  final List<NewBikesDataModel> bikeData;

  GetBikesDataLoaded({this.bikeData});
  @override
  List<Object> get props => [bikeData];
}

class GetBikesDataLoadError extends GetBikesState {
  final String errorMsg;

  GetBikesDataLoadError({this.errorMsg});
  @override
  List<Object> get props => [errorMsg];
}
