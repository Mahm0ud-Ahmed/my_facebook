import 'package:facebook_app/entities/model/post.dart';
import 'package:facebook_app/entities/model/user.dart';
import 'package:facebook_app/logic/cubit/facebook_cubit.dart';
import 'package:facebook_app/logic/state/facebook_state.dart';
import 'package:facebook_app/platform.dart';
import 'package:facebook_app/size_config.dart';
import 'package:facebook_app/ui/constant_ui.dart';
import 'package:facebook_app/ui/screens/home/widgets/post_react.dart';
import 'package:facebook_app/ui/screens/home/widgets/react_button.dart';
import 'package:facebook_app/ui/screens/home/widgets/text_content.dart';
import 'package:facebook_app/ui/screens/home/widgets/user_info.dart';
import 'package:facebook_app/ui/styled_componants/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'image_post.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({Key? key}) : super(key: key);

  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  late FacebookCubit _cubit;

  @override
  void initState() {
    _cubit = FacebookCubit.get(context)
      ..getPostData()
      ..getUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: BlocBuilder<FacebookCubit, FacebookState>(
        builder: (context, state) {
          return ListView.separated(
            separatorBuilder: (context, index) {
              return Container(
                width: double.infinity,
                height: 6,
                color: dividerColor,
              );
            },
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemCount: _cubit.posts.length,
            itemBuilder: (context, index) {
              final User user = _cubit.users[index];
              final Post post = _cubit.posts[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UserInfo(post: post, user: user),
                  TextContent(
                    post: post,
                    index: index,
                  ),
                  ImagePost(
                    postImage: post.postImage,
                  ),
                  PostReact(post: post),
                  const Divider(
                    color: dividerColor,
                  ),
                  const ReactButton(),
                ],
              );
            },
          );
        },
      ),
    );
  }

  Widget buildStateButton(BuildContext context, int id, bool state) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Platform.isDesktop(context)
            ? getProportionateScreenWidth(2)
            : getProportionateScreenWidth(0),
      ),
      child: TextButton(
        onPressed: () {
          _cubit.changeLineState(id);
        },
        child: state ? const Text('See Less') : const Text('See More Detail'),
      ),
    );
  }
}
