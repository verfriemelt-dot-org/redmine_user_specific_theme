require 'application_helper'

module RedmineUserSpecificTheme::Patches
  module ApplicationHelperPatch
    extend ActiveSupport::Concern

    included do
      alias_method :current_theme, :current_theme_with_user_specific
    end

    def current_theme_with_user_specific
      user_theme = Redmine::Themes.theme(User.current.pref.ui_theme)
      user_theme || Redmine::Themes.theme(Setting.ui_theme)
    end



  end
end
