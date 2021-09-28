import 'package:facebook_app/model/user.dart';
import 'package:facebook_app/ui/styled_componants/component.dart';
import 'package:facebook_app/view_model/cubit/facebook_cubit.dart';
import 'package:facebook_app/view_model/state/facebook_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SideFacebookMessenger extends StatefulWidget {
  const SideFacebookMessenger({Key? key}) : super(key: key);

  @override
  _SideFacebookMessengerState createState() => _SideFacebookMessengerState();
}

class _SideFacebookMessengerState extends State<SideFacebookMessenger> {
  late FacebookCubit _cubit;

  List<User> _users = [];

  @override
  void initState() {
    _cubit = FacebookCubit.get(context)..getUserStory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 20,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                customTextTitle(context: context, text: 'Contact'),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_horiz,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          BlocConsumer<FacebookCubit, FacebookState>(
            listener: (context, state) {
              if (state is SuccessUserFacebookState) {
                _users = state.users;
              }
            },
            builder: (context, state) {
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _users.length,
                itemBuilder: (context, index) {
                  final User currentUser = _users[index];
                  return index > 0
                      ? Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: ListTile(
                            onTap: () => print(currentUser.userName),
                            leading: buildImageProfile(
                              url: currentUser.profileImage,
                              onClick: () {},
                              onlineState: currentUser.onlineState,
                            ),
                            title: customTextTitle(
                                context: context, text: currentUser.userName),
                          ),
                        )
                      : Container();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
