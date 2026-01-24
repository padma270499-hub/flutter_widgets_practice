import 'package:flutter/material.dart';

class ButtonWidgetDemo extends StatelessWidget {
  const ButtonWidgetDemo({super.key});

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(milliseconds: 800),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsetsGeometry.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () =>
                    _showSnackBar(context, 'Elevated Button Tapped!'),
                child: const Text('Elevated Button'),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () => _showSnackBar(context, 'Text Button Tapped!'),
                child: const Text('Text Button'),
              ),
              const SizedBox(height: 16),
              OutlinedButton(
                onPressed: () =>
                    _showSnackBar(context, 'Outlined Button Tapped!'),
                child: const Text('Outlined Button'),
              ),
              const SizedBox(height: 16),
              IconButton(
                onPressed: () => _showSnackBar(context, 'IconButton Tapped!'),
                icon: const Icon(Icons.star),
                tooltip: 'Star',
                iconSize: 48,
              ),
              const SizedBox(height: 16),
              FloatingActionButton.extended(
                onPressed: () =>
                    _showSnackBar(context, 'FloatingActionButton Tapped'),
                label: const Text('FAB extended'),
                icon: Icon(Icons.add),
              ),
              const SizedBox(height: 16),
              RawMaterialButton(
                onPressed: () =>
                    _showSnackBar(context, 'RawMaterialButton Tapped!'),
                elevation: 2.0,
                fillColor: Colors.purpleAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(8.0),
                ),
                child: Text(
                  'Raw Button',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
