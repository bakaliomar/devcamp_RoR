module BlogsHelper
    def gravatar_helper user
        image_tag "https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email)}", width: 60
    end

    class CodeRayify < Redcarpet::Render::HTML
        def block_code(code, language)
            CodeRay.scan(code, language).div
        end
    end

    def markdown(text)
        coderayified = CodeRayify.new(filter_html: true, hard_wrap: true)
        options = {
            fenced_code_blocks: true,
            no_intra_emphasis: true,
            autolink: true,
            lax_html_blocks: true
        }
        markdown_to_html = Redcarpet::Markdown.new(coderayified, options)
        markdown_to_html.render(text).html_safe
    end
    def blog_status_icon blog
        if blog.draft?
            fa_icon('lock').html_safe
        else
            fa_icon('globe').html_safe
        end
    end
end
