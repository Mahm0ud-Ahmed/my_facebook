import 'dart:ui';

import 'package:facebook_app/entities/model/story.dart';
import 'package:facebook_app/entities/model/user.dart';
import 'package:facebook_app/logic/cubit/facebook_cubit.dart';
import 'package:facebook_app/logic/state/facebook_state.dart';
import 'package:facebook_app/platform.dart';
import 'package:facebook_app/repository/user_data.dart';
import 'package:facebook_app/repository/user_story.dart';
import 'package:facebook_app/ui/constant_ui.dart';
import 'package:facebook_app/ui/styled_componants/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../size_config.dart';

class CreateStory extends StatefulWidget {
  const CreateStory({Key? key}) : super(key: key);

  @override
  _CreateStoryState createState() => _CreateStoryState();
}

class _CreateStoryState extends State<CreateStory> {
  late FacebookCubit _cubit;
  bool _visibile = false;

  @override
  void initState() {
    _cubit = FacebookCubit.get(context)..getUserStory();
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _visibile = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        color: foregroundColor,
        height: 200,
        width: Platform.isDesktop(context)
            ? getProportionateScreenWidth(100)
            : getProportionateScreenWidth(100),
        padding: EdgeInsets.symmetric(
          horizontal: Platform.isMobile(context)
              ? getProportionateScreenWidth(8)
              : getProportionateScreenWidth(4),
          vertical: getProportionateScreenHeight(8),
        ),
        child: BlocBuilder<FacebookCubit, FacebookState>(
          builder: (context, state) {
            return ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: _cubit.stories.length,
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  width: 8,
                );
              },
              itemBuilder: (context, index) {
                User user = _cubit.users[index];
                Story story = _cubit.stories[index];
                // print(_cubit.stories.length);
                return buildStoryItem(
                    context: context,
                    index: index,
                    story: story,
                    user: user,
                    onClick: () {
                      print('Story ${_cubit.users[index].userName}');
                    });
              },
            );
          },
        ),
      ),
    );
  }

  Widget buildStoryItem({
    required BuildContext context,
    required int index,
    required Story story,
    required User user,
    required Function() onClick,
  }) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: InkWell(
            onTap: onClick,
            child: Image(
              width: Platform.isDesktop(context) ? 110 : 110,
              height: 180,
              fit: BoxFit.cover,
              image: index == 0
                  ? NetworkImage(
                      story.storyImage ?? user.profileImage,
                    )
                  : NetworkImage(
                      story.storyImage!,
                    ),
            ),
          ),
        ),
        buildProfileImageStory(index, user.profileImage),
        buildUserNameStory(context, index, user.userName),
      ],
    );
  }

  Widget buildProfileImageStory(int index, String url) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 800),
      top: _visibile ? 4 : -50,
      left: 8,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 500),
        opacity: _visibile ? 1 : 0,
        child: index == 0
            ? const CircleAvatar(
                radius: 18,
                backgroundColor: backgroundColor,
                child: Icon(
                  Icons.add_circle,
                  size: 34,
                ),
              )
            : CircleAvatar(
                radius: 26,
                backgroundColor: facebookColor,
                child: CircleAvatar(
                  radius: 24,
                  backgroundImage: NetworkImage(
                    url,
                  ),
                ),
              ),
      ),
    );
  }

  Widget buildUserNameStory(BuildContext context, int index, String userName) {
    return Positioned(
      bottom: 14,
      left: 8,
      child: SizedBox(
        width: 100,
        child: index == 0
            ? customTextTitle(
                context: context,
                text: 'Create Story',
                textColor: foregroundColor)
            : customTextTitle(
                context: context, text: userName, textColor: foregroundColor),
      ),
    );
  }
}