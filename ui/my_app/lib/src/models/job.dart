class Job {
  final String company;
  final String jobTitle;
  final String level;
  final String link;

  const Job({
    required this.link,
    required this.jobTitle,
    required this.level,
    required this.company,
  });

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      link: json['link'],
      jobTitle: json['job-title'],
      level: json['level'],
      company: json['company']
    );
  }
}