import 'package:facebook_app/ui/styled_componants/component.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constant_ui.dart';

class ReactButton extends StatelessWidget {
  const ReactButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        children: [
          customBtnIcon(
            context: context,
            label: 'Like',
            onClick: () {
              print('Like');
            },
            icon: const FaIcon(
              FontAwesomeIcons.thumbsUp,
              color: grayColor,
            ),
          ),
          customBtnIcon(
            context: context,
            label: 'Comment',
            onClick: () {
              print('Comment');
            },
            icon: const FaIcon(
              FontAwesomeIcons.commentAlt,
              color: grayColor,
            ),
          ),
          customBtnIcon(
            context: context,
            label: 'Share',
            onClick: () {
              print('Share');
            },
            icon: const FaIcon(
              FontAwesomeIcons.share,
              color: grayColor,
            ),
          ),
        ],
      ),
    );
  }
}
