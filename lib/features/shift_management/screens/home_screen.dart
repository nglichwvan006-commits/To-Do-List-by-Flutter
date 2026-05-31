import 'package:flutter/material.dart';
import 'package:to_do_list/features/shift_management/models/task_model.dart';
import 'package:to_do_list/features/shift_management/widgets/task_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<TaskModel> tasks = [
    TaskModel(
      id: '1',
      title: 'Ôn tập Giải tích 2 chương 3',
      category: 'Học tập',
      priority: 'Gấp',
      time: '09:00',
      isCompleted: false,
    ),
    TaskModel(
      id: '2',
      title: 'Nộp báo cáo thực tập tuần 4',
      category: 'Học tập',
      priority: 'Gấp',
      time: '11:30',
      isCompleted: false,
    ),
    TaskModel(
      id: '3',
      title: 'Đăng ký lịch học kỳ sau',
      category: 'Học tập',
      priority: 'Gấp',
      time: '14:00',
      isCompleted: false,
    ),
    TaskModel(
      id: '4',
      title: 'Uống đủ 2L nước mỗi ngày',
      category: 'Sức khỏe',
      priority: 'Thư thả',
      time: 'Không hẹn',
      isCompleted: false,
    ),
    TaskModel(
      id: '5',
      title: 'Cập nhật CV thực tập',
      category: 'Công việc',
      priority: 'Vừa',
      time: '16:00',
      isCompleted: false,
    ),
  ];
  void chuyenDoiTrangThaiTask(String taskID, bool isCompleted) {  //KHI BẤM TASK THÌ VALUE THÀNH 1 VÀ TRUYỀN VÀO HÀM ĐỂ THAY ĐỔI TRẠNG THÁI
    final index = tasks.indexWhere((task) => taskID==task.id);

    if(index == -1) return;
    
    setState(() {
      tasks[index] = tasks[index].copyWith(isCompleted: isCompleted);
    });
  }
  @override
  Widget build(BuildContext context) {
    final pendingTasks = tasks.where((tasks) => !tasks.isCompleted).toList(); //DUYỆT QUA TỪNG TASK RỒI KIỂM TRA NẾU TASK NÀO = FALSE
    final completedTasks = tasks.where((tasks) => tasks.isCompleted).toList();
    final tongSoTask = tasks.length;
    final soTaskDaHoanThanh = completedTasks.length;
    final tienDo = tongSoTask ==0 ? 0.0 : soTaskDaHoanThanh / tongSoTask; //TÍNH TIẾN ĐỘ
    return Scaffold(
      backgroundColor: Color(0xFFF4F0FF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Buổi Tối Thư Giản👋",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2D264B),
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Nghỉ dịu sau một ngày chăm chỉ nào 🌙',
                style: TextStyle(fontSize: 14, color: Color(0xFF8A84A6)),
              ),
              SizedBox(height: 24),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Tiến Độ Hôm Nay",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2D264B),
                          ),
                        ),
                        Text(
                          "$soTaskDaHoanThanh/$tongSoTask",
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF8B5CF6),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 12),
                    LinearProgressIndicator(
                      value: tienDo,
                      minHeight: 10,
                      borderRadius: BorderRadius.circular(22),
                      backgroundColor: const Color(0xFFEDE9FE),
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Color(0xFF8B5CF6)
                      ),
                    ),
                    const SizedBox(height: 10),

                    Text(
                      "Bạn Đã Hoàn Thành ${(tienDo*100).toInt()}% Công Việc",
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xFF8A84A6),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: ListView(
                  children: [
                    const Text(
                      'Cần làm hôm nay',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2D264B),
                      ),
                    ),

                    const SizedBox(height: 12),

                    ...pendingTasks.map((task) {  //.map() DÙNG ĐỂ BIẾN LIST NÀY THÀNH LIST KHÁC
                      return TaskCard(
                        title: task.title,
                        category: task.category,
                        priority: task.priority,
                        time: task.time,
                        isCompleted: task.isCompleted,
                        onChanged: (value) {
                          chuyenDoiTrangThaiTask(task.id, value ?? false);
                        },
                      );
                    }),

                    const SizedBox(height: 20),

                    const Text(
                      'Đã hoàn thành',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2D264B),
                      ),
                    ),

                    const SizedBox(height: 12),

                    ...completedTasks.map((task) {  //DÙNG ... ĐỂ CHO LISTVIEW BIẾT NÓ LÀ WIGET
                      return TaskCard(
                        title: task.title,
                        category: task.category,
                        priority: task.priority,
                        time: task.time,
                        isCompleted: task.isCompleted,
                        onChanged: (value) {
                          chuyenDoiTrangThaiTask(task.id, value ?? false);
                        },
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
