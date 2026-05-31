import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final String title; //TÊN CÔNG VIỆC
  final String category; //DANH MỤC
  final String priority; //MỨC ĐỘ
  final String time; //GIỜ HẸN
  final bool isCompleted; //TRẠNG THÁI HOÀN THÀNH CỦA CÔNG VIỆC,
  final ValueChanged<bool?>
  onChanged; //KHI THAY ĐỔI STATE THÌ HOMEPAGE SẼ TRUYỀN VÀO ONCHANGED (TỨC LÀ TRUYỀN VÀO HÀM LÀM THAY ĐỔI ONCHANGED)
  const TaskCard({
    super.key,
    required this.title,
    required this.category,
    required this.priority,
    required this.time,
    required this.isCompleted,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //CARD TASK
      width: double.infinity, //CARD RONG HET CHIEU NGANG CO THE
      margin: EdgeInsets.only(bottom: 14), //CÁCH DƯỚI 14 PIXEL
      padding: EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFFE8DCC4),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Checkbox(
            value: isCompleted,
            onChanged: onChanged,
            activeColor: const Color(
              0xFF8B5CF6,
            ), //MÀU NỀN CỦA CHECK BOX KHI CHECK BOX ĐƯỢC TÍCH CHỌN
            checkColor: const Color.fromARGB(255,0,0,0,), //MÀU CỦA DẤU TÍCH KHI ĐƯỢC TÍCH CHỌN
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2D264B),
                    decoration: isCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEDE9FE),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        category,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF8B5CF6),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF1E6),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        priority,
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFFFF8A00),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF1E6),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        time,
                        style: TextStyle(
                          fontSize: 12,
                          color: Color.fromARGB(255, 18, 14, 9),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
