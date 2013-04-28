module OpmlSaw
    
  class Parser
    
    attr_reader :feeds
    
    def initialize(xml)
      @xml = xml
      @feeds = []
    end
  
    def document
      @document ||= Nokogiri::XML.parse(@xml).css("body").children
    end
  
    def has_children?(node)
      node.children.length > 0
    end
  
    def is_outline?(node)
      'outline' == node.name
    end
  
    def parse(data = nil, tag = nil)
      data ||= document
      data.each do |node|
        if is_outline?(node)
          outline = Outline.new(node, tag).to_hash
          if has_children?(node)
            title = outline[:title] || outline[:text]
            parse(node.children, title)
          else
            @feeds << outline
          end
        end
      end
    end
  
  end
end
