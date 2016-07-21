module MaterializePaginationHelper
  class MaterializeRenderer < WillPaginate::ActionView::LinkRenderer
    def prepare(collection, options, template)
      options[:params] ||= {}
      options[:params]['_'] = nil
      super(collection, options, template)
    end
    
    protected

    def html_container(html)
      tag(:ul, html, class: 'pagination')
    end

    def previous_or_next_page(page, text, classname)
      classes = [(classname if @options[:page_links]), ('disabled' unless page)].join(' ')
      chevron_direction = classname == 'previous_page' ? 'left' : 'right'
      tag :li, link("<i class='material-icons'>chevron_#{chevron_direction}</i>".html_safe, page || '#!'), class: classes
    end

    def page_number(page)
      classes = ['waves-effect', ('active' if page == current_page)].join(' ')
      list_item = tag :li, page, class: classes
      link(list_item, page, rel: rel_value(page))
    end

    def gap
      tag(:li, tag(:a, '...'))
    end
  end # End of renderer class

  # Override default will_paginate html and css options
  def will_paginate(collection_or_options = nil, options = {})
    if collection_or_options.is_a? Hash
      options, collection_or_options = collection_or_options, nil
    end
    unless options[:renderer]
      options = options.merge renderer: MaterializePaginationHelper::MaterializeRenderer
    end
    super *[collection_or_options, options].compact
  end

end
