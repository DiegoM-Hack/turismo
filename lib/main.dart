import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const MyApp());
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Flutter layout demo';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(title: const Text(appTitle)),
        body: const SingleChildScrollView(
          
          child: Column(
            children: [

            ImageSection(image: 'images/torre.jpg'),
            TitleSection(name: 'Torre Eiffel', location: 'París, Francia'),
            ButtonSection(),
            TextSection(
              description:
              'La Torre Eiffel es uno de los monumentos más famosos del mundo y símbolo de Francia. Fue construida en 1889 y recibe millones de visitantes cada año.',
            ),

            ImageSection(image: 'images/china.jpg'),
            TitleSection(name: 'Gran Muralla China', location: 'China'),
            ButtonSection(),
            TextSection(
              description:
              'La Gran Muralla China es una enorme construcción histórica creada para proteger antiguos territorios chinos y se extiende por miles de kilómetros.',
            ),

            ImageSection(image: 'images/Machu.jpg'),
            TitleSection(name: 'Machu Picchu', location: 'Cusco, Perú'),
            ButtonSection(),
            TextSection(
              description:
              'Machu Picchu es una antigua ciudad inca ubicada entre montañas. Es considerada una de las maravillas del mundo moderno.',
            ),

            ImageSection(image: 'images/estatua.jpg'),
            TitleSection(name: 'Estatua de la Libertad', location: 'Nueva York, EE.UU'),
            ButtonSection(),
            TextSection(
              description:
              'La Estatua de la Libertad es un símbolo mundial de libertad y uno de los principales atractivos turísticos de Estados Unidos.',
            ),

            ImageSection(image: 'images/majal.jpg'),
            TitleSection(name: 'Taj Mahal', location: 'Agra, India'),
            ButtonSection(),
            TextSection(
              description:
              'El Taj Mahal es un impresionante mausoleo construido en mármol blanco y considerado una joya arquitectónica mundial.',
            ),

            ImageSection(image: 'images/cristo.jpg'),
            TitleSection(name: 'Cristo Redentor', location: 'Río de Janeiro, Brasil'),
            ButtonSection(),
            TextSection(
              description:
              'El Cristo Redentor es una enorme estatua ubicada sobre el cerro Corcovado y es uno de los símbolos más importantes de Brasil.',
            ),

            ImageSection(image: 'images/piramide.jpg'),
            TitleSection(name: 'Pirámides de Giza', location: 'Egipto'),
            ButtonSection(),
            TextSection(
              description:
              'Las Pirámides de Giza son una de las siete maravillas del mundo antiguo y representan uno de los mayores logros arquitectónicos egipcios.',
            ),

            ImageSection(image: 'images/roma.jpg'),
            TitleSection(name: 'Coliseo Romano', location: 'Roma, Italia'),
            ButtonSection(),
            TextSection(
              description:
              'El Coliseo Romano fue un anfiteatro utilizado para espectáculos y combates de gladiadores durante el Imperio Romano.',
            ),

            ImageSection(image: 'images/santorini.jpg'),
            TitleSection(name: 'Santorini', location: 'Grecia'),
            ButtonSection(),
            TextSection(
              description:
              'Santorini es una famosa isla griega conocida por sus casas blancas, cúpulas azules y vistas espectaculares al mar.',
            ),

            ImageSection(image: 'images/kioto.jpg'),
            TitleSection(name: 'Kioto', location: 'Japón'),
            ButtonSection(),
            TextSection(
              description:
              'La Ópera de Sídney es uno de los edificios más reconocidos del mundo y un importante centro cultural de Australia.',
            ),

],
          ),
        ),
      ),
    );
  }
}

class TitleSection extends StatelessWidget {
  const TitleSection({super.key, required this.name, required this.location});

  final String name;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(location, style: TextStyle(color: Colors.grey[500])),
              ],
            ),
          ),
          //Agregamos un icono interactivo de favorito y un contador de favoritos
          FavoriteWidget(),
        ],
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).primaryColor;
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ButtonWithText(color: color, icon: Icons.call, label: 'CALL'),
          //Agregamos un nuevo botón de ruta y agremas un link para compartir la ubicación del lugar

          ButtonWithText(
  color: color,
  icon: Icons.near_me,
  label: 'ROUTE',

  onPressed: (){
    abrirMapa('París, Francia');
  },
),
          ButtonWithText(color: color, icon: Icons.share, label: 'SHARE'),
        ],
      ),
    );
  }

}

class ButtonWithText extends StatelessWidget {

  const ButtonWithText({
    super.key,
    required this.color,
    required this.icon,
    required this.label,
    this.onPressed,
  });

  final Color color;
  final IconData icon;
  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {

    return InkWell(

      onTap: onPressed,

      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          Icon(icon, color: color),

          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TextSection extends StatelessWidget {
  const TextSection({super.key, required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Text(description, softWrap: true),
    );
  }
}

class ImageSection extends StatelessWidget {
  const ImageSection({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.asset(image, width: 600, height: 240, fit: BoxFit.cover);
  }
}

class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({super.key});

  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();
}


class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 41;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.center,
            icon: (_isFavorited
                ? const Icon(Icons.star)
                : const Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(width: 18, child: SizedBox(child: Text('$_favoriteCount'))),
      ],
    );
  }

void _toggleFavorite() {
  setState(() {
    if (_isFavorited) {
      _favoriteCount -= 1;
      _isFavorited = false;
    } else {
      _favoriteCount += 1;
      _isFavorited = true;
    }
  });
}
}

//Funcion para abrir la ubicación del lugar en una aplicación de mapas, como Google Maps

Future<void> abrirMapa(String lugar) async {

  final Uri url = Uri.parse(
    'https://www.google.com/maps/search/?api=1&query=$lugar'
  );

  if (!await launchUrl(url)) {
    throw Exception('No se pudo abrir el mapa');
  }
}