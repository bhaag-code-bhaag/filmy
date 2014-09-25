module BootstrapFlashHelper
  ALERT_TYPES = [:success, :info, :warning, :danger] unless const_defined?(:ALERT_TYPES)

  def bootstrap_flash(options = {})
    flash_messages = []
    flash.each do |type, message|
      # Skip empty messages, e.g. for devise messages set to nothing in a locale file.
      next if message.blank?
      type = get_type_based_on_type(type)
      next unless ALERT_TYPES.include?(type)
      Array(message).each do |msg|
        flash_messages << flash_div(msg, type, options) if msg
      end
    end
    flash_messages.join("\n").html_safe
  end

  private

    def flash_div(msg, type, options = {})
      content_tag(:div, class: "alert fade in alert-#{type} #{options[:class]}") do
        content_tag(:button, raw("&times;"), class: "close", "data-dismiss" => "alert") + msg
      end
    end

    def get_type_based_on_type(type)
      type = type.to_sym
      case type
      when :notice then :success
      when :alert then :danger
      when :error then :danger
      else
        type
      end
    end
end
