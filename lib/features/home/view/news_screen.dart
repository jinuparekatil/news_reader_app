import 'package:flutter/material.dart';
import 'package:news_reader_app/core/constants/categories.dart';
import 'package:news_reader_app/core/theme/app_text_styles.dart';

import 'package:news_reader_app/core/theme/app_colors.dart';
import 'package:news_reader_app/features/home/widgets/news_headline_widget.dart';
import '../widgets/platform_appbar.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PlatformAppBar(title: "NewsReader"),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(parent: ClampingScrollPhysics()),
        child: Column(
          children: [
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: newsCategories
                    .map(
                      (category) => Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Text(
                          category,
                          style: AppTextStyles.semiBold(
                            23,
                            color: AppColors.lightGrey,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, index) {
                return NewsHeadlineWidget();
              },
            ),
          ],
        ),
      ),
    );
  }
}
