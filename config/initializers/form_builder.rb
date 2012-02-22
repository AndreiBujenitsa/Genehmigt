class ActionView::Helpers::FormBuilder
alias :orig_label :label

# add a '*' after the field label if the field is required
def label(method, content_or_options = nil, options = {}, &block)
if content_or_options && content_or_options.class == Hash
options = content_or_options
else
content = content_or_options
end

required_mark = ''
required_mark = ' *'.html_safe if options[:required]

content ||= I18n.t("activerecord.attributes.#{object.class.name.underscore}.#{method}", :default=>method.to_s.humanize)
content = content + required_mark

self.orig_label(method, content, options || {}, &block)
end
end
