import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forestvpn_test/core/di/service_locator.dart';
import 'package:forestvpn_test/features/presentation/homepage/bloc/read_article_bloc/read_article_bloc.dart';
import 'package:forestvpn_test/features/presentation/homepage/widgets/homepage_appbar.dart';
import 'package:forestvpn_test/features/presentation/homepage/widgets/homepage_widgets.dart';

import 'bloc/read_article_bloc/read_article_event.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios_new),
        actions: [
          subTextAction("Notifications", () => null),
          const MarkRead(),
        ],
      ),
      body: const HomePageWidgets(),
    );
  }
}

class MarkRead extends StatelessWidget {
  const MarkRead({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: serviceLocator<ReadArticleBloc>()..add(const ChangeStatus()),
      child: subTextAction("Mark all read", () {
        print("Article status changed");}),
    );
  }
}
