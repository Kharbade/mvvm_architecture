import 'package:mvvm/data/network/BaseApiServices.dart';
import 'package:mvvm/data/network/NetworkApiServices.dart';
import 'package:mvvm/model/movies_list_model.dart';
import 'package:mvvm/res/app_url.dart';



class HomeRepository{
  BaseApiServices _apiServices = NetworkApiServices();

  Future<MovieListModel> fetchMoviesList()async{
    try{
      dynamic response = await _apiServices.getGetApiResponse(AppUrl.moviesListEndPoint);
      return response = MovieListModel.fromJson(response);
    }catch (e){
      throw e;
    }
  }
}