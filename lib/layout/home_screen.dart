import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../generated/assets.dart';
import '../models/category_model.dart';
import '../screens/bloc/search_cubit.dart';
import '../screens/bloc/search_states.dart';
import '../screens/categories_tab.dart';
import '../screens/data_tab.dart';
import '../screens/drawer_tab.dart';
import '../screens/repo/remote_repo.dart';
import '../screens/settings_tab.dart';
import '../screens/widgets/custom_app_bar.dart';
import '../screens/widgets/newt_item.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int id = DrawerTab.CategoryId;
  String search = '';
  CategoryModel? model;

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> key = GlobalKey();
    return BlocProvider(
      create: (context) => SearchCubit(RemoteRepo()),
      child: BlocConsumer<SearchCubit, SearchStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image: AssetImage(Assets.assetsNewsBackground),
                  fit: BoxFit.fill,
                ),
              ),
              child: Scaffold(
                  key: key,
                  // custom drawr
                  drawer: DrawerTab(
                    onClick: onMenuItemClicked,
                  ),
                  backgroundColor: Colors.transparent,
                  //custom appBars
                  appBar: CustomAppBar(
                    sKey: key,
                    model: model,
                    searchIconClicked: SearchIconClicked,
                  ),
                  // Body will change according to the ID
                  body: SearchCubit.get(context).articlesSearch==null
                      ? Expanded(
                          child: ListView.builder(
                            itemCount:
                                SearchCubit.get(context).articlesSearch.length,
                            itemBuilder: (context, index) {
                              return NewsItem(
                                  article: SearchCubit.get(context)
                                      .articlesSearch[index]);
                            },
                          ),
                        )
                      : id == DrawerTab.CategoryId
                          ? CategoriesTab(onCategoryClicked: onCategoryClicked)
                          : id == DrawerTab.SettingsId
                              ? SettingsTab()
                              : DataTab(categoryId: model!.id, search: search)),
            );
          }),
    );
  }

  onCategoryClicked(CategoryModel categoryModel) {
    model = categoryModel;
    search = '';
    id = 0;
    setState(() {});
  }

  onMenuItemClicked(val) {
    if (val == DrawerTab.CategoryId) {
      model = null;
    }
    id = val;
    Navigator.pop(context);
    setState(() {});
  }

  SearchIconClicked(String searchWord) {
    if (searchWord != null ||searchWord.isNotEmpty) {
      SearchCubit.get(context).search(searchWord);
    } else {
      search = searchWord;
   //   id = 0;
      setState(() {});
    }
  }
}
