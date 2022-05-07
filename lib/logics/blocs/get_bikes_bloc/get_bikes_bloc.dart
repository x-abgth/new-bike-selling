import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ktm/data/models/new_bikes_data_model.dart';
import 'package:ktm/data/repositories/new_bikes_data_repository.dart';

part 'get_bikes_event.dart';
part 'get_bikes_state.dart';

class GetBikesBloc extends Bloc<GetBikesEvent, GetBikesState> {
  NewBikesDataRepository newBikesDataRepository = NewBikesDataRepository();
  GetBikesBloc() : super(GetBikesDataLoading()) {
    on<LoadData>((event, emit) async {
      emit(GetBikesDataLoading());
      try {
        List<NewBikesDataModel> data =
            await newBikesDataRepository.fetchBikeData();
        print(data.isEmpty);
        if (data.isNotEmpty) {
          emit(GetBikesDataLoaded(bikeData: data));
        } else {
          emit(GetBikesDataLoadError(errorMsg: "Failed to load data"));
        }
      } catch (e) {
        emit(GetBikesDataLoadError(errorMsg: e.toString()));
      }
    });
  }
}
