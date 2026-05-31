class TaskModel {
  final String title; //TÊN CÔNG VIỆC
  final String category; //DANH MỤC
  final String priority; //MỨC ĐỘ
  final String time; //GIỜ HẸN
  final String id; //ID CỦA MỖI TASK 
  final bool isCompleted; //TRẠNG THÁI HOÀN THÀNH CỦA CÔNG VIỆC

  const TaskModel({
    required this.title,
    required this.category,
    required this.priority,
    required this.time,
    required this.id,
    this.isCompleted = false,
  });

  TaskModel copyWith({
    String? title,
    String? category,
    String? priority,
    String? time,
    bool? isCompleted,
  }) {
    return TaskModel(
      title: title ?? this.title,
      category: category ?? this.category,
      priority: priority ?? this.priority,
      time: time ?? this.time,
      id: id,
      isCompleted: isCompleted ?? this.isCompleted
    );
  }
}
