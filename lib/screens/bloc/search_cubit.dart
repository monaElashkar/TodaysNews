import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/screens/bloc/search_states.dart';
import '../../models/news_data_model.dart';
import '../repo/remote_repo.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit(this.repo) : super(SearchInitState());
  RemoteRepo repo;
  static SearchCubit get(context) {
    return BlocProvider.of(context);
  }
  List<Articles> articlesSearch = [];

  Future<void> search(String searchWord) async {
    try {
      emit(SearchSearchLoadingState());
      var newsDataModel = await repo.search(searchWord);
      articlesSearch = newsDataModel.articles ?? [];
      print(articlesSearch);
      emit(SearchSearchSuccessState());
    } catch (e) {
      print(e.toString());
      emit(SearchSearchErrorState(e.toString()));
    }
  }
}
