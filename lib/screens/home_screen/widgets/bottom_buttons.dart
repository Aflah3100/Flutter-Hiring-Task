
import 'package:flutter/material.dart';

class MuteNotificationButton extends StatelessWidget {
  const MuteNotificationButton({
    super.key,
    required this.muteToggleNotifier,
  });

  final ValueNotifier<bool> muteToggleNotifier;

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
class ReportButton extends StatelessWidget {
  const ReportButton({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return TextButton(
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
        ));
  }
}

class ExitCommunityButton extends StatelessWidget {
  const ExitCommunityButton({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return TextButton(
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
        ));
  }
}

class EncryptionButton extends StatelessWidget {
  const EncryptionButton({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return TextButton(
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
        ));
  }
}

class ClearChatButton extends StatelessWidget {
  const ClearChatButton({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return TextButton(
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
        ));
  }
}
