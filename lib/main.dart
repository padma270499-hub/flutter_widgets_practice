import 'package:flutter/material.dart';
import 'package:flutter_widgets_practice/widgets/buttonwidget.dart';
import 'package:flutter_widgets_practice/widgets/listviewwidget.dart';
import 'package:flutter_widgets_practice/widgets/navigationwidget.dart';
import 'package:flutter_widgets_practice/widgets/textwidget.dart';

void main() {
  runApp(const AppRoot());
}

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  final List<String> topics = const [
    'Text Widget',
    'Button Widgets',
    'ListView Widget',
    'Navigation',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Widgets Practice'),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: topics.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(topics[index]),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push<Widget>(
                  context,
                  MaterialPageRoute<Widget>(
                    builder: (_) => TopicDetailScreen(title: topics[index]),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class TopicDetailScreen extends StatelessWidget {
  final String title;

  const TopicDetailScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    Widget content;
    switch (title) {
      case 'Text Widget':
        content = const TextWidgetDemo();
        break;
      case 'Button Widget':
        content = const ButtonWidgetDemo();
        break;
      case 'ListView Widget':
        content = const ListViewWidgetDemo();
        break;
      case 'Navigation Widget':
        content = const NavigationWidgetDemo();
        break;

      default:
        content = Center(
          child: Text(
            'content for "$title" coming soon!',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        );
    }
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: content,
    );
  }
}
