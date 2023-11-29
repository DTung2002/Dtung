class Category {
  String thumbnail;
  String name;
  int noOfCourses;
  String state;
  Category({
    required this.name,
    required this.noOfCourses,
    required this.thumbnail,
    required this.state,
  });
}

List<Category> categoryList = [
  Category(
    name: 'Graphic Design',
    noOfCourses: 20,
    thumbnail: 'assets/icons/Graphic.jpg',
    state:'Updating...',
  ),
  Category(
    name: 'Development',
    noOfCourses: 55,
    thumbnail: 'assets/icons/laptop.jpg',
    state:'Completed',
  ),
  Category(
    name: 'Photography',
    noOfCourses: 16,
    thumbnail: 'assets/icons/photography.jpg',
    state:'Updating...',

  ),
  Category(
    name: 'Product Design',
    noOfCourses: 25,
    thumbnail: 'assets/icons/design.jpg',
    state:'Updating...',
  ),
  Category(
    name: 'Accounting',
    noOfCourses: 20,
    thumbnail: 'assets/icons/accounting.jpg',
      state:'Updating...',
  ),

];
List<Category> filteredCategories = [];