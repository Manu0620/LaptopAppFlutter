import 'package:flutter/material.dart';

class LateralMenuDrawer extends StatelessWidget {
  const LateralMenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.3),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'My App',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
            ),
            // Submenú para Usuarios
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3),
              child: ExpansionTile(
                leading: const Icon(Icons.person_2_rounded),
                iconColor: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.5),
                title: Text(
                  'Usuarios',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                children: [
                  ListTile(
                    leading: const Icon(Icons.person_add_rounded),
                    iconColor: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.5),
                    title: Text(
                      'Registrar Usuario',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/new_user');
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.person_search_rounded),
                    iconColor: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.5),
                    title: Text(
                      'Consultar Usuarios',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    onTap: () {
                      
                    },
                  ),
                ],
              ),
            ),
            // Submenú para Laptops
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3),
              child: ExpansionTile(
                leading: const Icon(Icons.laptop_mac_rounded),
                iconColor: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.5),
                title: Text(
                  'Laptops',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                children: [
                  ListTile(
                    leading: const Icon(Icons.add_rounded),
                    iconColor: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.5),
                    title: Text(
                      'Agregar Laptop',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/add_laptop');
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.search_rounded),
                    iconColor: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.5),
                    title: Text(
                      'Consultar Laptops',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    onTap: () {
                      
                    },
                  ),
                ],
              ),
            ),
            //Cerrar sesión
            Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.logout_rounded),
                  iconColor: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.5),
                  title: Text(
                    'Cerrar sesión',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/login');
                  },
                ),
              ],
            ),
          ],
        ),
      );
  }
}