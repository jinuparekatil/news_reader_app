import 'package:flutter/material.dart';
import 'package:news_reader_app/core/theme/app_colors.dart';
import 'package:news_reader_app/core/theme/app_text_styles.dart';
import 'package:news_reader_app/core/theme/theme.dart';

class NewsHeadlineWidget extends StatelessWidget {
  const NewsHeadlineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 10, right: 5, bottom: 10),
      child: Card(
        elevation: 5,
        child: Row(
          children: [
            Image(
              width: MediaQuery.of(context).size.width * 0.33,
              height: 144,
              image: NetworkImage(
                "https://cdn.pixabay.com/photo/2017/06/26/19/03/news-2444778_1280.jpg",
              ),
              fit: BoxFit.fill,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Your trusted source for breaking news, analysis, exclusive interviews, headlines, and videos at ABCNews.com",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    SizedBox(height: 3),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "John Smith",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          Text(
                            "12-05-25",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 6),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.play_arrow_sharp),
                              Icon(Icons.stop),
                            ],
                          ),
                          Container(
                            width: 70,
                            height: 35,
                            child: TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                backgroundColor: Theme.of(
                                  context,
                                ).colorScheme.primary,
                                foregroundColor: Theme.of(
                                  context,
                                ).colorScheme.onPrimary,
                              ),
                              child: Text(
                                "View",
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
