import 'package:facebook_app/model/user.dart';

User myUser = User(
  id: 1,
  userName: 'Mahmoud Ahmed',
  profileImage:
      'https://image.freepik.com/free-photo/young-handsome-man-listens-music-with-earphones_176420-15616.jpg',
  state: true,
);

List<User> allUser = [
  myUser,
  User(
    id: 2,
    userName: 'Hassan Salah',
    profileImage:
        'https://img.freepik.com/free-photo/image-magnetic-handsome-helpless-young-man-shrugging-with-shoulders-looking-directly-raising-arms_176532-10250.jpg?size=338&ext=jpg',
    state: true,
  ),
  User(
    id: 3,
    userName: 'Jasmin Anas',
    profileImage:
        'https://image.freepik.com/free-photo/young-beautiful-woman-pink-warm-sweater-natural-look-smiling-portrait-isolated-long-hair_285396-896.jpg',
    state: false,
  ),
  User(
    id: 4,
    userName: 'Abdullah Sleem',
    profileImage:
        'https://img.freepik.com/free-photo/pleasant-looking-serious-man-stands-profile-has-confident-expression-wears-casual-white-t-shirt_273609-16959.jpg?size=338&ext=jpg',
    state: false,
  ),
  User(
    id: 5,
    userName: 'Rofida Mahmoud',
    profileImage:
        'https://image.freepik.com/free-photo/medium-shot-young-asian-woman-leaning-tree-posing-picture-park_1098-19345.jpg',
    state: false,
  ),
];
