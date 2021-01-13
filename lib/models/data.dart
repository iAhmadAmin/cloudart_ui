import 'package:cloudart/models/community.dart';
import 'package:cloudart/models/event.dart';
import 'package:cloudart/models/follower.dart';
import 'package:cloudart/models/frndchat.dart';
import 'package:cloudart/models/message_model.dart';
import 'package:cloudart/models/post.dart';

List<Follower> followers = [
  Follower(
      imgPath: "assets/images/a.png", name: "Mark Monn", username: "@monn"),
  Follower(imgPath: "assets/images/b.png", name: "Person", username: "@person"),
  Follower(imgPath: "assets/images/c.png", name: "Aleezay", username: "@aleee"),
  Follower(imgPath: "assets/images/d.png", name: "Ammy", username: "@ammyhere"),
  Follower(
      imgPath: "assets/images/a.png", name: "Mark Monn", username: "@monn"),
  Follower(imgPath: "assets/images/b.png", name: "Person", username: "@person"),
  Follower(imgPath: "assets/images/c.png", name: "Aleezay", username: "@aleee"),
  Follower(imgPath: "assets/images/d.png", name: "Ammy", username: "@ammyhere"),
];

List<Post> userActivities = [
  Post(
    userProfile: "assets/images/dp.png",
    userName: "@username",
    name: "Mark Haliton",
    art: "assets/images/art1.png",
    likes: 300,
    comments: 200,
    shares: 150,
    support: 45,
    isLiked: true,
  ),
  Post(
    userProfile: "assets/images/dp.png",
    userName: "@username",
    name: "Mark Haliton",
    art: "assets/images/art2.png",
    likes: 245,
    comments: 134,
    shares: 123,
    support: 23,
    isLiked: false,
  ),
  Post(
    userProfile: "assets/images/dp.png",
    userName: "@username",
    name: "Mark Haliton",
    art: "assets/images/art3.png",
    likes: 123,
    comments: 123,
    shares: 12,
    support: 32,
    isLiked: false,
  ),
];

List<Post> mostCommented = [
  Post(
    userProfile: "assets/images/b.png",
    userName: "@username",
    name: "Mark Haliton",
    art: "assets/images/art1.png",
    likes: 300,
    comments: 200,
    shares: 150,
    support: 45,
    isLiked: true,
  ),
  Post(
    userProfile: "assets/images/c.png",
    userName: "@username",
    name: "Mark Haliton",
    art: "assets/images/art2.png",
    likes: 245,
    comments: 134,
    shares: 123,
    support: 23,
    isLiked: false,
  ),
  Post(
    userProfile: "assets/images/d.png",
    userName: "@username",
    name: "Mark Haliton",
    art: "assets/images/art3.png",
    likes: 123,
    comments: 123,
    shares: 12,
    support: 32,
    isLiked: false,
  ),
];

List<Community> communities = [
  Community(
    coverImages: [
      "assets/images/c2.jpg",
      "assets/images/c5.jpg",
      "assets/images/c6.jpg",
      "assets/images/c7.jpg",
    ],
    communityName: "Friends",
    totalMembers: 1025,
  ),
  Community(
    coverImages: [
      "assets/images/c6.jpg",
      "assets/images/c5.jpg",
      "assets/images/c7.jpg",
      "assets/images/c2.jpg",
    ],
    communityName: "Z Club",
    totalMembers: 500,
  ),
  Community(
    coverImages: [
      "assets/images/c2.jpg",
      "assets/images/c5.jpg",
      "assets/images/c6.jpg",
      "assets/images/c7.jpg",
    ],
    communityName: "Newbiz",
    totalMembers: 250,
  ),
  Community(
    coverImages: [
      "assets/images/c6.jpg",
      "assets/images/c5.jpg",
      "assets/images/c7.jpg",
      "assets/images/c2.jpg",
    ],
    communityName: "Locals",
    totalMembers: 300,
  ),
  Community(communityName: "new"),
];

