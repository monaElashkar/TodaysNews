abstract class SearchStates {}

class SearchInitState extends SearchStates {}


class SearchSearchLoadingState extends SearchStates {}

class SearchSearchSuccessState extends SearchStates {}

class SearchSearchErrorState extends SearchStates {
  String errorMsg;
  SearchSearchErrorState(this.errorMsg);
}

