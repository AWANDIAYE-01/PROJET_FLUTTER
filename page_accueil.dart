import 'package:flutter/material.dart';

void main() {
  runApp(const Accueil());
}

class Accueil extends StatelessWidget {
  const Accueil({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LOCALMARKET',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "LOCALMARKET",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Bienvenue sur LOCALMARKET !",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            const Text(
              "Trouvez des produits agricoles frais directement auprès des agriculteurs.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MarketPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "Voir le marché",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MarketPage extends StatelessWidget {
  MarketPage({super.key});

  final List<Map<String, dynamic>> products = [
    {"name": "Pommes de terre", "price": "500 FCFA/kg", "details": "Pommes de terre fraîches et de qualité."},
    {"name": "Carottes", "price": "800 FCFA/kg", "details": "Carottes croquantes et nourrissantes."},
    {"name": "Mangues", "price": "1500 FCFA/kg", "details": "Mangues juteuses, bien mûres et sucrées."},
    {"name": "Poivrons", "price": "1200 FCFA/kg", "details": "Poivrons frais, colorés et pleins de saveurs."},
    {"name": "Citrons", "price": "1000 FCFA/kg", "details": "Citrons acidulés, parfaits pour vos recettes."},
    {"name": "Pommes", "price": "1300 FCFA/kg", "details": "Pommes sucrées et croquantes."},
    {"name": "Bananes", "price": "700 FCFA/kg", "details": "Bananes douces et savoureuses."},
    {"name": "Choux", "price": "600 FCFA/kg", "details": "Choux verts frais et croquants."},
    {"name": "Laitues", "price": "850 FCFA/kg", "details": "Laitues fraîches et croquantes pour vos salades."},
    {"name": "Concombres", "price": "900 FCFA/kg", "details": "Concombres frais et rafraîchissants."},
    {"name": "Aubergines", "price": "950 FCFA/kg", "details": "Aubergines violettes et fermes."},
    {"name": "Tomates", "price": "1000 FCFA/kg", "details": "Tomates rouges et juteuses."},
    {"name": "Oignons", "price": "750 FCFA/kg", "details": "Oignons frais et savoureux."},
    {"name": "Légumes verts", "price": "1200 FCFA/kg", "details": "Légumes verts locaux et pleins de vitamines."},
    {"name": "Patates douces", "price": "650 FCFA/kg", "details": "Patates douces sucrées et riches en nutriments."},
    {"name": "Pois chiches", "price": "950 FCFA/kg", "details": "Pois chiches bio et délicieux."},
    {"name": "Haricots", "price": "700 FCFA/kg", "details": "Haricots rouges frais et nourrissants."},
    {"name": "Avocats", "price": "1500 FCFA/kg", "details": "Avocats mûrs et crémeux."},
    {"name": "Papayes", "price": "1200 FCFA/kg", "details": "Papayes sucrées et parfaites pour un smoothie."},
    {"name": "Fraises", "price": "2500 FCFA/kg", "details": "Fraises juteuses et sucrées."},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Marché LOCALMARKET"),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 0.8,
          ),
          itemBuilder: (context, index) {
            final product = products[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailsPage(product: product),
                  ),
                );
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 4,
                color: Colors.teal.shade50,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.grey.shade200,
                        child: Icon(
                          Icons.shopping_cart_outlined,
                          size: 50,
                          color: Colors.teal.shade700,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            product["name"],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.teal,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            product["price"],
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.teal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class ProductDetailsPage extends StatelessWidget {
  final Map<String, dynamic> product;

  const ProductDetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product["name"]),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.grey.shade200,
                padding: const EdgeInsets.all(20.0),
                child: Icon(
                  Icons.shopping_cart_outlined,
                  size: 100,
                  color: Colors.teal.shade700,
                ),
              ),
              const SizedBox(height: 16),

              Text(
                product["name"],
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                product["price"],
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.teal,
                ),
              ),
              const SizedBox(height: 16),

              Text(
                product["details"],
                style: const TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 24),

              const Divider(thickness: 1),
              const SizedBox(height: 16),
              const Text(
                "Description détaillée",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                "Ce produit est cultivé de manière locale et biologique, offrant ainsi une fraîcheur et une qualité exceptionnelles. Il est idéal pour les recettes familiales, les repas sains et les snacks rapides.",
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 16),

              const Divider(thickness: 1),
              const SizedBox(height: 16),
              const Text(
                "Informations nutritionnelles",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                "Ce produit est riche en vitamines et minéraux, notamment en vitamine C et en fibres. Il offre également une bonne source de potassium et d'antioxydants.",
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 16),

              const Divider(thickness: 1),
              const SizedBox(height: 16),
              const Text(
                "Conseils d'utilisation",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                "Les produits peuvent être consommés frais en salade, cuits dans des plats principaux ou utilisés pour préparer des jus et smoothies. Veillez à les conserver dans un endroit frais et sec pour garantir leur fraîcheur.",
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 16),

              const Divider(thickness: 1),
              const SizedBox(height: 16),
              const Text(
                "Informations supplémentaires",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                "Produit disponible en différentes tailles. Nous vous recommandons de commander des quantités adaptées à votre consommation hebdomadaire.",
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 24),

              ElevatedButton(
                onPressed: () {
                  // Logic for adding to the cart
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Ajouter au panier",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