List<FrndChat> frndChats = [
  FrndChat(
      imgPath: "assets/images/a.png",
      name: "Person 1",
      latestMsg: "Hello! are you there?",
      isOnline: true,
      lastMsgTime: "4:00 Pm"),
  FrndChat(
      imgPath: "assets/images/b.png",
      name: "Person 2",
      latestMsg: "i am down,",
      isOnline: true,
      lastMsgTime: "8:00 am"),
  FrndChat(
      imgPath: "assets/images/dp.png",
      name: "Person 3",
      latestMsg: "I am going to markeet to get some food,",
      isOnline: false,
      lastMsgTime: "12:00 Pm"),
  FrndChat(
      imgPath: "assets/images/c.png",
      name: "Person 4",
      latestMsg: "Hello! are you there?",
      isOnline: false,
      lastMsgTime: "4:00 Pm"),
  FrndChat(
      imgPath: "assets/images/a.png",
      name: "Person 5",
      latestMsg: "Hello! are you there?",
      isOnline: true,
      lastMsgTime: "4:00 Pm"),
  FrndChat(
      imgPath: "assets/images/b.png",
      name: "Person 6",
      latestMsg: "i am down,",
      isOnline: true,
      lastMsgTime: "4:00 Pm"),
  FrndChat(
      imgPath: "assets/images/dp.png",
      name: "Person 7",
      latestMsg: "I am going to markeet to get some food,",
      isOnline: false,
      lastMsgTime: "4:00 Pm"),
  FrndChat(
      imgPath: "assets/images/c.png",
      name: "Person 8",
      latestMsg: "Hello! are you there?",
      isOnline: false,
      lastMsgTime: "4:00 Pm"),
  FrndChat(
      imgPath: "assets/images/a.png",
      name: "Person 9",
      latestMsg: "Hello! are you there?",
      isOnline: true,
      lastMsgTime: "4:00 Pm"),
];

List<MessageModel> messagesList = [
  MessageModel(
      dp: "assets/images/a.png",
      isOnline: true,
      message:
          "Lorem ipsum, and tother thing is thta thewy iell noka whtk its time,a dn tyo lte.",
      sender: "person1"),
  MessageModel(
      dp: "assets/images/b.png",
      isOnline: true,
      message: "I was going to marktet then is aw wsd somthing terible",
      sender: "otherp"),
  MessageModel(
      dp: "assets/images/dp.png",
      isOnline: true,
      message: "OMG, how it gappend?",
      sender: "ammy"),
];

List<Community> searchComm = [
  Community(
    coverImages: [
      "assets/images/c2.jpg",
      "assets/images/c5.jpg",
      "assets/images/c6.jpg",
      "assets/images/c7.jpg",
    ],
    communityName: "Artists",
    totalMembers: 1025,
  ),
  Community(
    coverImages: [
      "assets/images/c6.jpg",
      "assets/images/c5.jpg",
      "assets/images/c7.jpg",
      "assets/images/c2.jpg",
    ],
    communityName: "Gaming",
    totalMembers: 500,
  ),
  Community(
    coverImages: [
      "assets/images/c2.jpg",
      "assets/images/c5.jpg",
      "assets/images/c6.jpg",
      "assets/images/c7.jpg",
    ],
    communityName: "Studying",
    totalMembers: 250,
  ),
  Community(
    coverImages: [
      "assets/images/c6.jpg",
      "assets/images/c5.jpg",
      "assets/images/c7.jpg",
      "assets/images/c2.jpg",
    ],
    communityName: "Top Shows",
    totalMembers: 300,
  ),
  Community(
    coverImages: [
      "assets/images/c2.jpg",
      "assets/images/c5.jpg",
      "assets/images/c6.jpg",
      "assets/images/c7.jpg",
    ],
    communityName: "Hollywood",
    totalMembers: 1025,
  ),
  Community(
    coverImages: [
      "assets/images/c6.jpg",
      "assets/images/c5.jpg",
      "assets/images/c7.jpg",
      "assets/images/c2.jpg",
    ],
    communityName: "Z Club",
    totalMembers: 500,
  ),
  Community(
    coverImages: [
      "assets/images/c2.jpg",
      "assets/images/c5.jpg",
      "assets/images/c6.jpg",
      "assets/images/c7.jpg",
    ],
    communityName: "Newbiz",
    totalMembers: 250,
  ),
  Community(
    coverImages: [
      "assets/images/c6.jpg",
      "assets/images/c5.jpg",
      "assets/images/c7.jpg",
      "assets/images/c2.jpg",
    ],
    communityName: "Locals",
    totalMembers: 300,
  ),
];

List<Event> events = [
  Event(
      eventName: "Life of Artist",
      location: "New York",
      imgPath: "assets/images/c2.jpg"),
  Event(
      eventName: "My Flowers",
      location: "Mexico",
      imgPath: "assets/images/c5.jpg"),
  Event(
      eventName: "Dark Window",
      location: "Italy",
      imgPath: "assets/images/c6.jpg"),
  Event(
      eventName: "Life of Artist",
      location: "New York",
      imgPath: "assets/images/c2.jpg"),
  Event(
      eventName: "My Flowers",
      location: "Mexico",
      imgPath: "assets/images/c5.jpg"),
  Event(
      eventName: "Dark Window",
      location: "Italy",
      imgPath: "assets/images/c6.jpg"),
];
