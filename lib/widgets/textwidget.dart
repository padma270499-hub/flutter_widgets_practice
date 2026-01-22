import 'package:flutter/material.dart';

class TextWidgetDemo extends StatelessWidget {
  const TextWidgetDemo({super.key});

  final String longText =
      "The Flutter Text widget displays a string of text with a single style. "
      "The string might break across multiple lines if it is too long to fit "
      "on a single line. The `Text` widget is fundamental for displaying "
      "any textual content in a Flutter application. You can customize its "
      "appearance using the `style` property, which takes a `TextStyle` object. "
      "Properties like font size, font weight, color, letter spacing, word spacing, "
      "and many more can be adjusted. Furthermore, you can control text alignment "
      "with `textAlign` and how text overflows its boundaries using `overflow`. "
      "For rich text with multiple styles, you can use `Text.rich` and `TextSpan` "
      "widgets. This allows for complex formatting within a single text block. "
      "It's a versatile widget that serves as the backbone for textual communication "
      "within your user interface, making information clear and readable for users.";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Demonstrating the Text Widget',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 16.0),
          Text(
            longText,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 24.0),
          Text.rich(
            TextSpan(
              text: 'This is an example of ',
              style: Theme.of(context).textTheme.bodyMedium,
              children: <TextSpan>[
                TextSpan(
                  text: 'rich text',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                TextSpan(
                  text: ' using',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                TextSpan(
                  text: 'TextSpan',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontStyle: FontStyle.italic,
                    color: Colors.green,
                  ),
                ),
                TextSpan(
                  text: '.',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
