
import 'package:flutter/material.dart';

class AnimationedContainer extends StatelessWidget {
  const AnimationedContainer({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
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
        ));
  }
}

