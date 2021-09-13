import 'package:facebook_app/model/post.dart';

Post myPost = Post(
  id: 1,
  userId: 1,
  timeAgo: 'now',
  textBody:
      'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC.',
  postImage: [
    'https://image.freepik.com/free-photo/aerial-view-beach-sea_74190-6569.jpg',
  ],
  likes: 200,
  comments: 12,
  shares: 10,
);

List<Post> allPost = [
  myPost,
  Post(
    id: 2,
    userId: 2,
    timeAgo: '10 min',
    textBody:
        'Aenean diam tellus, iaculis sed condimentum vel, lacinia et nibh. Duis laoreet, sapien id iaculis gravida, nulla magna malesuada erat, a gravida tellus mauris blandit nisl. Maecenas fringilla eleifend pretium. Nunc eget est ligula. Sed metus tortor, egestas non condimentum ac, rutrum sit amet tortor. Aliquam vehicula neque et sem convallis, vitae tempor odio aliquet. Sed rhoncus leo a enim ullamcorper gravida sit amet sed tortor. Donec odio lectus, hendrerit et augue et, suscipit pretium enim. Vivamus vestibulum, augue et varius auctor, sapien augue bibendum purus, et tempor ipsum ex a est. Mauris aliquet ultrices dui, id placerat tortor vestibulum ac.',
    postImage: [
      'https://image.freepik.com/free-vector/eco-tourism-concept_23-2148628567.jpg'
    ],
    likes: 12,
    comments: 0,
    shares: 0,
  ),
  Post(
    id: 3,
    userId: 3,
    timeAgo: '5 h',
    textBody: '',
    postImage: [
      'https://img.freepik.com/free-vector/woman-hiking_65141-396.jpg?size=626&ext=jpg',
      'https://image.freepik.com/free-vector/boarding-passenger-ship-harbour-ferry-arriving-pier-dock-travelling-holidays_225067-116.jpg',
      'https://image.freepik.com/free-vector/travel-illustration-with-funny-girl-with-suitcase-passport-boarding-tickets-woman-tourist-cartoon-character_97231-2042.jpg',
      'https://image.freepik.com/free-vector/eco-tourism-concept_23-2148647259.jpg',
      'https://image.freepik.com/free-vector/eco-tourism-concept-illustrated_23-2148621795.jpg',
    ],
    likes: 0,
    comments: 0,
    shares: 0,
  ),
  Post(
    id: 4,
    userId: 4,
    timeAgo: '1 h',
    textBody:
        'Nam faucibus ultrices malesuada. Sed a malesuada turpis, vitae porta elit. Pellentesque et facilisis nunc. Proin condimentum ac tortor eu pellentesque. Mauris rhoncus velit et nisi iaculis, convallis ultrices urna congue. Morbi convallis placerat orci id feugiat. Pellentesque a quam et purus tristique interdum sit amet nec nunc.\nIn a imperdiet elit. Quisque neque nisl, lobortis id feugiat sit amet, fringilla vitae elit. In accumsan, quam in pharetra feugiat, erat est commodo ipsum, id aliquet nisi mauris vitae lacus. Nunc nec imperdiet diam, in molestie ante. Nam pellentesque ornare viverra. Etiam id mi turpis. In eu maximus urna. Nunc molestie varius accumsan. Cras id lacus eget orci scelerisque ultrices ut non nisi.',
    postImage: [],
    likes: 15,
    comments: 12,
    shares: 1,
  ),
  Post(
    id: 5,
    userId: 5,
    timeAgo: '2 d',
    textBody:
        'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).',
    postImage: [],
    likes: 1,
    comments: 1,
    shares: 0,
  ),
];
