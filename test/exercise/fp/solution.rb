module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(_array)
        arr = _array.select {|value| value["country"] =~ /.+,.+/}  
        arr = arr.select {|value| value['rating_kinopoisk'].to_f != 0}
        allRating = arr.reduce(0) {|rating, value| rating += value["rating_kinopoisk"].to_f}
        allRating / arr.size
      end

      def chars_count(_films, _threshold)
        arr = _films.select {|value| value["rating_kinopoisk"].to_f >= _threshold}
        arr.reduce(0) {|count, value| count += value["name"].scan('и').size}
      end
    end
  end
end
