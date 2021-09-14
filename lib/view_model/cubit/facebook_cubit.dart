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

  List<User> users = [];
  List<Story> stories = [];
  List<Post> posts = [];

  Map<int, bool> textLineState = {};

  Future<List<User>> getUserInfo() async {
    emit(LoadingUserFacebookState());
    try {
      users = await _repository.getAllUsers();
      emit(SuccessUserFacebookState());
      return users;
    } catch (error) {
      print(error.toString());
      emit(ErrorUserFacebookState());
      return [];
    }
  }

  Future<List<Story>> getUserStory() async {
    emit(LoadingStoryFacebookState());
    try {
      stories = await _repository.getAllStories();
      emit(SuccessStoryFacebookState());
      return stories;
    } catch (error) {
      print(error.toString());
      emit(ErrorStoryFacebookState());
      return [];
    }
  }

  Future<List<Post>> getPostData() async {
    emit(LoadingPostFacebookState());
    try {
      posts = await _repository.getAllPosts();
      addLineState(posts);
      emit(SuccessPostFacebookState());
      return posts;
    } catch (error) {
      print(error.toString());
      emit(ErrorPostFacebookState());
      return [];
    }
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
}