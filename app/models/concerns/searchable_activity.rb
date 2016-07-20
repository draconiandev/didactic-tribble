module SearchableActivity
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks
    
    # Sync up Elasticsearch with PostgreSQL.
    after_commit :index_document, on: [:create, :update]
    after_commit :delete_document, on: [:destroy]

    settings INDEX_OPTIONS do
      mappings dynamic: 'false' do
        indexes :title, analyzer: 'autocomplete'
        indexes :overview, analyzer: 'english'
        indexes :itinerary, analyzer: 'english'
        indexes :difficulty
        indexes :slug
        indexes :category do
          indexes :name, analyzer: 'english'
        end
        indexes :destination do
          indexes :name, analyzer: 'english'
        end
      end
    end

    def self.search(term)
      __elasticsearch__.search(
        {
          query: {
            filtered: {
              query: {
                multi_match: {
                  query: term,
                  fields: ['title^10', 'itinerary', 'overview', 'category.name^10', 'destination.name^10']
                }
              }
            }
          }
        }
      )
    end
  end

  def as_indexed_json(options = {})
    self.as_json({
      only: [:title, :itinerary, :overview, :slug],
      include: {
        destination: { only: :name },
        category: { only: :name }
      }
    })
  end

  def index_document
    ElasticsearchIndexJob.perform_later('index', 'Activity', self.id)
  end

  def delete_document
    ElasticsearchIndexJob.perform_later('delete', 'Activity', self.id)
  end

  INDEX_OPTIONS =
    { number_of_shards: 1, analysis: {
    filter: {
      "autocomplete_filter" => {
        type: "edge_ngram",
        min_gram: 1,
        max_gram: 20
      }
    },
    analyzer: {
      "autocomplete" => {
        type: "custom",
        tokenizer: "standard",
        filter: [
          "lowercase",
          "autocomplete_filter"
        ]
      }
    }
  }
  }
end