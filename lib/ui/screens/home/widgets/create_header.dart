import 'package:facebook_app/platform.dart';
import 'package:facebook_app/repository/user_data.dart';
import 'package:facebook_app/size_config.dart';
import 'package:facebook_app/ui/constant_ui.dart';
import 'package:facebook_app/ui/styled_componants/component.dart';
import 'package:facebook_app/view_model/cubit/facebook_cubit.dart';
import 'package:facebook_app/view_model/state/facebook_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateHeader extends StatefulWidget {
  const CreateHeader({Key? key}) : super(key: key);

  @override
  _CreateHeaderState createState() => _CreateHeaderState();
}

class _CreateHeaderState extends State<CreateHeader> {
  late FacebookCubit _cubit;

  @override
  void initState() {
    _cubit = FacebookCubit.get(context)..getUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: foregroundColor,
      child: Column(
        children: [
          BlocBuilder<FacebookCubit, FacebookState>(
            builder: (context, state) {
              return buildCreatePost(context, myUser.profileImage);
            },
          ),
          const SizedBox(
            height: 8,
          ),
          const Divider(
            color: dividerColor,
          ),
          buildRowItem(context),
        ],
      ),
    );
  }

  Widget buildCreatePost(BuildContext context, String profileImage) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Platform.isDesktop(context)
            ? getProportionateScreenWidth(2)
            : getProportionateScreenWidth(4),
        vertical:
            Platform.isDesktop(context) ? getProportionateScreenHeight(12) : 0,
      ),
      child: Row(
        children: [
          buildImageProfile(
              url: profileImage,
              onClick: () {
                print('Profile Image');
              }),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: customTextField(hintText: 'What\'s on your mind?'),
          ),
        ],
      ),
    );
  }

  Widget buildRowItem(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        height: Platform.isMobile(context) ? 40 : 50,
        child: Row(
          children: [
            customBtnIcon(
              context: context,
              label: 'Video',
              onClick: () {
                print('Video');
              },
              icon: const Icon(
                Icons.videocam,
                color: Colors.redAccent,
                size: 20,
              ),
            ),
            verticalDivider(),
            customBtnIcon(
              context: context,
              label: 'Photo',
              onClick: () {
                print('Photo');
              },
              icon: const Icon(
                Icons.photo_library,
                color: Colors.lightGreen,
                size: 20,
              ),
            ),
            verticalDivider(),
            customBtnIcon(
              context: context,
              label: 'Live',
              onClick: () {
                print('Live');
              },
              icon: const Icon(
                Icons.video_call,
                color: Colors.purpleAccent,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget verticalDivider() {
    return const VerticalDivider(
      color: dividerColor,
      indent: 6,
      endIndent: 6,
    );
  }
}
