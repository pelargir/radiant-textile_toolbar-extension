begin
  require_dependency 'application_controller'
rescue MissingSourceFile
  require_dependency 'application'
end

class TextileToolbarExtension < Radiant::Extension
  version "1.0"
  description "Adds toolbars to Textile-enabled text areas in the admin."
  url "http://dev.radiantcms.org/radiant/browser/trunk/extensions/textile_toolbar"
  
  def activate
    Admin::PagesController.class_eval do
      before_filter :set_textile_toolbar_javascript
      def set_textile_toolbar_javascript
        %w(lowpro textile_toolbar).each { |e| include_javascript e }
      end
    end
  end
end

# SDG
