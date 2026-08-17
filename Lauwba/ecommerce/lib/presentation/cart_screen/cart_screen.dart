import 'dart:convert';

import 'package:ecommerce/providers/handlers.dart';
import 'package:ecommerce/utils/number_format.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as cart;
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../data/model/cart/ListCart.dart';
import '../../providers/cart_provider.dart';

// Model Data Dummy
class CartItem {
  final String id;
  final String name;
  final String imageUrl;
  final int price;
  int quantity;

  CartItem({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    this.quantity = 1,
  });
}

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // Data Dummy Keranjang
  final List<CartItem> _cartItems = [
    CartItem(
      id: '1',
      name: 'Sepatu Running Nike Air Zoom',
      imageUrl:
          'https://images.unsplash.com/photo-1542291026-7eec264c27ff?q=80&w=200&auto=format&fit=crop',
      price: 1500000,
      quantity: 1,
    ),
    CartItem(
      id: '2',
      name: 'Jam Tangan Analog Minimalis',
      imageUrl:
          'https://images.unsplash.com/photo-1524592094714-0f0654e20314?q=80&w=200&auto=format&fit=crop',
      price: 750000,
      quantity: 2,
    ),
    CartItem(
      id: '3',
      name: 'Tas Ransel Canvas Waterproof',
      imageUrl:
          'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?q=80&w=200&auto=format&fit=crop',
      price: 300000,
      quantity: 1,
    ),
  ];

  final TextEditingController _noteController = TextEditingController();

  // Hitung Total Belanja
  int get _totalPrice {
    return _cartItems.fold(
      0,
      (sum, item) => sum + (item.price * item.quantity),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context, listen: false);
    cart.getListCart();

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          "Keranjang Belanja",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: const BackButton(color: Colors.black),
      ),
      body: Column(
        children: [
          // 1. LIST PRODUK (Scrollable)
          Consumer<CartProvider>(
            builder: (context, cart, _) {
              return dataStateBuilder<List<Data>>(
                context,
                dataStateModel: cart.listCartModelState,
                onSuccess: (val, msg) {
                  return showListCart(data: val);
                },
              );
            },
          ),

          // 2. BAGIAN CHECKOUT (Sticky di bawah)
          _buildBottomCheckoutSection(),
        ],
      ),
    );
  }

  Expanded showListCart({bool isLoading = false, List<Data>? data}) {
    return Expanded(
      child: Skeletonizer(
        enabled: isLoading,
        child: ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: (isLoading)
              ? _cartItems.length + 1
              : data!.length, // +1 untuk widget Catatan di paling bawah list
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            // Jika index terakhir, render Input Catatan
            if (index == (isLoading ? _cartItems.length : data?.length)) {
              return _buildOrderNoteInput();
            }

            // Render Item Cart
            return _buildCartItemCard(
              index,
              data: data?[index],
              loading: isLoading,
            );
          },
        ),
      ),
    );
  }

  // --- WIDGET COMPONENTS ---

  Widget _buildCartItemCard(int index, {Data? data, bool loading = false}) {
    final item = _cartItems[index];
    int? subtotal = item.price * item.quantity;
    if (!loading) {
      subtotal = data!.products!.price!.toInt() * data.qty!.toInt();
    }

    bool isLoading;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gambar Produk
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              loading ? item.imageUrl : (jsonDecode(data!.products!.images!) as List).first,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
              errorBuilder: (ctx, _, __) => Container(
                width: 80,
                height: 80,
                color: Colors.grey[300],
                child: const Icon(Icons.broken_image),
              ),
            ),
          ),
          const SizedBox(width: 12),

          // Detail Produk
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        loading ? item.name : data!.products!.name!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    // Tombol Edit (Sesuai request)
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Icon(
                          Icons.edit_note,
                          color: Colors.blue,
                          size: 20,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        final cart = Provider.of<CartProvider>(context, listen: false);

                        if(!loading){
                          cart.delete(data!.id!.toInt());
                        }
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Icon(
                          Icons.delete_forever,
                          color: Colors.red,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  MyNumberFormat.rupiah(
                    (loading ? item.price : data!.products!.price)!.toInt(),
                  ),
                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                ),
                const SizedBox(height: 8),

                // Row Bawah: Subtotal & Qty Control
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Subtotal
                    Text(
                      MyNumberFormat.rupiah(subtotal),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                        fontSize: 14,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "${loading ? item.quantity : data?.qty!}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
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

  Widget _buildQtyBtn(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Icon(icon, size: 16, color: Colors.black87),
      ),
    );
  }

  Widget _buildOrderNoteInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 8.0, left: 4),
          child: Text(
            "Catatan Pesanan (Opsional)",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        TextField(
          controller: _noteController,
          maxLines: 3,
          decoration: InputDecoration(
            hintText: "Contoh: Packing kayu, jangan dibanting...",
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.all(12),
          ),
        ),
        // Spacer agar tidak tertutup bottom bar saat scroll mentok bawah
        const SizedBox(height: 80),
      ],
    );
  }

  Widget _buildBottomCheckoutSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Total Pembayaran",
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  const SizedBox(height: 4),
                  Consumer<CartProvider>(
                    builder: (context, cart, _) {
                      return Text(
                        MyNumberFormat.rupiah(cart.setTotal()),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      );
                    },
                    child: Text(
                      MyNumberFormat.rupiah(_totalPrice),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            ElevatedButton(
              onPressed: () {
                // Aksi Checkout
                print("Checkout: $_totalPrice");
                print("Catatan: ${_noteController.text}");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "Checkout",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
