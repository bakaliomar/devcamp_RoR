module ApplicationHelper
    def login_helper style = ""
        if !current_user.is_a?(GuestUser)
            link_to "logout", destroy_user_session_path, method: :delete, class: style
        else 
            (link_to "login", new_user_session_path, class: style) + " ".html_safe + 
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
    def nav_items
        [
            {
                url: root_path,
                title: 'Home'
            },
            {
                url: about_path,
                title: 'About-Me'
            },
            {
                url: contact_path,
                title: 'Contact-Me'
            },
            {
                url: blogs_path,
                title: 'Blog'
            },
            {
                url: portfolios_path,
                title: 'Portfolio'
            }
        ]
    end
    def nav_helper style, tag_type
    nav_links = ""
    nav_items.each do |item|
        nav_links << "<#{tag_type}><a href='#{item[:url]}' class='#{style} #{Active? item[:url]}'>#{item[:title]}</a></#{tag_type}>"
    end
        nav_links.html_safe
    end
    def Active? path
        "active" if current_page? path
    end
    def alerts
        alert = (flash[:alert] || flash[:error] || flash[:notice])
        if alert
            alert_generator alert
        end
    end
    def alert_generator msg
         js add_gritter(msg, title: "Omar El Bakali Portfolio", sticky: false)
    end
end
