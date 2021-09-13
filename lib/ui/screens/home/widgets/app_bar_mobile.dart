import 'package:facebook_app/platform.dart';
import 'package:facebook_app/ui/styled_componants/component.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constant_ui.dart';

class CustomAppBarMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      floating: true,
      title: const Text(
        'facebook',
        style: TextStyle(
          color: facebookColor,
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        customCircleIcon(icon: Icons.search, onClick: () => print('Search')),
        const SizedBox(
          width: 8,
        ),
        customCircleIcon(
            icon: FontAwesomeIcons.facebookMessenger,
            onClick: () => print('Messenger')),
        const SizedBox(
          width: 8,
        ),
      ],
    );
  }
}
