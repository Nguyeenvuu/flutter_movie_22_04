class Genre {
  static Map<String, String> genres = {
    "10759": "Action & Adventure",
    "16": "Animation",
    "35": "Comedy",
    "80": "Crime",
    "99": "Documentary",
    "18": "Drama",
    "12": "Adventure",
    "14": "Fantasy",
    "28": "Action",
    "27": "Horror",
    "10751": "Family",
    "10762": "Kids",
    "9648": "Mystery",
    "10763": "News",
    "10764": "Reality",
    "10765": "Sci-Fi & Fantasy",
    ":10766": "Soap",
    "10767": "Talk",
    "10768": "War & Politics",
    "37": "Western",
    "36": "History",
    "10402": "Music",
    "10749": "Romance",
    "878": "Science Fiction",
    "10770": "TV Movie",
    "53": "Thriller",
    "10752": "War"
  };

  static String getGenre(String id) {
    return genres[id];
  }

  bool animation = false;
  bool comedy = false;
  bool crime = false;
  bool documentary = false;
  bool drama = false;
  bool adventure = false;
  bool fantasy = false;
  bool action = false;
  bool family = false;
  bool history = false;
  bool horror = false;
  bool music = false;
  bool mystery = false;
  bool romance = false;
  bool sciencefiction = false;
  bool thriller = false;
  bool war = false;
  bool western = false;
  Genre(
      {this.animation,
      this.comedy,
      this.crime,
      this.documentary,
      this.drama,
      this.adventure,
      this.fantasy,
      this.action,
      this.family,
      this.history,
      this.horror,
      this.music,
      this.mystery,
      this.romance,
      this.sciencefiction,
      this.thriller,
      this.war,
      this.western});
}
