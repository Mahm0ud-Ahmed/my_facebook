import 'package:facebook_app/model/post.dart';
import 'package:facebook_app/model/user.dart';
import 'package:facebook_app/platform.dart';
import 'package:facebook_app/size_config.dart';
import 'package:facebook_app/ui/constant_ui.dart';
import 'package:facebook_app/ui/screens/home/widgets/post_react.dart';
import 'package:facebook_app/ui/screens/home/widgets/react_button.dart';
import 'package:facebook_app/ui/screens/home/widgets/text_content.dart';
import 'package:facebook_app/ui/screens/home/widgets/user_info.dart';
import 'package:facebook_app/view_model/cubit/facebook_cubit.dart';
import 'package:facebook_app/view_model/state/facebook_state.dart';
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

  List<Post> _posts = [];
  List<User> _users = [];

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
      child: BlocConsumer<FacebookCubit, FacebookState>(
        listener: (context, state) {
          if (state is SuccessPostFacebookState) {
            _posts = state.posts;
          }
          if (state is SuccessUserFacebookState) {
            _users = state.users;
          }
        },
        builder: (context, state) {
          if (_users.isNotEmpty) {
            return ListView.separated(
              separatorBuilder: (context, index) {
                return Container(
                  width: double.infinity,
                  height: 8,
                  color: dividerColor,
                );
              },
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemCount: _posts.length,
              itemBuilder: (context, index) {
                final Post post = _posts[index];
                // final User user = _cubit.users[index];
                final User user = _cubit.getUser(_users, post.userId);

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
          }
          return Container();
        },
      ),
    );
  }
}
