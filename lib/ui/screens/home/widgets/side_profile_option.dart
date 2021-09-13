import 'package:facebook_app/repository/user_data.dart';
import 'package:facebook_app/ui/constant_ui.dart';
import 'package:facebook_app/ui/styled_componants/component.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SideProfileOption extends StatelessWidget {
  const SideProfileOption({Key? key}) : super(key: key);
  final List<Icon> icons = const [
    Icon(
      Icons.live_tv,
      color: Colors.blueAccent,
    ),
    Icon(
      FontAwesomeIcons.calendarAlt,
      color: Colors.pinkAccent,
    ),
    Icon(
      FontAwesomeIcons.userFriends,
      color: Colors.lightGreen,
    ),
    Icon(
      FontAwesomeIcons.solidBookmark,
      color: Colors.pink,
    ),
    Icon(
      Icons.access_time,
      color: Colors.blueAccent,
    ),
  ];
  final List<String> title = const [
    'Watch',
    'Events',
    'Friends',
    'Save Element',
    'Memories'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        children: [
          ListTile(
            leading:
                buildImageProfile(url: myUser.profileImage, onClick: () {}),
            title: customTextTitle(context: context, text: myUser.userName),
            onTap: () => print('My Profile'),
          ),
          const SizedBox(
            height: 24,
          ),
          ListView.builder(
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            itemCount: icons.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: icons[index],
                title: customTextTitle(context: context, text: title[index]),
                onTap: () => print('My Profile'),
              );
            },
          ),
          SizedBox(
            width: double.infinity,
            height: 40,
            child: ElevatedButton.icon(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Colors.grey.shade200),
              ),
              onPressed: () {},
              icon: const Icon(
                Icons.keyboard_arrow_down_rounded,
                color: Colors.grey,
              ),
              label: Text(
                'See More',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          )
        ],
      ),
    );
  }
}
