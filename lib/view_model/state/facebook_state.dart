import 'package:facebook_app/model/post.dart';
import 'package:facebook_app/model/story.dart';
import 'package:facebook_app/model/user.dart';

abstract class FacebookState {}

class InitialFacebookState extends FacebookState {}

// User State
class LoadingUserFacebookState extends FacebookState {}

class SuccessUserFacebookState extends FacebookState {
  final List<User> users;

  SuccessUserFacebookState({required this.users});
}

class ErrorUserFacebookState extends FacebookState {}

// Story State
class LoadingStoryFacebookState extends FacebookState {}

class SuccessStoryFacebookState extends FacebookState {
  final List<Story> stories;

  SuccessStoryFacebookState({required this.stories});
}

class ErrorStoryFacebookState extends FacebookState {}

// Post State
class LoadingPostFacebookState extends FacebookState {}

class SuccessPostFacebookState extends FacebookState {
  final List<Post> posts;

  SuccessPostFacebookState({required this.posts});
}

class ErrorPostFacebookState extends FacebookState {}

class ChangeTextLineState extends FacebookState {}
