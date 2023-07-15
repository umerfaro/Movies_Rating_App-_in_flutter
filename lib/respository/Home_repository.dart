import '../Data/network/Base_APi_services.dart';
import '../Data/network/NetworkApiServices.dart';
import '../Models/Movies_model.dart';
import '../resources/App_Urls.dart';

class HomerRepository{

  BaseApiServices _apiServices = NetworkApiServices() ;

  Future<MovieListModel> fetchMoviesList()async{

    try{

      dynamic response = await _apiServices.getGetApiResponse(AppUrl.moviesListEndPoint);
      return response = MovieListModel.fromJson(response);

    }catch(e){
      throw e ;
    }
  }

}