import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:fgm_app/theme.dart';
import 'package:fgm_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'components/dialog.dart';
import 'generated/l10n.dart';
import 'package:intl/intl.dart';



void main() {
  Intl.defaultLocale = 'en';
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
        light: kLightTheme,
        dark: kDarkTheme,
        debugShowFloatingThemeButton: true,
        initial: AdaptiveThemeMode.light,
        builder: (theme, darkTheme) => MaterialApp(
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: theme,
              darkTheme: darkTheme,
              home: const MyHomePage(),
            ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar.medium(
              leading:
              IconButton(icon: const Icon(Icons.settings_outlined), onPressed: () {}),
              title: Text(S
                  .of(context)
                  .app_bar_title),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.flight),
                  onPressed: () =>
                      dialogBuilder(context,
                          title: S
                              .of(context)
                              .chose_your_flight),
                ),
              ],
            ),
            // Just some content big enough to have something to scroll.
            SliverToBoxAdapter(
              child: Card(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    const SizedBox(height: 8.0),
                    GroupButtonTitle(
                      title: S
                          .of(context)
                          .inbound_Time_Info,
                      icon: const Icon(Icons.flight_land),
                    ),
                    //Spacer(),
                    const ButtonsGroupCard(
                      buttonTitle: 'Ramp Agent Start',
                    ),
                    const ButtonsGroupCard(
                      buttonTitle: 'Final Figures Gate',
                    ),
                    const ButtonsGroupCard(
                      buttonTitle: 'Boarding OK',
                    ),
                    GroupButtonTitle(
                      title: S
                          .of(context)
                          .outgoing_Time_Info,
                      icon: const Icon(Icons.flight_takeoff),
                    ),
                    const ButtonsGroupCard(
                      buttonTitle: 'First Bus',
                    ),
                    const ButtonsGroupCard(
                      buttonTitle: 'Ramp Agent Start',
                    ),
                    const ButtonsGroupCard(
                      buttonTitle: 'Final Figures Gate',
                    ),
                    const ButtonsGroupCard(
                      buttonTitle: 'Boarding OK',
                    ),
                    const ButtonsGroupCard(
                      buttonTitle: 'First Bus',
                    ),
                    const ButtonsGroupCard(
                      buttonTitle: 'Ramp Agent Start',
                    ),
                    const ButtonsGroupCard(
                      buttonTitle: 'Final Figures Gate',
                    ),
                    const ButtonsGroupCard(
                      buttonTitle: 'Boarding OK',
                    ),
                    const ButtonsGroupCard(
                      buttonTitle: 'First Bus',
                    ),

                    //ElevatedCardExample(),
                    //FilledCardExample(),
                    //OutlinedCardExample(),
                    //Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
  /*
  Future<void> _dialogBuilder(BuildContext context, {required String title}) {
    final String dialogTitle = title;

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(dialogTitle),
          content: const SizedBox(
            height: 150,
            child: Column(
              children: [
                DropdownMenuExample(),
                SizedBox(height: 16,),
                CustomTextField(),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Disable'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Enable'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

*/

