import 'package:facebook_app/repository/user_data.dart';
import 'package:facebook_app/ui/styled_componants/component.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constant_ui.dart';

class CustomAppBarWeb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      height: 60.0,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 4),
            blurRadius: 4.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const FaIcon(
            FontAwesomeIcons.facebook,
            size: 45,
            color: facebookColor,
          ),
          const SizedBox(
            width: 8,
          ),
          SizedBox(
            width: 350,
            child: customTextField(
              hintText: 'Search Facebook',
            ),
          ),
          // const Spacer(),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 34,
                  height: 34,
                  child: buildImageProfile(
                    url: myUser.profileImage,
                    onClick: () => print('Profile Image'),
                  ),
                ),
                spaceWidth(),
                customTextTitle(context: context, text: myUser.userName),
                spaceWidth(space: 48),
                customCircleIcon(
                  icon: Icons.add,
                  onClick: () => print('Add'),
                ),
                spaceWidth(),
                customCircleIcon(
                  icon: FontAwesomeIcons.facebookMessenger,
                  onClick: () => print('Messenger'),
                ),
                spaceWidth(),
                customCircleIcon(
                  icon: Icons.notifications_active,
                  onClick: () => print('Notifications'),
                ),
                spaceWidth(),
                customCircleIcon(
                  icon: Icons.arrow_drop_down,
                  onClick: () => print('More Option'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget spaceWidth({double space = 8}) {
    return SizedBox(
      width: space,
    );
  }
}
