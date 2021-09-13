import 'package:facebook_app/entities/model/story.dart';

Story myStory = Story(
  id: 1,
  userId: 1,
  storyImage: null,
);

List<Story> allStory = [
  myStory,
  Story(
      id: 2,
      userId: 2,
      storyImage:
          'https://image.freepik.com/free-photo/young-wedding-couple-enjoying-romantic-moments_1328-4124.jpg'),
  Story(
      id: 3,
      userId: 3,
      storyImage:
          'https://image.freepik.com/free-photo/old-book-wooden-table_53876-18285.jpg'),
  Story(
      id: 4,
      userId: 4,
      storyImage:
          'https://image.freepik.com/free-photo/dreamy-motivational-quote-template-social-media-landscape-background_53876-104466.jpg'),
  Story(
      id: 5,
      userId: 5,
      storyImage:
          'https://image.freepik.com/free-photo/red-pumpkins-shadows-sun-melting-red-background_512343-181.jpg'),
];
