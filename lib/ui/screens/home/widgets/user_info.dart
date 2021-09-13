import 'package:facebook_app/model/post.dart';
import 'package:facebook_app/model/user.dart';
import 'package:facebook_app/platform.dart';
import 'package:facebook_app/ui/styled_componants/component.dart';
import 'package:flutter/material.dart';

import '../../../../size_config.dart';
import '../../../constant_ui.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({
    Key? key,
    required this.post,
    required this.user,
  }) : super(key: key);
  final Post post;
  final User user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenHeight(12),
        horizontal: Platform.isMobile(context)
            ? getProportionateScreenWidth(10)
            : getProportionateScreenWidth(2),
      ),
      child: Row(
        children: [
          buildImageProfile(
              url: user.profileImage,
              state: user.state,
              onClick: () {
                print(user.userName);
              }),
          const SizedBox(
            width: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customTextTitle(context: context, text: user.userName),
              Row(
                children: [
                  customTextInfo(context: context, text: '${post.timeAgo} • '),
                  const Icon(
                    Icons.public,
                    color: grayColor,
                    size: 14.0,
                  )
                ],
              ),
            ],
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              print('More Option');
            },
            icon: const Icon(
              Icons.more_horiz,
              color: grayColor,
            ),
          ),
        ],
      ),
    );
  }
}
