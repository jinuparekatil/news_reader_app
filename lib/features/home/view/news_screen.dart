import 'package:flutter/material.dart';

import '../widgets/platform_appbar.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PlatformAppBar( 
        title: "NewsReader"
      ),
    );
  }
}