RSpec::Matchers.define :have_picture_for do |record|
  match do |page|
    figure_id = "figure##{dom_id(record)}_picture"
    figure = page.find(figure_id)
    expect(figure["title"]).to eq record.name
    expect(figure["data-media"]).to eq record.photo.url(:small)
    expect(figure["data-media600"]).to eq record.photo.url(:large)

    noscript = page.find("#{figure_id} noscript img")
    expect(noscript["src"]).to eq record.photo.url(:original)
  end
end