import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:layout/layout.dart';

import 'commons.dart';

Future<void> main() async {
  await AppService.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  /// load images here.
  bool loadingImage = true;

  @override
  void initState() {
    SchedulerBinding.instance?.addPostFrameCallback((timeStamp) {
      precacheImages();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (loadingImage) {
      return Center(
        child: Material(
          child: Column(
            children: const [
              Text('Loading images', textDirection: TextDirection.ltr),
              kGap16,
              CircularProgressIndicator(),
            ],
          ),
        ),
      );
    }
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

  Future<void> precacheImages() async {
    loadingImage = true;
    await AppImageCache.preloadImages(context);
    await AppImageCache.preloadSvg(context);
    loadingImage = false;
    update();
  }
}
