import 'package:facebook_app/entities/model/post.dart';
import 'package:facebook_app/platform.dart';
import 'package:facebook_app/ui/styled_componants/component.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../size_config.dart';
import '../../../constant_ui.dart';

class PostReact extends StatelessWidget {
  const PostReact({Key? key, required this.post}) : super(key: key);
  final Post post;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenHeight(6),
        horizontal: Platform.isMobile(context)
            ? getProportionateScreenWidth(10)
            : getProportionateScreenWidth(2),
      ),
      child: Row(
        children: [
          Row(
            children: [
              customTextInfo(
                context: context,
                text: post.likes.toString(),
              ),
              const SizedBox(
                width: 4,
              ),
              const CircleAvatar(
                backgroundColor: facebookColor,
                radius: 8,
                child: FaIcon(
                  FontAwesomeIcons.solidThumbsUp,
                  color: foregroundColor,
                  size: 8,
                ),
              ),
            ],
          ),
          const Spacer(),
          customTextInfo(
              context: context,
              text:
                  '${post.comments.toString()} Comments • ${post.shares.toString()} Shares'),
        ],
      ),
    );
  }
}
