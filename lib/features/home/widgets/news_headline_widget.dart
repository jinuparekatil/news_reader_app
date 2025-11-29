import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:intl/intl.dart';
import 'package:news_reader_app/core/theme/app_colors.dart';
import 'package:news_reader_app/core/theme/app_text_styles.dart';
import 'package:news_reader_app/core/theme/theme.dart';
import 'package:news_reader_app/features/home/view/view_news_screen.dart';

class NewsHeadlineWidget extends StatelessWidget {
  final String author;
  final String title;
  final String description;
  final String image;
  final String date;
  final String url;
  NewsHeadlineWidget(
    this.author,
    this.title,
    this.description,
    this.image,
    this.date,
    this.url,
  );

  FlutterTts tts = FlutterTts();

  speak(String text) async {
    print(await tts.getLanguages);
    await tts.setLanguage('en-US');
    await tts.setPitch(1);
    await tts.setVolume(1);
    await tts.speak(text);
  }
  // const NewsHeadlineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 10, right: 5, bottom: 10),
      child: Card(
        elevation: 5,
        child: Row(
          children: [
            image == ''
                ? Container()
                : Image(
                    width: MediaQuery.of(context).size.width * 0.33,
                    height: 144,
                    image: NetworkImage(image),
                    fit: BoxFit.fill,
                  ),
            SizedBox(width: 10),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: Theme.of(context).textTheme.bodyLarge),
                    SizedBox(height: 3),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              author,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                          Text(() {
                            print("DATE: $date, IMAGE: $image");
                            final parsed = DateTime.tryParse(date);
                            return parsed != null
                                ? DateFormat.yMd().format(parsed)
                                : "Invalid date";
                          }(), style: Theme.of(context).textTheme.bodyMedium),
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
                              InkWell(
                                onTap: () => speak(description),
                                child: Icon(Icons.play_arrow_sharp),
                              ),
                              InkWell(
                                onTap: () => tts.stop(),
                                child: Icon(Icons.stop),
                              ),
                            ],
                          ),
                          Container(
                            width: 70,
                            height: 35,
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ViewNewsScreen(url: url),
                                  ),
                                );
                              },
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
