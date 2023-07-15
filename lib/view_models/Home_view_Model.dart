import 'package:flutter/material.dart';
import 'package:mvvm_architechture/Data/response/api_response.dart';

import '../Models/Movies_model.dart';
import '../respository/Home_repository.dart';

class HomeviewViewModel with ChangeNotifier {

  final _myRepo = HomerRepository();

  ApiResponse<MovieListModel> moviesList = ApiResponse.loading();

  setMoviesList(ApiResponse<MovieListModel> response){
    moviesList = response ;
    notifyListeners();
  }


  Future<void> fetchMoviesListApi ()async{

    setMoviesList(ApiResponse.loading());

    _myRepo.fetchMoviesList().then((value){

      setMoviesList(ApiResponse.completed(value));

    }).onError((error, stackTrace){

      setMoviesList(ApiResponse.error(error.toString()));

    });
  }

}
