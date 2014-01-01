RSpec::Matchers.define :have_picture_for do |record|
  match do |page|
    figure_id = "figure##{dom_id(record)}_picture"
    figure = page.find(figure_id)
    expect(figure["title"]).to eq record.name
    {
      "data-media"    => :small,
      "data-media480" => :medium,
      "data-media800" => :large
    }.each do |media, size|
      expect(figure[media]).to eq record.photo.url(size)
    end

    noscript = page.find("#{figure_id} noscript img")
    expect(noscript["src"]).to eq record.photo.url(:original)
  end
end
