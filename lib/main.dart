import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:try_flutter_2021/platform-widgets/platform_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appTheme = ThemeData(
      buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
      primarySwatch: Colors.blue,
    );
    return Theme(
        data: appTheme,
        child: PlatformProvider(
          initialPlatform: TargetPlatform.android,
          builder: (appContext) => PlatformApp(
              localizationsDelegates: <LocalizationsDelegate<dynamic>>[
                DefaultMaterialLocalizations.delegate,
                DefaultWidgetsLocalizations.delegate,
                DefaultCupertinoLocalizations.delegate,
              ],
              material: (context, platform) => MaterialAppData(
                    theme: appTheme,
                  ),
              cupertino: (context, platform) => CupertinoAppData(
                    theme: MaterialBasedCupertinoThemeData(
                        materialTheme: appTheme),
                  ),
              home: Navigator(
                pages: [
                  createPlatformPage(
                      context: appContext,
                      key: ValueKey("HOME"),
                      child: PlatformScaffold(
                        bottomNavBar: PlatformNavBar(
                          items: [
                            BottomNavigationBarItem(
                                icon: Icon(Icons.add_a_photo), label: "Photo"),
                            BottomNavigationBarItem(
                                icon: Icon(Icons.add_a_photo), label: "Photo"),
                            BottomNavigationBarItem(
                                icon: Icon(Icons.add_a_photo), label: "Photo"),
                          ],
                        ),
                        body: SafeArea(
                          child: Column(
                            children: [
                              Text("Hello Platform App"),
                              PlatformButton(
                                child: Text("Material"),
                                onPressed: () {
                                  PlatformProvider.of(appContext)
                                      .changeToMaterialPlatform();
                                },
                              ),
                              PlatformButton(
                                child: Text("Cupertino"),
                                onPressed: () {
                                  PlatformProvider.of(appContext)
                                      .changeToCupertinoPlatform();
                                },
                              ),
                              PlatformSwitch(
                                value: true,
                                onChanged: (newVal) {},
                              )
                            ],
                          ),
                        ),
                        appBar: PlatformAppBar(
                          title: Text("App Bar"),
                        ),
                      )),
                ],
              )),
        ));
  }
}
