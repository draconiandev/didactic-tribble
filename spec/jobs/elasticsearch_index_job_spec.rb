describe ElasticsearchIndexJob, type: :job do
  include ActiveJob::TestHelper

  it 'queues the job' do
    expect { job }
      .to change(ActiveJob::Base.queue_adapter.enqueued_jobs, :size).by(1)
  end

  it 'is in elasticsearch queue' do
    expect(ElasticsearchIndexJob.new.queue_name).to eq('elasticsearch')
  end

  scenario 'executes perform' do
    category = create(:category)
    perform_enqueued_jobs { ElasticsearchIndexJob.perform_later('index', 'Category', category.id) }
  end

  after do
    clear_enqueued_jobs
    clear_performed_jobs
  end
end
