
import 'package:flutter/material.dart';

class HeadingContainer extends StatelessWidget {
  const HeadingContainer({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25.0),
      decoration: const BoxDecoration(color: Colors.red),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Title-1
              const Text(
                'The weekend',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              //Title-2
              const Text(
                'Community.  +11K Members',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 18.0),
              ),
            ],
          ),
          //Share Icon
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: Colors.white, width: 1.3),
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.share),
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
