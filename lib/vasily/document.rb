module Vasily
  class Document
    attr_reader :text, :tag
    def initialize(text, tag)
      @text = text
      @tag = tag
    end

    def to_hash
      {'text' => @text, 'tag' => @tag}
    end
  end
end
