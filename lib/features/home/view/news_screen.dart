import 'package:flutter/material.dart';
import 'package:news_reader_app/core/constants/categories.dart';
import 'package:news_reader_app/core/theme/app_text_styles.dart';

import 'package:news_reader_app/core/theme/app_colors.dart';
import 'package:news_reader_app/data/models/newsmodel.dart';
import 'package:news_reader_app/features/home/bloc/get_news_bloc.dart';
import 'package:news_reader_app/features/home/bloc/select_category_bloc.dart';
import 'package:news_reader_app/features/home/widgets/news_headline_widget.dart';
import '../widgets/platform_appbar.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  late GetNewsBloc getNewsBloc;
  late SelectCategoryBloc selectCategoryBloc;

  @override
  void initState() {
    super.initState();
    getNewsBloc = GetNewsBloc();
    getNewsBloc..getNews("General", "us");
    selectCategoryBloc = SelectCategoryBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PlatformAppBar(title: "NewsReader"),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(parent: ClampingScrollPhysics()),
        child: Column(
          children: [
            SizedBox(height: 20),
            StreamBuilder(
              stream: selectCategoryBloc.categoryStream,
              initialData: selectCategoryBloc.defaultCategory,
              builder: (context, asyncSnapshot) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: newsCategories.map((category) {
                      final isSelected = asyncSnapshot.data == category;

                      return Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: InkWell(
                          onTap: () =>
                              selectCategoryBloc.selectCategory(category),
                          child: Text(
                            category,
                            style: isSelected
                                ? AppTextStyles.semiBold(
                                    16,
                                    color: AppColors.selectedText(context),
                                  )
                                : AppTextStyles.semiBold(
                                    16,
                                    color: AppColors.unselectedText(context),
                                  ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            StreamBuilder<NewsResponse>(
              stream: getNewsBloc.subject.stream,
              builder: (context, asyncSnapshot) {
                if (!asyncSnapshot.hasData) {
                  return (Center(child: CircularProgressIndicator()));
                }
                List<NewsModel> newsList = asyncSnapshot.data!.news;
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: newsList.length,

                  itemBuilder: (context, index) {
                    NewsModel news = newsList[index];
                    return NewsHeadlineWidget(
                      news.author == null ? '' : news.author,
                      news.title == null ? '' : news.title,
                      news.description == null ? '' : news.description,
                      news.image == null ? '' : news.image,
                      news.date == null ? '' : news.date,
                      news.url == null ? '' : news.url,
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
