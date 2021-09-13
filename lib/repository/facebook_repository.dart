import 'package:facebook_app/model/post.dart';
import 'package:facebook_app/model/story.dart';
import 'package:facebook_app/model/user.dart';
import 'package:facebook_app/repository/user_data.dart';
import 'package:facebook_app/repository/user_post.dart';
import 'package:facebook_app/repository/user_story.dart';

class FacebookRepository {
  FacebookRepository._();

  static FacebookRepository? _instance;

  //Singleton Pattern
  static FacebookRepository getInstance() {
    if (_instance == null) {
      return _instance = FacebookRepository._();
    }
    return _instance!;
  }

  Future<List<User>> getAllUsers() async {
    final List<User> users = [];
    await Future.delayed(const Duration(seconds: 2), () {
      return allUser.forEach((user) => users.add(user));
    });
    return users;
  }

  Future<List<Story>> getAllStories() async {
    final List<Story> stories = [];
    await Future.delayed(const Duration(seconds: 2), () {
      return allStory.forEach((story) => stories.add(story));
    });
    return stories;
  }

  Future<List<Post>> getAllPosts() async {
    final List<Post> posts = [];
    await Future.delayed(const Duration(seconds: 2), () {
      return allPost.forEach((post) => posts.add(post));
    });
    return posts;
  }
}
