class Film
    attr_reader :title,
                :original_title,
                :api_id,
                :overview,
                :vote_average,
                :adult,
                :popularity

    def initialize(data)
        @title = data[:title]
        @original_title = data[:original_title]
        @adult = data[:adult]
        @api_id = data[:id]
        @popularity = data[:popularity]
        @vote_average = data[:vote_average]
        @overview = data[:overview]
    end
end