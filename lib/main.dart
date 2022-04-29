import 'package:flutter/cupertino.dart';
import 'package:layout/layout.dart';

import 'commons.dart';

Future<void> main() async {
  await AppService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Layout(
      format: MaterialLayoutFormat(),
      child: MaterialApp.router(
        color: Colors.white,
        routeInformationParser: router.routeInformationParser,
        routerDelegate: router.routerDelegate,
        // scrollBehavior: AppScrollBehavior(),
        debugShowCheckedModeBanner: false,
        useInheritedMediaQuery: true,
        title: AppStrings.appName,
        locale: const Locale('en', 'US'),
        theme: lightTheme,
        themeMode: ThemeMode.light,
        builder: AppWrapperWidget.builder,
        // builder: (context, child) {
        //   final child2 = AppWrapperWidget.builder(context, child);
        //   return Column(
        //     children: [
        //       child2.exp(),
        //     ],
        //   );
        // },
      ),
    );
  }
}
