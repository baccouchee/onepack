import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onepack/Screens/calc_screen.dart';
import 'package:onepack/Screens/fournisseur_screen.dart';
import 'Models/FuncListDashboard.dart';
import 'Screens/admin_screen.dart';
import 'Screens/categorie_screen.dart';
import 'Screens/commande_screen.dart';
import 'Screens/log_serveurs_screen.dart';
import 'Screens/product_screen.dart';
import 'Screens/produit_screen.dart';
import 'Screens/serveur_screen.dart';
import 'Widgets/dashboard_builder.dart';
import 'Screens/gestion_achat_screen.dart';
import 'Screens/session_screen.dart';
import 'Screens/login_screen.dart';
import 'Screens/note_screen.dart';
import 'Screens/stock_screen.dart';
import 'Screens/vente_screen.dart';
import 'global/constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => LoginScreen(),
        '/Home': (context) => DashboardBuilder(
              title: 'Tableau de bord — Gérant',
              titleList: funcListTitle,
              iconList: funcListIcon,
            ),
        '/Ventes': (context) => VenteScreen(),
        '/Achats': (context) => DashboardBuilder(
              title: 'Achats',
              titleList: funcListAchatTitle,
              iconList: funcListAchatIcon,
            ),
        '/Gestion-Des-Achats': (context) => GestionAchatScreen(),
        '/Gestion-Des-Fournisseurs': (context) => FournisseurScreen(),
        '/Notes': (context) => NoteScreen(),
        '/Calc': (context) => CalcApp(),
        '/Stock': (context) => StockScreen(),
        '/Personnel': (context) => DashboardBuilder(
              title: 'Personnel',
              titleList: funcListPersonnelTitle,
              iconList: funcListPersonnelIcon,
            ),
        '/Session': (context) => SessionScreen(),
       '/Commandes': (context) => CommandeScreen(),
        '/Statistiques': (context) => DashboardBuilder(
              title: 'Statistiques',
              titleList: funcListStatTitle,
              iconList: funcListStatIcon,
            ),
        '/Serveurs': (context) => DashboardBuilder(
              title: 'Serveurs',
              titleList: funcListServeurTitle,
              iconList: funcListServeurIcon,
            ),
        '/Log': (context) => LogServeurScreen(),

        '/Serveur': (context) => ServeurScreen(),
        '/Commandes': (context) => CatScreen(),
        '/Product' : (context) => ProductScreen(),
        '/Admin': (context) => AdminScreen(),
        '/Produit': (context) => ProduitScreen(),
      },
      title: 'POS System',
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.black),
        canvasColor: secondaryColor,
      ),
    );
  }
}
