
import 'package:flutter/material.dart';
import 'package:routex_app/core/widget/out_lined_button.dart';
import 'package:routex_app/features/view/driver/info_chip.dart';

class OrderCard extends StatelessWidget {
  final Map<String, dynamic> order;
  final VoidCallback onAccept;
  final VoidCallback onViewDetails;

  const OrderCard({
    required this.order,
    required this.onAccept,
    required this.onViewDetails,
  });

  @override
  Widget build(BuildContext context) {
    final isPending = order['status'] == 'pending';
    final isInProgress = order['status'] == 'in_progress';

    return Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isInProgress ? const Color(0xFFFF6B35) : Colors.grey[200]!,
            width: isInProgress ? 2 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: isInProgress
                                ? const Color(0xFFFF6B35)
                                : Colors.grey[200],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            order['id'],
                            style: TextStyle(
                              color: isInProgress ? Colors.white : Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        if (isInProgress)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.green[100],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child:const Row(
                              children: const [
                                Icon(
                                  Icons.circle,
                                  size: 8,
                                  color: Colors.green,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  'قيد التوصيل',
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                    IconButton(
                      icon: const Icon(Icons.more_vert),
                      onPressed: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Icon(
                      Icons.person_outline,
                      size: 20,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      order['customerName'],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      size: 20,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        order['address'],
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    InfoChip(
                      icon: Icons.inventory_2_outlined,
                      label: '${order['items']} قطع',
                    ),
                    const SizedBox(width: 8),
                    InfoChip(
                      icon: Icons.route,
                      label: order['distance'],
                    ),
                    const SizedBox(width: 8),
                    InfoChip(
                      icon: Icons.access_time,
                      label: order['time'],
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (isPending)
            Container(
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                ),
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Expanded(
                      child:CustomOutlinedbutton(text: 'التفاصيل', onpressed: () { Navigator.pop(context); },)
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: onAccept,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFF6B35),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text('قبول'),
                      ),
                    ),
                  ],
                ))
        ]));
  }
}
