import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ktm/logics/blocs/get_bikes_bloc/get_bikes_bloc.dart';
import 'package:ktm/presentation/screens/explore_bikes_screen/widgets/BikeDataGrid.dart';
import 'package:ktm/presentation/screens/explore_bikes_screen/widgets/SearchBar.dart';
import '../../../core/constants/constants.dart';

class ExploreBikes extends StatefulWidget {
  @override
  _ExploreBikesState createState() => _ExploreBikesState();
}

class _ExploreBikesState extends State<ExploreBikes> {
  Widget _content = Center(
    child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(kPrimaryDark),
    ),
  );

  @override
  void initState() {
    BlocProvider.of<GetBikesBloc>(context).add(LoadData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Explore Bikes"),
        actions: [SearchBar(), SizedBox(width: 10)],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: size.width),
          child: BlocBuilder<GetBikesBloc, GetBikesState>(
            builder: (context, state) {
              if (state is GetBikesDataLoaded) {
                return BikeDataGrid(snapshot: state.bikeData);
              }
              if (state is GetBikesDataLoadError) {
                return buildErrorCode(error: state.errorMsg);
              }
              if (state is GetBikesDataLoading) {
                Future.delayed(Duration(seconds: 10), () {
                  Widget retry = Center(
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Unable to access data!",
                            style: TextStyle(color: kPrimaryDark),
                          ),
                          TextButton.icon(
                            onPressed: () {
                              BlocProvider.of<GetBikesBloc>(context)
                                  .add(LoadData());
                              setState(() {
                                _content = Center(
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        kPrimaryDark),
                                  ),
                                );
                              });
                            },
                            icon: Icon(
                              Icons.refresh,
                              color: kPrimary,
                            ),
                            label: Text(
                              "Retry",
                              style: TextStyle(color: kPrimary),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                  if (mounted) {
                    setState(() {
                      _content = retry;
                    });
                  }
                });
              }
              return _content;
            },
          ),
        ),
      ),
    );
  }

  Widget buildErrorCode({String error}) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          error ?? "Something went wrong!",
          style: TextStyle(
            color: kPrimaryDark,
            fontSize: 23,
          ),
        ),
      ),
    );
  }
}
