import 'package:facebook_app/model/post.dart';
import 'package:facebook_app/model/story.dart';
import 'package:facebook_app/model/user.dart';
import 'package:facebook_app/repository/facebook_repository.dart';
import 'package:facebook_app/view_model/state/facebook_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FacebookCubit extends Cubit<FacebookState> {
  FacebookCubit() : super(InitialFacebookState());

  static FacebookCubit get(BuildContext context) =>
      BlocProvider.of<FacebookCubit>(context);

  final FacebookRepository _repository = FacebookRepository.getInstance();

  Map<int, bool> textLineState = {};

  void getUserInfo() {
    _repository.getAllUsers().then((data) {
      emit(SuccessUserFacebookState(users: data));
    }).catchError((error) {
      print(error.toString());
      emit(ErrorUserFacebookState());
    });
  }

  void getUserStory() {
    _repository.getAllStories().then((data) {
      emit(SuccessStoryFacebookState(stories: data));
    }).catchError((error) {
      print(error.toString());
      emit(ErrorStoryFacebookState());
    });
  }

  void getPostData() {
    _repository.getAllPosts().then((data) {
      addLineState(data);
      emit(SuccessPostFacebookState(posts: data));
    }).catchError((error) {
      print(error.toString());
      emit(ErrorPostFacebookState());
    });
  }

  void addLineState(List<Post> posts) {
    posts.forEach(
      (post) => textLineState.addAll({post.id: false}),
    );
  }

  void changeLineState(int id) {
    textLineState[id] = !textLineState[id]!;
    emit(ChangeTextLineState());
  }

  User getUser(List<User> users, int userId) {
    return users.firstWhere((element) {
      if (element.id == userId) {
        return true;
      } else {
        return false;
      }
    });
  }
}
