import 'package:flutter/material.dart';
import 'package:routex_app/core/widget/customTextFormField.dart';
import 'package:routex_app/core/widget/out_lined_button.dart';

class AddItemScreen extends StatefulWidget {
  const AddItemScreen({super.key});

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _quantityController = TextEditingController();
  final _locationController = TextEditingController();
  String? _selectedCategory;

  @override
  void dispose() {
    _nameController.dispose();
    _quantityController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF2D2D2D),
        title: const Text('إضافة منتج جديد'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // QR Code Scanner
              Container(
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Colors.grey[300]!,
                    style: BorderStyle.solid,
                    width: 2,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.qr_code_scanner,
                      size: 60,
                      color: Colors.grey[400],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'مسح رمز QR',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              const Text(
                'أو أدخل البيانات يدوياً',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),

              const SizedBox(height: 24),

              // Item Name
              CustomTextFormField(
                nameController: _nameController,
                labeltext: 'اسم المنتج',
                hinttext: 'أدخل اسم المنتج',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'الرجاء إدخال اسم المنتج';
                  }
                  return null;
                },
                prefexicon: Icons.inventory_2,
              ),

              const SizedBox(height: 16),

              // Category Dropdown
              DropdownButtonFormField<String>(
                value: _selectedCategory,
                decoration: InputDecoration(
                  labelText: 'الفئة',
                  prefixIcon: const Icon(Icons.category),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                items: const [
                  DropdownMenuItem(
                      value: 'electronics', child: Text('إلكترونيات')),
                  DropdownMenuItem(value: 'food', child: Text('أغذية')),
                  DropdownMenuItem(value: 'fashion', child: Text('أزياء')),
                  DropdownMenuItem(value: 'furniture', child: Text('أثاث')),
                  DropdownMenuItem(value: 'other', child: Text('أخرى')),
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'الرجاء اختيار الفئة';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              CustomTextFormField(
                  nameController: _quantityController,
                  labeltext: 'الكمية',
                  hinttext: '0',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'الرجاء إدخال الكمية';
                    }
                    return null;
                  },
                  prefexicon: Icons.numbers),
              const SizedBox(height: 16),

              // Location

              CustomTextFormField(
                  nameController:  _locationController,
                  labeltext: 'الموقع في المستودع',
                  hinttext: 'A-12',
                  validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'الرجاء إدخال الموقع';
                  }
                  return null;
                },
                  prefexicon: Icons.location_on),
              const SizedBox(height: 24),

              // Notes
              TextFormField(
                maxLines: 4,
                textDirection: TextDirection.rtl,
                decoration: InputDecoration(
                  labelText: 'ملاحظات (اختياري)',
                  hintText: 'أضف أي ملاحظات إضافية',
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              const SizedBox(height: 32),

              // Submit Button
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Save item
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('تم إضافة المنتج بنجاح'),
                        backgroundColor: Colors.green,
                      ),
                    );
                    Navigator.pop(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF6B35),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'إضافة المنتج',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // Cancel Button
              CustomOutlinedbutton(
                text: 'إلغاء',
                onpressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
