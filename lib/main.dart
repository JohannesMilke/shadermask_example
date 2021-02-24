import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:shadermask_example/widget/image/basic_image_widget.dart';
import 'package:shadermask_example/widget/image/image_shader_widget.dart';
import 'package:shadermask_example/widget/text/basic_text_widget.dart';
import 'package:shadermask_example/widget/text/image_text_widget.dart';
import 'package:shadermask_example/widget/image/linear_gradient_widget.dart';
import 'package:shadermask_example/widget/text/linear_text_widget.dart';
import 'package:shadermask_example/widget/image/radial_gradient_widget.dart';
import 'package:shadermask_example/widget/text/radial_text_widget.dart';
import 'package:shadermask_example/widget/image/sweep_gradient_widget.dart';
import 'package:shadermask_example/widget/text/sweep_text_widget.dart';
import 'package:shadermask_example/widget/tabbar_widget.dart';

final urlImage =
    'https://images.unsplash.com/photo-1584361853901-dd1904bb7987?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'ShaderMask';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
          primarySwatch: Colors.indigo,
        ),
        home: MainPage(title: title),
      );
}

class MainPage extends StatefulWidget {
  final String title;

  const MainPage({
    @required this.title,
  });

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: TabBarWidget(
          children: selectedIndex == 0
              ? [
                  BasicImageWidget(),
                  LinearGradientWidget(),
                  RadialGradientWidget(),
                  SweepGradientWidget(),
                  ImageShaderWidget(),
                ]
              : [
                  BasicTextWidget(),
                  LinearTextWidget(),
                  RadialTextWidget(),
                  SweepTextWidget(),
                  ImageTextWidget(),
                ],
          tabs: [
            Tab(icon: Icon(Icons.close), text: 'No Effect'),
            Tab(icon: Icon(Icons.home), text: 'Linear Gradient'),
            Tab(icon: Icon(Icons.touch_app), text: 'Radial Gradient'),
            Tab(icon: Icon(Icons.swipe), text: 'Sweep Gradient'),
            Tab(icon: Icon(Icons.zoom_out), text: 'ImageShader'),
          ],
          title: widget.title,
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white38,
          currentIndex: selectedIndex,
          onTap: (index) => setState(() => selectedIndex = index),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.image),
              label: 'Image',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.text_fields),
              label: 'Text',
            ),
          ],
        ),
      );
}
