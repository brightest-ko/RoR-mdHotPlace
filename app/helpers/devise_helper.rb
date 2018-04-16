module DeviseHelper
    #def devise_error_messages!
    #  return '' if resource.errors.empty?
  
    #  messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    #  sentence = I18n.t('errors.messages.not_saved',
    #    count: resource.errors.count,
    #    resource: resource.class.model_name.human.downcase)
  
    #  html = <<-HTML
    #  <div class="alert alert-danger alert-block">
    #    <button type="button" class="close" data-dismiss="alert">x</button>
    #    <h4>#{sentence}</h4>
    #    #{messages}
    #  </div>
    #  HTML
  
    #  html.html_safe
    #end
    def devise_error_messages!
      if resource.errors.full_messages.any?
          flash.now[:error] = resource.errors.full_messages
      end
      return ''
    end
  end