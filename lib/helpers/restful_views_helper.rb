module RestfulViewsHelper
  def index_link(*args)
    resourceful_link(args, false, :index, 'Show all')
  end
  
  def show_link(*args)
    resourceful_link(args, true, :show, 'Show')
  end
  
  def new_link(*args)
    resourceful_link(args, false, :new, 'Create')
  end
  
  def edit_link(*args)
    resourceful_link(args, true, :edit, 'Edit')
  end
  
  def destroy_link(*args)
    resourceful_link(args, true, :destroy, 'Remove', :method => :delete, :confirm => "Remove this {{model_type}}?")
  end

  protected
  def resourceful_link(args, require_id, method, label, extra_options = {})
    model_type, id, options = extract_link_args(args)
    raise ArgumentError.new('Missing parameter model_type') if model_type.blank?
    raise ArgumentError.new('Missing parameter id') if require_id && id.blank?
    raise ArgumentError.new('Illegal parameter id') if !require_id && !id.blank?

    label = options.delete(:label) || label
    
    extra_options[:confirm] = extra_options[:confirm].gsub('{{model_type}}', model_type) unless extra_options[:confirm].nil?

    css_class = css_classes_for(model_type, method, options.delete(:class))
    options.merge!(:class => css_class)
    options = extra_options.merge(options)

    link_to label, { :controller => model_type.pluralize, :action => method, :id => id}, options
  end
  
  def extract_link_args(args)
    options = args.pop if args.last.is_a? Hash
    options ||= {}
    
    if (args.first.is_a? Symbol) || (args.first.is_a? String)
      model_type = args[0].to_s
      id = args[1]
    elsif !args.empty?
      obj = args.first
      model_type = obj.class.name.underscore
      id = obj.id
    end

    return model_type, id, options
  end

  def css_classes_for(model_type, action, css_class)
    [model_type, action, "#{action}_#{model_type}", css_class].compact.join(' ')
  end
end