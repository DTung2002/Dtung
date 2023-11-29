class PhotoCourse {
  String name;
  double completedPercentage;
  String author;
  String thumbnail;

  PhotoCourse({
    required this.author,
    required this.completedPercentage,
    required this.name,
    required this.thumbnail,
  });
}

List<PhotoCourse> Photocourses = [
  PhotoCourse(
    author: "Dev",
    completedPercentage: .0,
    name: "Cơ bản",
    thumbnail: "assets/icons/photography.jpg",
  ),
  PhotoCourse(
    author: "Dev",
    completedPercentage: .0,
    name: "Nâng cao",
    thumbnail: "assets/icons/photography.jpg",
  ),
];