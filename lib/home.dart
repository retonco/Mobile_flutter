
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pesquisa = TextEditingController();

  String? mensagemErro;
  String? termoPesquisado;

  void pesquisar() {
    String texto = pesquisa.text.trim();

    setState(() {
      if (texto.isEmpty) {
        mensagemErro = 'Digite o nome de uma receita para pesquisar.';
      } else {
        mensagemErro = null;
        termoPesquisado = texto;
      }
    });

    if (texto.isEmpty) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Pesquisa realizada: $texto'),
      ),
    );
  }

  @override
  void dispose() {
    pesquisa.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF278F8B),
        elevation: 0, //sem sombra
        title: Text(
          'Be Our Guest',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView( //rolar a tela quando o conteúdo não cabe
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Pesquisa visual
              TextField(
                controller: pesquisa,
                decoration: InputDecoration(
                  labelText: 'Pesquisar pelo nome da receita', //identifica o campo
                  labelStyle: const TextStyle(
                    color: Colors.black,
                  ),

                  hintText: 'Ex.: Pizza Margherita',

                  errorText: mensagemErro,
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Color(0xFF278F8B),
                  ),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Color(0xFF36A39F),
                    ),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Color(0xFF36A39F),
                      width: 2,
                    ),
                  ),
                ),
                onChanged: (valor) {
                  setState(() {
                    mensagemErro = null;
                    termoPesquisado = null;
                  });
                },
              ),

              const SizedBox(height: 10),

              ElevatedButton(
                onPressed: pesquisar,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4DB6AC),
                  foregroundColor: Colors.white,
                ),
                child: Text('Pesquisar',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  ),
                ),
              ),

              Text(
                termoPesquisado == null
                    ? ''
                    : 'Termo pesquisado: $termoPesquisado',
              ),

              const SizedBox(height: 10),

              Text(
                'Receitas para você',
                style: GoogleFonts.poppins(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF303030),
                ),
              ),

              const SizedBox(height: 30),

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

              const ReceitaCard(
                nome: 'Bruschetta de tomate e manjericão',
                tempo: '25 min',
                dificuldade: 'Fácil',
                avaliacao: '4.7',
                imagem: 'https://cdn.dummyjson.com/recipe-images/7.webp',
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
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF303030),
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  '$tempo · $dificuldade',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
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
                      style: GoogleFonts.poppins(
                        fontSize: 14,

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
