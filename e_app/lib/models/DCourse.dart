class DCourse {
  String name;
  double completedPercentage;
  String author;
  String thumbnail;

  DCourse({
    required this.author,
    required this.completedPercentage,
    required this.name,
    required this.thumbnail,
  });
}

List<DCourse> courses = [
  DCourse(
    author: "Dev",
    completedPercentage: 1.0,
    name: "Flutter",
    thumbnail: "assets/icons/flutter.jpg",
  ),
  DCourse(
    author: "Dev",
    completedPercentage: .0,
    name: "React Native",
    thumbnail: "assets/icons/react.jpg",
  ),
  DCourse(
    author: "Dev",
    completedPercentage: .20,
    name: "Lập trình hướng đối tượng",
    thumbnail: "assets/icons/OOP.png",
  ),
  DCourse(
    author: "Dev",
    completedPercentage: .0,
    name: "Node.js",
    thumbnail: "assets/icons/node.png",
  ),
  DCourse(
    author: "Dev",
    completedPercentage: .0,
    name: ".NET MVC",
    thumbnail: "assets/icons/.net.png",
  ),
];