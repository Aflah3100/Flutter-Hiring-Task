import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});
  ValueNotifier<bool> isExpandedNotifier = ValueNotifier(false);
  ValueNotifier<bool> muteToggleNotifier = ValueNotifier(false);
  ValueNotifier<int> followNotifier = ValueNotifier(-1);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            //top-image
            Image.asset('assets/images/image.jpeg'),
            //heading-container
            Container(
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
            ),
            //details-container
            ValueListenableBuilder<bool>(
              valueListenable: isExpandedNotifier,
              builder: (ctx, newValue, _) {
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
              },
            ),
            //Outdoor Buttons
            Padding(
              padding: EdgeInsets.all(width * 0.02),
              child: SizedBox(
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
                        padding:
                            const EdgeInsets.only(left: 10, right: 10, top: 0),
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
              ),
            ),

            //Media,docs heading
            Padding(
              padding: EdgeInsets.all(width * 0.03),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Media, docs and links',
                    style:
                        TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_forward_ios))
                ],
              ),
            ),
            //Images
            Padding(
              padding: EdgeInsets.all(width * 0.02),
              child: SizedBox(
                height: height * 0.20,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.asset(
                          'assets/images/image.jpeg',
                          width: width * 0.40,
                          fit: BoxFit.cover,
                        ));
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(width: width * 0.02);
                  },
                  itemCount: 5,
                ),
              ),
            ),

            //Bottom Buttons
            Padding(
              padding: EdgeInsets.all(width * 0.02),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Mute Notification',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    ValueListenableBuilder(
                        valueListenable: muteToggleNotifier,
                        builder: (ctx, newValue, _) {
                          return Switch(
                              value: newValue,
                              activeColor: Colors.grey,
                              activeTrackColor: Colors.white,
                              inactiveThumbColor: Colors.grey,
                              inactiveTrackColor: Colors.white,
                              onChanged: (val) =>
                                  muteToggleNotifier.value = val);
                        })
                  ],
                ),
                //clear-chat-button
                TextButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        const Icon(
                          Icons.delete_outline,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: width * 0.02,
                        ),
                        const Text(
                          'Clear chat',
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        )
                      ],
                    )),
                //Encryption button
                TextButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        const Icon(
                          Icons.lock_outline,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: width * 0.02,
                        ),
                        const Text(
                          'Encryption',
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        )
                      ],
                    )),
                //Exit community
                TextButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        const Icon(
                          Icons.exit_to_app_outlined,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: width * 0.02,
                        ),
                        const Text(
                          'Exit Community',
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.red),
                        )
                      ],
                    )),
                //report button
                TextButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        const Icon(
                          Icons.thumb_down_outlined,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: width * 0.02,
                        ),
                        const Text(
                          'Report',
                          style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.red),
                        )
                      ],
                    )),
                //Members Column
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Members',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 232, 228, 228)),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.search_outlined,
                            color: Colors.black,
                          )),
                    )
                  ],
                ),
                //Members-List
                Column(
                  children: List.generate(10, (index) {
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
                        backgroundImage:
                            AssetImage('assets/images/profile_picture.jpeg'),
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
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            );
                          }),
                    );
                  }),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
