
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF278F8B),
        elevation: 0, //sem sombra
        title: const Text(
          'Be Our Guest',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            //fontSize: 30,
          ),
        ),
      ),

      body: SingleChildScrollView( //rolar a tela quando o conteúdo não cabe
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(16),
                ),

                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Encontre sua próxima receita',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF303030),
                      ),
                    ),

                    SizedBox(height: 8),

                    Text(
                      'Ideias deliciosas para o seu dia.',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Pesquisa visual
              TextField(
                decoration: InputDecoration(
                  hintText: 'Buscar receitas...',
                  // Ícone de lupa à esquerda
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Color(0xFF278F8B),
                  ),
                  filled: true,
                  fillColor: const Color(0xFFF8F8F8),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12), // bordas arredondadas
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 28),

              const Text(
                'Receitas para você',
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF303030),
                ),
              ),

              const SizedBox(height: 16),

              // Receitas de exemplo
              const ReceitaCard(
                nome: 'Pizza Margherita',
                tempo: '35 min',
                dificuldade: 'Fácil',
                avaliacao: '4.6',
                imagem: 'https://cdn.dummyjson.com/recipe-images/1.webp',
              ),

              const ReceitaCard(
                nome: 'Macarrão Alfredo com frango',
                tempo: '30 min',
                dificuldade: 'Fácil',
                avaliacao: '4.7',
                imagem: 'https://cdn.dummyjson.com/recipe-images/4.webp',
              ),

              const ReceitaCard(
                nome: 'Cookies com gotas de chocolate',
                tempo: '25 min',
                dificuldade: 'Fácil',
                avaliacao: '4.9',
                imagem: 'https://cdn.dummyjson.com/recipe-images/3.webp',
              ),
            ],
          ),
        ),
      ),

      // Navegação do fim da pagina
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: const Color(0xFF278F8B),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Buscar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border),
            label: 'Salvos',
          ),
        ],
      ),
    );
  }
}

// Widget que representa um cartão de receita
class ReceitaCard extends StatelessWidget {
  final String nome;
  final String tempo;
  final String dificuldade;
  final String avaliacao;
  final String imagem;

// Construtor > exige que todas as informações sejam fornecidas quando criamos um ReceitaCard.
  const ReceitaCard({
    super.key,
    required this.nome,
    required this.tempo,
    required this.dificuldade,
    required this.avaliacao,
    required this.imagem,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18), //espaço entre cada cartão
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center, //imagem e as informações lado a lado
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network( //imagem da web
              imagem,
              width: 105,
              height: 105,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nome,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF303030),
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  '$tempo · $dificuldade',
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 8),

                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      size: 18,
                      color: Color(0xFFE5AC35),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      avaliacao,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xFF555555),
                      ),
                    ),
                    const Spacer(), //espaço para o coração
                    const Icon(
                      Icons.favorite_border,
                      color: Color(0xFF278F8B),
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
