import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:traveling/widgets/back_widget.dart';

class LanguagesScreen extends StatefulWidget {
  @override
  LanguagesScreenState createState() => LanguagesScreenState();
}

class LanguagesScreenState extends State<LanguagesScreen> {
  @override
  void initState() {
    super.initState();
    afterBuildCreated(() {
      init();
    });
  }

  Future<void> init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        'Language',
        textColor: white,
        elevation: 0.0,
        color: context.primaryColor,
        backWidget: BackWidget(),
      ),
      body: LanguageListWidget(
        widgetType: WidgetType.LIST,
        onLanguageChange: (v) {
          setState(() {});
          finish(context);
        },
      ),
    );
  }
}
