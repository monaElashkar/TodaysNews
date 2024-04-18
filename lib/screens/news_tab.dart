import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/cubit.dart';
import 'bloc/states.dart';
import 'widgets/newt_item.dart';
import 'widgets/source_item.dart';

class NewsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: HomeCubit.get(context).sources.length,
      child: Column(
        children: [
          TabBar(
            indicatorColor: Colors.transparent,
            onTap: (value) async {
              HomeCubit.get(context)
                  .ChangeSelectedIndex(value);
            },
            isScrollable: true,
            tabs: HomeCubit.get(context)
                .sources
                .map((e) => Tab(
                      child: SourceItem(
                        sources: e,
                        selected: HomeCubit.get(context)
                                .sources
                                .elementAt(
                                    HomeCubit.get(context)
                                        .selectedIndex) ==
                            e,
                      ),
                    ))
                .toList(),
          ),
          BlocConsumer<HomeCubit, HomeStates>(
            listener: (context, state){

            },
            builder: (context, state) {
              if (state is HomeGetNewsLoadingState) {
                return Align(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(
                    color: Colors.green,
                  ),
                );
              }
              return Expanded(
                child: ListView.builder(
                  itemCount:
                      HomeCubit.get(context).articles.length,
                  itemBuilder: (context, index) {
                    return NewsItem(
                        article: HomeCubit.get(context)
                            .articles[index]);
                  },
                ),
              );
            }
          )
        ],
      ),
    );
  }
}
