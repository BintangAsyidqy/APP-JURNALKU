import 'package:flutter/material.dart';

/// Reusable header row that shows the centered name/class and a tappable avatar on the right.
///
/// - `onAvatarTapDown` is provided so callers can show a menu positioned at the tap location.
class ProfileHeader extends StatelessWidget {
  final String name;
  final String subtitle;
  final ImageProvider? avatarImage;
  final void Function(TapDownDetails)? onAvatarTapDown;

  const ProfileHeader({
    Key? key,
    this.name = 'Muhamad Azmi Naziyulloh',
    this.subtitle = 'PPLG XII-4',
    this.avatarImage,
    this.onAvatarTapDown,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: kToolbarHeight,
            child: Align(
              alignment: Alignment.centerRight,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: const TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        GestureDetector(
          onTapDown: onAvatarTapDown,
          child: CircleAvatar(
            radius: 18,
            backgroundImage:
                avatarImage ??
                const NetworkImage('https://picsum.photos/seed/profile/200'),
          ),
        ),
      ],
    );
  }
}
