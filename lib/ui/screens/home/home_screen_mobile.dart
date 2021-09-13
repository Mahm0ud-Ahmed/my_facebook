import 'package:facebook_app/logic/cubit/facebook_cubit.dart';
import 'package:facebook_app/logic/state/facebook_state.dart';
import 'package:facebook_app/ui/constant_ui.dart';
import 'package:facebook_app/ui/screens/home/widgets/app_bar_mobile.dart';
import 'package:facebook_app/ui/screens/home/widgets/create_header.dart';
import 'package:facebook_app/ui/screens/home/widgets/create_post.dart';
import 'package:facebook_app/ui/screens/home/widgets/create_story.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenMobile extends StatelessWidget {
  const HomeScreenMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: BlocBuilder<FacebookCubit, FacebookState>(
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              CustomAppBarMobile(),
              const SliverToBoxAdapter(
                child: CreateHeader(),
              ),
              const SliverPadding(
                padding: EdgeInsets.symmetric(
                  vertical: 6,
                ),
                sliver: CreateStory(),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return const Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: CreatePost(),
                    );
                  },
                  childCount: 1,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
