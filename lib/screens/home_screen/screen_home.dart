import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ScreenHome extends StatefulWidget {
  ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  final ScrollController _scrollController = ScrollController();
  bool _showOverlay = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  void _scrollListener() {
    final bool shouldShowOverlay = _scrollController.offset > 250;

    if (shouldShowOverlay != _showOverlay) {
      setState(() {
        _showOverlay = shouldShowOverlay;
      });
    }
  }

  void _scrollToMembers() {
    _scrollController.animateTo(
      (MediaQuery.of(context).size.height) -
          (MediaQuery.of(context).size.height * 0.01),
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  //Notifiers
  ValueNotifier<bool> isExpandedNotifier = ValueNotifier(false);
  ValueNotifier<bool> muteToggleNotifier = ValueNotifier(false);
  ValueNotifier<int> followNotifier = ValueNotifier(-1);
  ValueNotifier<bool> searchNotifier = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              controller: _scrollController,
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
                        style: TextStyle(
                            fontSize: 23.0, fontWeight: FontWeight.bold),
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
                    ValueListenableBuilder(
                        valueListenable: (searchNotifier),
                        builder: (ctx, value, _) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              (!searchNotifier.value)
                                  ? const Text(
                                      'Members',
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold),
                                    )
                                  : SizedBox(
                                      width: width * 0.70,
                                      child: TextFormField(
                                        keyboardType: TextInputType.name,
                                        decoration: InputDecoration(
                                          fillColor: const Color.fromARGB(
                                              204, 224, 224, 224),
                                          hintText: 'Search member',
                                          filled: true,
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 10.0),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            borderSide: const BorderSide(
                                                color: Colors.transparent),
                                          ),
                                        ),
                                      ),
                                    ),
                              Container(
                                width:
                                    (searchNotifier.value) ? width * 0.20 : 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    shape: (searchNotifier.value)
                                        ? BoxShape.rectangle
                                        : BoxShape.circle,
                                    borderRadius: (searchNotifier.value)
                                        ? BorderRadius.circular(20.0)
                                        : null,
                                    color: const Color.fromARGB(
                                        255, 232, 228, 228)),
                                child: (searchNotifier.value)
                                    ? TextButton(
                                        onPressed: () {
                                          searchNotifier.value =
                                              !searchNotifier.value;
                                        },
                                        child: const Text(
                                          'Cancel',
                                          style: TextStyle(color: Colors.black),
                                        ))
                                    : IconButton(
                                        onPressed: () {
                                          _scrollToMembers();
                                          searchNotifier.value =
                                              !searchNotifier.value;
                                        },
                                        icon: const Icon(
                                          Icons.search_outlined,
                                          color: Colors.black,
                                        )),
                              )
                            ],
                          );
                        }),
                    //Members-List
                    Column(
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
                    ),
                  ]),
                ),
              ],
            ),
            if (_showOverlay)
              AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 196, 53, 43)),
                    child: ListTile(
                      leading: const CircleAvatar(
                        radius: 35.0,
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage('assets/images/image.jpeg'),
                      ),
                      title: const Text(
                        'The weekend',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      ),
                      subtitle: const Text(
                        'Community.  +11K Members',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 15.0),
                      ),
                      trailing: IconButton(
                          onPressed: () {
                            //Bottom Sheet Pop-Up
                            showModalBottomSheet<void>(
                              context: context,
                              builder: (BuildContext context) {
                                return Padding(
                                  padding: EdgeInsets.all(height * 0.02),
                                  child: SizedBox(
                                    height: height * 0.16,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                //Invite button
                                                TextButton(
                                                    onPressed: () {},
                                                    child: Row(
                                                      children: [
                                                        const Icon(
                                                          Icons
                                                              .insert_link_outlined,
                                                          color: Colors.black,
                                                        ),
                                                        SizedBox(
                                                          width: width * 0.02,
                                                        ),
                                                        const Text(
                                                          'Invite',
                                                          style: TextStyle(
                                                              fontSize: 20.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color:
                                                                  Colors.black),
                                                        )
                                                      ],
                                                    )),
                                              ],
                                            ),
                                            //Add member button
                                            TextButton(
                                                onPressed: () {},
                                                child: Row(
                                                  children: [
                                                    const Icon(
                                                      Icons.person_add_outlined,
                                                      color: Colors.black,
                                                    ),
                                                    SizedBox(
                                                      width: width * 0.02,
                                                    ),
                                                    const Text(
                                                      'Add member',
                                                      style: TextStyle(
                                                          fontSize: 20.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black),
                                                    )
                                                  ],
                                                )),
                                            //Add group button
                                            TextButton(
                                                onPressed: () {},
                                                child: Row(
                                                  children: [
                                                    const Icon(
                                                      Icons.group_add_outlined,
                                                      color: Colors.black,
                                                    ),
                                                    SizedBox(
                                                      width: width * 0.02,
                                                    ),
                                                    const Text(
                                                      'Add Group',
                                                      style: TextStyle(
                                                          fontSize: 20.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black),
                                                    )
                                                  ],
                                                ))
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          icon: const Icon(
                            Icons.more_vert_outlined,
                            color: Colors.white,
                          )),
                    )),
              )
          ],
        ),
      ),
    );
  }
}
