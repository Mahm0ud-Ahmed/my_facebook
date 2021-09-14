import 'package:facebook_app/model/post.dart';
import 'package:facebook_app/platform.dart';
import 'package:facebook_app/size_config.dart';
import 'package:facebook_app/ui/styled_componants/component.dart';
import 'package:facebook_app/view_model/cubit/facebook_cubit.dart';
import 'package:facebook_app/view_model/state/facebook_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextContent extends StatefulWidget {
  const TextContent({Key? key, required this.post, required this.index})
      : super(key: key);
  final Post post;
  final index;

  @override
  _TextContentState createState() => _TextContentState();
}

class _TextContentState extends State<TextContent> {
  late FacebookCubit _cubit;
  late bool lineState;

  @override
  void initState() {
    _cubit = FacebookCubit.get(context);
    lineState = _cubit.textLineState[widget.post.id]!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenHeight(10),
        horizontal: Platform.isMobile(context)
            ? getProportionateScreenWidth(6)
            : getProportionateScreenWidth(2),
      ),
      child: BlocBuilder<FacebookCubit, FacebookState>(
        builder: (context, state) {
          lineState = _cubit.textLineState[widget.post.id]!;
          if (widget.post.textBody.isNotEmpty) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (lineState)
                  Text(
                    widget.post.textBody,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontWeight: FontWeight.normal,
                          height: 1.4,
                        ),
                    textAlign: TextAlign.start,
                  )
                else
                  customTextTitle(
                    context: context,
                    text: widget.post.textBody,
                    fontWeight: FontWeight.normal,
                    lineHeight: 1.4,
                  ),
                buildStateButton(
                    context,
                    _cubit.textLineState.keys.elementAt(widget.index as int),
                    _cubit.textLineState[widget.post.id]!)
              ],
            );
          } else {
            return Container();
          }
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
        child: state ? const Text('See Less') : const Text('See More'),
      ),
    );
  }
}
