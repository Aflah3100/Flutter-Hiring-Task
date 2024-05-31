
import 'package:flutter/material.dart';

class OutdoorButtons extends StatelessWidget {
  const OutdoorButtons({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * 0.04,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(color: Colors.red),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 10, right: 10, top: 0),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  (index != 4) ? 'Outdoor' : '+1',
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: width * 0.01);
        },
        itemCount: 5,
      ),
    );
  }
}
