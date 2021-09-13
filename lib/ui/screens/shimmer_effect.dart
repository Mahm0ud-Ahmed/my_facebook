import 'package:facebook_app/platform.dart';
import 'package:facebook_app/ui/constant_ui.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffect extends StatelessWidget {
  const ShimmerEffect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Shimmer.fromColors(
              highlightColor: Colors.grey.shade200,
              baseColor: Colors.grey.shade400,
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundColor: backgroundColor,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: Platform.isMobile(context) ? 300 : 450,
                            height: 16,
                            color: backgroundColor,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Container(
                            width: Platform.isMobile(context) ? 200 : 350,
                            height: 16,
                            color: backgroundColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    width: Platform.isMobile(context) ? 400 : 600,
                    height: Platform.isMobile(context) ? 250 : 350,
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
