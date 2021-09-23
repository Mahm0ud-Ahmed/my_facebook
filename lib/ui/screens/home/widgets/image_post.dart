import 'package:carousel_slider/carousel_slider.dart';
import 'package:facebook_app/platform.dart';
import 'package:facebook_app/size_config.dart';
import 'package:flutter/material.dart';

class ImagePost extends StatelessWidget {
  ImagePost({Key? key, required this.postImage}) : super(key: key);
  List<String> postImage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          vertical: getProportionateScreenHeight(8),
          horizontal: Platform.isDesktop(context)
              ? getProportionateScreenWidth(2)
              : getProportionateScreenWidth(0),
        ),
        child: postImage.isEmpty
            ? Container()
            : postImage.length == 1
                ? Image(
                    width: double.infinity,
                    fit: BoxFit.fill,
                    image: NetworkImage(postImage[0]),
                  )
                : CarouselSlider(
                    options: CarouselOptions(
                      height: 400,
                      aspectRatio: 2 / 3,
                      viewportFraction: 0.75,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: false,
                    ),
                    items: postImage
                        .map(
                          (image) => Image(
                            fit: BoxFit.fill,
                            image: NetworkImage(image),
                          ),
                        )
                        .toList(),
                  ),
      ),
    );
  }
}
