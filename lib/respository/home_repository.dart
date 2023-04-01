import 'package:mvvm/data/network/base_api_services.dart';
import 'package:mvvm/data/network/network_api_service.dart';
import 'package:mvvm/model/articles_model.dart';
import 'package:mvvm/res/app_url.dart';

class HomeRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  Future<ArticlesListModel> fetchArticlesList() async {
    try {
      dynamic response =
          await _apiServices.getGetApiResponse(AppUrl.articlesListEndPoint);
      return response = ArticlesListModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
