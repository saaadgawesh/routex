import 'package:flutter/material.dart';
import 'package:routex_app/features/view/warehouseManger.dart/InfoBadge.dart';

class ShipmentCard extends StatelessWidget {
  final Map<String, dynamic> shipment;

  const ShipmentCard({required this.shipment});

  @override
  Widget build(BuildContext context) {
    final isReady = shipment['status'] == 'ready';
    final isInTransit = shipment['status'] == 'in_transit';

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isInTransit
              ? Colors.green
              : isReady
                  ? const Color(0xFFFF6B35)
                  : Colors.grey[200]!,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
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
                        color: const Color(0xFFFF6B35).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        shipment['id'],
                        style: const TextStyle(
                          color: Color(0xFFFF6B35),
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: isInTransit
                            ? Colors.green[100]
                            : Colors.orange[100],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            isInTransit ? Icons.local_shipping : Icons.pending,
                            size: 14,
                            color: isInTransit ? Colors.green : Colors.orange,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            isInTransit ? 'قيد التوصيل' : 'جاهز للشحن',
                            style: TextStyle(
                              color: isInTransit ? Colors.green : Colors.orange,
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
                const Icon(Icons.person, size: 20, color: Colors.grey),
                const SizedBox(width: 8),
                Text(
                  'السائق: ${shipment['driver']}',
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
                const Icon(Icons.location_on, size: 20, color: Colors.grey),
                const SizedBox(width: 8),
                Text(
                  'الوجهة: ${shipment['destination']}',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    InfoBadge(
                      icon: Icons.inventory_2,
                      label: '${shipment['items']} قطعة',
                    ),
                    const SizedBox(width: 8),
                    InfoBadge(
                      icon: Icons.access_time,
                      label: shipment['time'],
                    ),
                  ],
                ),
                if (isReady)
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.check, size: 18),
                    label: const Text('تأكيد الشحن'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF6B35),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// lib/features/warehouse/presentation/add_item_screen.dart
