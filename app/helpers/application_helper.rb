module ApplicationHelper
    def login_helper style
        if !current_user.is_a?(GuestUser)
            link_to "logout", destroy_user_session_path, method: :delete, class: style
        else 
            (link_to "login", new_user_password_path, class: style) + " ".html_safe + 
            (link_to "register", new_user_registration_path, class: style) 
        end 
    end
    def source_helper(layout_name)
        if session[:source]
            greeting = "Thank you for visitting me on #{layout_name} from #{session[:source]}"
            content_tag(:p, greeting, class: "source_greeting")
        end
    end
    def copyright_generator
        BakViewTool::Rendrer.copyright "Omar El Bakali", "all rights reserved"
    end
end
