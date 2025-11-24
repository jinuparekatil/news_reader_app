import 'package:flutter/material.dart';

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
          ],
        ),
      ),
    );
  }
}
