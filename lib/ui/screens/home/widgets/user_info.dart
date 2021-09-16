import 'package:facebook_app/model/post.dart';
import 'package:facebook_app/model/user.dart';
import 'package:facebook_app/platform.dart';
import 'package:facebook_app/ui/styled_componants/component.dart';
import 'package:flutter/material.dart';

import '../../../../size_config.dart';
import '../../../constant_ui.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({
    Key? key,
    required this.post,
    required this.user,
  }) : super(key: key);
  final Post post;
  final User user;

  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  bool _visible = false;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _visible = true;
      });
    });
    super.initState();
  }

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
          AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            height: _visible ? 45 : 0,
            width: _visible ? 45 : 0,
            child: buildImageProfile(
                url: widget.user.profileImage,
                state: widget.user.state,
                onClick: () {
                  print(widget.user.userName);
                }),
          ),
          const SizedBox(
            width: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              customTextTitle(context: context, text: widget.user.userName),
              Row(
                children: [
                  customTextInfo(
                      context: context, text: '${widget.post.timeAgo} • '),
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
