import 'package:flutter/material.dart';
import 'package:my_flyn/core/components/common_app_bar.dart';

class PlaceholderView extends StatelessWidget {
  final String title;
  const PlaceholderView({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: title),
      body: Center(child: Text('This is $title screen')),
    );
  }
}
