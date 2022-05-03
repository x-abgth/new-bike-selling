import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'get_bikes_event.dart';
part 'get_bikes_state.dart';

class GetBikesBloc extends Bloc<GetBikesEvent, GetBikesState> {
  GetBikesBloc() : super(GetBikesInitial()) {
    on<GetBikesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
