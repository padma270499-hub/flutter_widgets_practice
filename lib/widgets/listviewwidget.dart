import 'package:flutter/material.dart';

class ListViewWidgetDemo extends StatelessWidget {
  const ListViewWidgetDemo({super.key});
  final String imagesUrl =
      'https://www.gstatic.com/flutter-onestack-prototype/genui/example_1.jpg';
  final int Numerofimages = 10;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsetsGeometry.all(16),
          child: Text(
            'List of images using ListView.builder',
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: Numerofimages,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                elevation: 4,
                child: Column(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(8),
                      child: Image.network(
                        imagesUrl,
                        fit: BoxFit.fitWidth,
                        width: double.infinity,
                        loadingBuilder:
                            (
                              BuildContext context,
                              Widget child,
                              ImageChunkEvent? loadingProgress,
                            ) {
                              if (loadingProgress == null) {
                                return child;
                              }
                              return Center(
                                child: CircularProgressIndicator(
                                  value:
                                      loadingProgress.expectedTotalBytes != null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                      : null,
                                ),
                              );
                            },
                        errorBuilder:
                            (
                              BuildContext context,
                              Object error,
                              StackTrace? stackTrace,
                            ) {
                              return Container(
                                color: Colors.grey,
                                height: 150,
                                child: const Center(
                                  child: Icon(Icons.broken_image, size: 50),
                                ),
                              );
                            },
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'image item ${index + 1}',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
