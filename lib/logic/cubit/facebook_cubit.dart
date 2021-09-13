import 'package:facebook_app/entities/model/post.dart';
import 'package:facebook_app/entities/model/story.dart';
import 'package:facebook_app/entities/model/user.dart';
import 'package:facebook_app/logic/state/facebook_state.dart';
import 'package:facebook_app/repository/user_data.dart';
import 'package:facebook_app/repository/user_post.dart';
import 'package:facebook_app/repository/user_story.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FacebookCubit extends Cubit<FacebookState> {
  FacebookCubit() : super(InitialFacebookState());

  static FacebookCubit get(BuildContext context) =>
      BlocProvider.of<FacebookCubit>(context);

  late User user;
  List<User> users = [];

  late Story story;
  List<Story> stories = [];

  late Post post;
  List<Post> posts = [];

  Map<int, bool> textLineState = {};

  void getUserInfo() {
    clearAllData(users);
    emit(LoadingUserFacebookState());
    try {
      user = myUser;
      allUser.map((user) => users.add(user)).toList();
      emit(SuccessUserFacebookState());
    } catch (error) {
      print(error.toString());
      emit(ErrorUserFacebookState());
    }
  }

  void getUserStory() {
    clearAllData(stories);
    emit(LoadingStoryFacebookState());
    try {
      story = myStory;
      allStory.map((story) => stories.add(story)).toList();
      emit(SuccessStoryFacebookState());
    } catch (error) {
      print(error.toString());
      emit(ErrorStoryFacebookState());
    }
  }

  void getPostData() {
    clearAllData(posts);
    if (textLineState.isNotEmpty) {
      textLineState.clear();
    }
    emit(LoadingPostFacebookState());
    try {
      post = myPost;
      allPost.map((post) {
        posts.add(post);
        textLineState.addAll({post.id: false});
      }).toList();

      emit(SuccessPostFacebookState());
    } catch (error) {
      print(error.toString());
      emit(ErrorPostFacebookState());
    }
  }

  void clearAllData(List<dynamic> data) {
    if (data.isNotEmpty) {
      data.clear();
    }
  }

  void changeLineState(int id) {
    textLineState[id] = !textLineState[id]!;
    emit(ChangeTextLineState());
  }
}
