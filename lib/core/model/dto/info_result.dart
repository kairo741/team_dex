class InfoResult {
  static const String COUNT = 'count';
  static const String NEXT = 'next';
  static const String PREVIOUS = 'previous';
  static const String RESULTS = 'results';

  int? count;
  String? next;
  String? previous;
  dynamic results;

  InfoResult({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  static InfoResult fromJson(Map<String, dynamic> json) => InfoResult(
        count: json[COUNT] as int?,
        next: json[NEXT] as String?,
        previous: json[PREVIOUS] as String?,
        results: json[RESULTS],
      );
}
