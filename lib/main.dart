import 'package:flutter/material.dart';
import 'package:my_app/models/laptop.dart';
import 'package:my_app/presentation/views/auth/login_screen.dart';
import 'package:my_app/presentation/views/auth/register_screen.dart';
import 'package:my_app/presentation/views/post/laptop_screen.dart';
import 'package:my_app/presentation/widgets/shared/laptop_item.dart';
import 'package:my_app/presentation/widgets/shared/lateral_menu_widget.dart';
import 'package:my_app/styles/app_styles.dart';
import 'package:my_app/view_models/laptop_view_model.dart';
import 'package:my_app/view_models/user_view_model.dart';
import 'package:provider/provider.dart';

void main() {

    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<UserViewModel>(
            create: (context) => UserViewModel(),
          ),
          ChangeNotifierProvider<LaptopViewModel>(
            create: (context) => LaptopViewModel(),
          ),
          // Agrega más proveedores según sea necesario
        ],
        child: const MyApp(),
      ),
    );

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      routes: {
        '/add_laptop': (context) => const PostLaptopScreen(),
        '/new_user': (context) => const RegisterScreen(),
        '/home': (context) => const MyHomePage(), 
        '/login': (context) => const MyApp(),
      },
      theme: appTheme(),

      home:  LoginScreen(),

    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context) { 

    final laptopViewModel = context.read<LaptopViewModel>();

    return Scaffold(

      appBar: AppBar(
        title: const Text('Bienvenido'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),

      //Menu lateral
      endDrawer: const LateralMenuDrawer(),

      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {
            laptopViewModel.getLaptops(context);
          });
        },
        child: SafeArea(
        
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 10, left: 25),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Nuestras laptops',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ),
                Expanded(
                  child: FutureBuilder<List<Laptop>>(
                      future: laptopViewModel.getLaptops(context),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Center( child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(child: Text('Error: ${snapshot.error}'));
                        } else {
                          final laptops = snapshot.data;
                  
                          if (laptops != null && laptops.isNotEmpty) {
                            return GridView.builder(
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1,
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 5,
                                childAspectRatio: 1.75,
                              ),
                              itemCount: laptops.length,
                              itemBuilder: (BuildContext context, int index) {
                                return LaptopItem( laptop: laptops[index]);
                              },
                            );
                          } else {
                            return const Center(child: Text('No se encontraron portátiles.'));
                          }
                        }
                      },
                    ),
                ),
              ],
            ),
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add_laptop');
        },
        backgroundColor: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.5),
        child: const Icon(Icons.add),
      ),

      // bottomNavigationBar: SizedBox(
      //   height: 65,
      //   child: BottomNavigationBar(
      //     items: const <BottomNavigationBarItem>[
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.home),
      //         label: 'Inicio',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.laptop_mac_rounded),
      //         label: 'Add laptop',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.account_circle),
      //         label: 'New user',
      //       ),
      //     ],
      //     onTap: (int index) {
      //         switch (index) {
      //           case 0:
      //             break;
      //           case 1:
      //             // Navegar a la pantalla para agregar una laptop
      //             Navigator.pushNamed(context, '/add_laptop');
      //             break;
      //           case 2:
      //             // Navegar a la pantalla de cuenta
      //             Navigator.pushNamed(context, '/new_user');
      //             break;
      //         }
      //       },
      //   ),
      // )
    );
  }
}
