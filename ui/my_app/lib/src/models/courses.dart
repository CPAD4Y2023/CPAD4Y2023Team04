class Courses {
  final String link;
  final String course;
 

  const Courses({
    required this.link,
    required this.course
    
  });

  factory Courses.fromJson(Map<String, dynamic> json) {
    return Courses(
      link: json['Link'],
      course: json['Course']
    );
  }
}