
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TextDetails extends StatelessWidget {
  const TextDetails({
    super.key,
    required this.width,
    required this.isExpandedNotifier,
  });

  final double width;
  final ValueNotifier<bool> isExpandedNotifier;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(width * 0.04),
      child: Column(
        children: [
          RichText(
            text: TextSpan(
              text: isExpandedNotifier.value
                  ? 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book. '
                  : '${'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book. '.substring(0, 150)}....',
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w400),
              children: [
                TextSpan(
                    text: isExpandedNotifier.value
                        ? 'Show Less'
                        : 'Read More',
                    style: const TextStyle(color: Colors.red),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        isExpandedNotifier.value =
                            !isExpandedNotifier.value;
                      }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
