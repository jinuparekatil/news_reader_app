import 'dart:async';

class SelectCountryBloc {
  final StreamController _countryController =
      StreamController.broadcast();
  Stream get countryStream => _countryController.stream;

  String defaultCountry = 'us';
  void selectCountry(String country) {
    _countryController.sink.add(country);
  }

  void dispose() {
    _countryController.close();
  }
}
