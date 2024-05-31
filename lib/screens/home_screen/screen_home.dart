import 'package:flutter/material.dart';
import 'package:flutter_assignment/screens/home_screen/widgets/animation_container.dart';
import 'package:flutter_assignment/screens/home_screen/widgets/bottom_buttons.dart';
import 'package:flutter_assignment/screens/home_screen/widgets/heading_container.dart';
import 'package:flutter_assignment/screens/home_screen/widgets/members_list.dart';
import 'package:flutter_assignment/screens/home_screen/widgets/outdoor_buttons.dart';
import 'package:flutter_assignment/screens/home_screen/widgets/text_details.dart';

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
                HeadingContainer(height: height),
                //text-details-builder
                ValueListenableBuilder<bool>(
                  valueListenable: isExpandedNotifier,
                  builder: (ctx, newValue, _) {
                    return TextDetails(
                        width: width, isExpandedNotifier: isExpandedNotifier);
                  },
                ),
                //Outdoor Buttons
                Padding(
                  padding: EdgeInsets.all(width * 0.02),
                  child: OutdoorButtons(height: height, width: width),
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
                    MuteNotificationButton(
                        muteToggleNotifier: muteToggleNotifier),
                    //clear-chat-button
                    ClearChatButton(width: width),
                    //Encryption button
                    EncryptionButton(width: width),
                    //Exit community
                    ExitCommunityButton(width: width),
                    //report button
                    ReportButton(width: width),
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
                    MembersList(followNotifier: followNotifier),
                  ]),
                ),
              ],
            ),
            //Animation Container
            if (_showOverlay)
              AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                top: 0,
                left: 0,
                right: 0,
                child: AnimationedContainer(height: height, width: width),
              )
          ],
        ),
      ),
    );
  }
}
