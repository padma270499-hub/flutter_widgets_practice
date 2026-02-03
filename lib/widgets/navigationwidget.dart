import 'package:flutter/material.dart';
import 'package:flutter_widgets_practice/Screens/simple_new_page.dart';

class NavigationWidgetDemo extends StatelessWidget {
  const NavigationWidgetDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsetsGeometry.all(16),
            child: Text(
              'Explore different Navigation Action',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton.icon(
            icon: const Icon(Icons.arrow_back),
            label: const Text('Pop current screen'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            label: const Text('Push New Screen (on top)'),
            icon: const Icon(Icons.next_plan),
            onPressed: () {
              Navigator.push<Widget>(
                context,
                MaterialPageRoute<Widget>(
                  builder: (BuildContext context) => const SimpleNewPage(
                    message: 'This is a new page you push on Top!',
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pushReplacement<Widget, Widget>(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const SimpleNewPage(
                    message: 'This page replaced the previous one',
                  ),
                ),
              );
            },
            label: const Text('Push Replacement'),
            icon: Icon(Icons.swap_horiz),
          ),
          SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pushAndRemoveUntil<Widget>(
                context,
                MaterialPageRoute<Widget>(
                  builder: (BuildContext context) => SimpleNewPage(
                    message:
                        'This page is now the only one on the stack (except root)!',
                  ),
                ),
                (Route<dynamic> route) => route.isFirst,
              );
            },
            label: const Text('Push And Remove Until(Clear Stack)'),
            icon: const Icon(Icons.dashboard),
          ),
        ],
      ),
    );
  }
}
