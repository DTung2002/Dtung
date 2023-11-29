class GraphicCourse {
  String name;
  double completedPercentage;
  String author;
  String thumbnail;

  GraphicCourse({
    required this.author,
    required this.completedPercentage,
    required this.name,
    required this.thumbnail,
  });
}

List<GraphicCourse> GraphicCourses = [
  GraphicCourse(
    author: "Dev",
    completedPercentage: .0,
    name: "Cơ bản",
    thumbnail: "assets/icons/Graphic.jpg",
  ),
  GraphicCourse(
    author: "Dev",
    completedPercentage: .0,
    name: "Nâng cao",
    thumbnail: "assets/icons/Graphic.jpg",
  ),
];