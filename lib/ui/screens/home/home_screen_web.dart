import 'package:facebook_app/size_config.dart';
import 'package:facebook_app/ui/screens/home/widgets/app_bar_web.dart';
import 'package:facebook_app/ui/screens/home/widgets/create_header.dart';
import 'package:facebook_app/ui/screens/home/widgets/create_post.dart';
import 'package:facebook_app/ui/screens/home/widgets/create_story.dart';
import 'package:facebook_app/ui/screens/home/widgets/side_facebook_messenger.dart';
import 'package:facebook_app/ui/screens/home/widgets/side_profile_option.dart';
import 'package:flutter/material.dart';

class HomeScreenWeb extends StatelessWidget {
  const HomeScreenWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff1f2f6),
      appBar: PreferredSize(
        preferredSize: Size(SizeConfig.screenWidth, 100.0),
        child: CustomAppBarWeb(),
      ),
      body: SingleChildScrollView(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Flexible(
              child: SizedBox(
                width: 300,
                child: SideProfileOption(),
              ),
            ),
            Flexible(
              flex: 2,
              child: SizedBox(
                width: 800,
                child: CustomScrollView(
                  shrinkWrap: true,
                  slivers: [
                    const SliverPadding(
                      padding: EdgeInsets.only(top: 25, bottom: 12),
                      sliver: CreateStory(),
                    ),
                    const SliverToBoxAdapter(
                      child: CreateHeader(),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return const Padding(
                            padding: EdgeInsets.only(bottom: 40),
                            child: CreatePost(),
                          );
                        },
                        childCount: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Flexible(
              child: SizedBox(
                width: 300,
                child: SideFacebookMessenger(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
