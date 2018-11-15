module ApplicationHelper
    def jiggle
        'je peux le faire'
    end


    def full_title(page_title)
        base_title = "E-POLICE"
        page_title.empty? ?  base_title : "#{base_title} | #{page_title}"
    end
end
