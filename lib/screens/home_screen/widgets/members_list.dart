import 'package:flutter/material.dart';

class MembersList extends StatelessWidget {
  const MembersList({
    super.key,
    required this.followNotifier,
  });

  final ValueNotifier<int> followNotifier;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(20, (index) {
        return ListTile(
          title: const Text(
            'Yashika',
            style: TextStyle(
                fontSize: 17.0, fontWeight: FontWeight.bold),
          ),
          subtitle: const Text(
            '29, India',
            style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
                color: Colors.grey),
          ),
          leading: const CircleAvatar(
            radius: 35.0,
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage(
                'assets/images/profile_picture.jpeg'),
          ),
          trailing: ValueListenableBuilder(
              valueListenable: followNotifier,
              builder: (ctx, newvalue, _) {
                return Container(
                  decoration: BoxDecoration(
                    color: followNotifier.value == index
                        ? Colors.grey
                        : Colors.red,
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(
                        color: followNotifier.value == index
                            ? Colors.grey
                            : Colors.red),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0),
                    child: TextButton(
                      onPressed: () {
                        followNotifier.value = index;
                      },
                      child: Text(
                        (followNotifier.value == index)
                            ? 'Following'
                            : 'Add',
                        style: const TextStyle(
                            color: Colors.white),
                      ),
                    ),
                  ),
                );
              }),
        );
      }),
    );
  }
}

