class Film
    attr_reader :title,
                :original_title,
                :api_id,
                :overview,
                :vote_average,
                :adult,
                :popularity,
                :genres,
                :runtime,
                :cast,
                :reviews

    def initialize(data, cast = "nil", reviews = "nil")
        @title = data[:title]
        @original_title = data[:original_title]
        @adult = data[:adult]
        @api_id = data[:id]
        @runtime = data[:runtime]
        @popularity = data[:popularity]
        @vote_average = data[:vote_average]
        @overview = data[:overview]
        @genres = data[:genres]
        @cast = cast
        @reviews = reviews
    end
end