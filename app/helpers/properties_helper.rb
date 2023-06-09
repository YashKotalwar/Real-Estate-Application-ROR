module PropertiesHelper

  def property_thumbnail property
    img = property.photo.present? ? property.photo.thumb.url : "placeholder.png"
    image_tag img, class: "property-thumb"
  end

  def property_thumbnail_url property
    property.photo.present? ? property.photo.thumb.url : "placeholder.png"
  end

  def property_photo_url property
    property.photo.present? ? property.photo.url : asset_url("placeholder4.png")
    # asset_url(property.images)
  end


end
