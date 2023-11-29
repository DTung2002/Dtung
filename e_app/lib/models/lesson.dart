class Lesson {
  String name;
  String duration;


  Lesson({
    required this.duration,
    required this.name,
  });
}

List<Lesson> lessonList = [
  Lesson(
    duration: '11 min 20 sec',

    name: "Giới thiệu Flutter",
  ),
  Lesson(
    duration: '10 min 11 sec',

    name: "Cài đặt môi trường",
  ),
  Lesson(
    duration: '7 min',

    name: "Tạo dự án đầu tiên",
  ),
  Lesson(
    duration: '5 min',

    name: "Cấu trúc dự án Flutter",
  ),
  Lesson(
    duration: '5 min',

    name: "Stateless Widget & Stateful Widget",
  ),

];