import 'package:flutter/cupertino.dart';
import 'package:mvvm/data/response/api_response.dart';
import 'package:mvvm/model/articles_model.dart';
import 'package:mvvm/respository/home_repository.dart';

class HomeViewViewModel with ChangeNotifier {
  final _myRepo = HomeRepository();

  ApiResponse<ArticlesListModel> articlesList = ApiResponse.loading();

  setArticlesList(ApiResponse<ArticlesListModel> response) {
    articlesList = response;
    notifyListeners();
  }

  Future<void> fetchArticlesListApi() async {
    setArticlesList(ApiResponse.loading());

    _myRepo.fetchArticlesList().then((value) {
      setArticlesList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setArticlesList(ApiResponse.error(error.toString()));
    });
  }
}
