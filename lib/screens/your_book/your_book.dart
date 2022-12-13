import 'package:bookers/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class YourBook extends StatelessWidget {
  const YourBook({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: myBodyColor,
        foregroundColor: myTextColor,
        elevation: 0,
        toolbarHeight: 70,
        centerTitle: true,
        title: Text(
          "My Book",
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Text("Booking Your Book First!"),
      ),
    );
  }
}
