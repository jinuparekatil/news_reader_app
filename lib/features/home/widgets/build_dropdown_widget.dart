import 'package:flutter/material.dart';
import 'package:news_reader_app/core/constants/countries.dart';
import 'package:news_reader_app/features/home/bloc/select_countrybloc.dart';

Future<String?> showCountryPicker(BuildContext context) {
  return showModalBottomSheet<String>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) {
      return SafeArea(top: true, bottom: true, child: CountryPickerSheet());
    },
  );
}

class CountryPickerSheet extends StatefulWidget {
  @override
  _CountryPickerSheetState createState() => _CountryPickerSheetState();
}

class _CountryPickerSheetState extends State<CountryPickerSheet> {
  String searchText = "";
  final bloc = SelectCountryBloc();

  @override
  Widget build(BuildContext context) {
    final filtered = countryCodes
        .where((code) => code.contains(searchText.toLowerCase()))
        .toList();

    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Search bar
          TextField(
            decoration: InputDecoration(
              hintText: "Search country code...",
              prefixIcon: Icon(Icons.search),
              filled: true,
              fillColor: Colors.grey.shade200,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
            onChanged: (value) {
              setState(() => searchText = value);
            },
          ),

          SizedBox(height: 12),

          // List of countries
          Flexible(
            child: StreamBuilder(
              stream: bloc.countryStream,
              initialData: bloc.defaultCountry,
              builder: (context, asyncSnapshot) {
                return ListView.builder(
                  itemCount: filtered.length,
                  itemBuilder: (context, index) {
                    final code = filtered[index];
                    return ListTile(
                      title: Text(code.toUpperCase()),
                      onTap: () {
                        Navigator.pop(context, code);
                        print("Selected country: $code");
                        bloc.selectCountry(code);
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
