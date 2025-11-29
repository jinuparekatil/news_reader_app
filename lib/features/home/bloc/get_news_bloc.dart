import 'package:news_reader_app/data/models/newsmodel.dart';
import 'package:news_reader_app/data/repositories/newsrepository.dart';
import 'package:rxdart/subjects.dart';

class GetNewsBloc {
  final Newsrepository newsrepository = Newsrepository();
  final BehaviorSubject<NewsResponse> _subject =
      BehaviorSubject<NewsResponse>();
      BehaviorSubject<NewsResponse> get subject => _subject;

  getNews(String category, String country) async {
    NewsResponse newsResponse = await newsrepository.getNews(category, country);
    _subject.sink.add(newsResponse);
  }

  dispose() {
    _subject.close();
  }
}
