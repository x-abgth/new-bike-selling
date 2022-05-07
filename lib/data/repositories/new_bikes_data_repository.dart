import 'package:ktm/data/models/new_bikes_data_model.dart';
import '../../../core/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NewBikesDataRepository {
  List<NewBikesDataModel> datas = [];
  List<NewBikesDataModel> bikeData = [];

  // fetch data from the internet
  Future fetchBikeData() async {
    final response = await http.get(Uri.parse(bikesUrl));
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      for (var dataJson in jsonData) {
        datas.add(NewBikesDataModel.fromJson(dataJson));
      }
      bikeData.addAll(datas);
      return bikeData;
    } else {
      return Exception('Failed to load data');
    }
  }
}
