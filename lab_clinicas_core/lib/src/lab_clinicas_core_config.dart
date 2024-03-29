import 'package:asyncstate/asyncstate.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:lab_clinicas_core/src/loader/lab_clinicas_loader.dart';
import 'package:lab_clinicas_core/src/theme/lab_clinicas_theme.dart';

class LabClinicasCoreConfig extends StatelessWidget {
  const LabClinicasCoreConfig(
      {super.key,
      this.binding,
      this.pages,
      this.pagesBuilder,
      this.modules,
      required this.title,
      this.didStart});

  final ApplicationBindings? binding;
  final List<FlutterGetItPageRouter>? pages;
  final List<FlutterGetItPageBuilder>? pagesBuilder;
  final List<FlutterGetItModule>? modules;
  final String title;
  final VoidCallback? didStart;

  @override
  Widget build(BuildContext context) {
    return FlutterGetIt(
      bindings: binding,
      modules: modules,
      pages: [...pages ?? [], ...pagesBuilder ?? []],
      debugMode: kDebugMode,
      builder: (context, routes, flutterGetItNavObserver) {
        return AsyncStateBuilder(
          loader: LabClinicasLoader(),
          builder: (navigatorObserver) {
            if (didStart != null) {
              didStart!();
            }
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: LabClinicasTheme.lightTheme,
              darkTheme: LabClinicasTheme.dartTheme,
              title: title,
              navigatorObservers: [
                navigatorObserver,
                flutterGetItNavObserver,
              ],
              routes: routes,
            );
          },
        );
        /* return MaterialApp(
          title: title,
          navigatorObservers: [flutterGetItNavObserver],
          routes: routes,
        ); */
      },
    );
  }
}
