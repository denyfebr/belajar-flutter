import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/auth_provider.dart';
import '../auth_screen/login_screen.dart';
import '../cart_screen/cart_screen.dart';

class CartButton extends StatelessWidget {
  const CartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, auth, _) {
        return FloatingActionButton(
          onPressed: (){
            if(auth.authStatus){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CartScreen()));
            }else{
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginScreen()));
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Anda belum login"))
              );
            }
          },
          backgroundColor: Colors.amberAccent,
          child: Icon(Icons.shopping_cart),
        );
      }
    );
  }
}
