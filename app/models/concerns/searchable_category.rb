module SearchableCategory
  extend ActiveSupport::Concern

    included do
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks

    # Sync up Elasticsearch with PostgreSQL.
    after_commit :index_document, on: [:create, :update]
    after_commit :delete_document, on: [:destroy]

    settings INDEX_OPTIONS do
      mappings dynamic: 'false' do
        indexes :name, analyzer: 'autocomplete'
        indexes :description, analyzer: 'english'
        indexes :activity do
          indexes :title, analyzer: 'autocomplete'
        end
      end
    end

    def self.search(term)
      __elasticsearch__.search(
        {
          query: {
            multi_match: {
              query: term,
              fields: ['name', 'description', 'activity.title']
            }
          }
        }
      )
    end
  end

  def as_indexed_json(options ={})
    self.as_json({
      only: [:name]
    })
  end

  def index_document
    # ElasticsearchIndexJob.perform_later('index', 'Category', self.id)
    __elasticsearch__.index_document if Category.present?
  end

  def delete_document
    # ElasticsearchIndexJob.perform_later('delete', 'Category', self.id)
    __elasticsearch__.delete_document if Category.present?
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