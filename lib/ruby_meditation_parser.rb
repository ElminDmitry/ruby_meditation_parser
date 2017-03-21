require 'ruby_meditation_parser/version'
require 'open-uri'
require 'nokogiri'

module RubyMeditationParser
  class ParseRubyMeditation

    attr_reader :doc

    def initialize(link)
      @doc = Nokogiri::HTML(open(link))
    end

    def meetup_description
      @doc.at_css('[id="about-the-conference"]').next_element.text
    end

    def meetup_description_title
      @doc.at_css('[id="about-the-conference"]').text
    end

    def speakers
      @doc.at_css('.description', '.description_active').at('ul').text.lstrip.split("\n")
    end

    def sponsors_links
      parse_elements(@doc.at_css('.references').search('ul.list-sp > li'))
    end

    def partners_links
      parse_elements(@doc.at_css('[id="report"]').next_element.search('ul.list-sp > li'))
    end

    def parse_elements(elements)
      elements = elements.each_with_index.map do |li, i|
        li.children.first.attributes['href'].value
      end
      elements.take(elements.size - 1)
    end

    def buy_tickets
      'https://www.eventbrite.com/e/ruby-meditation-14-tickets-32118300702?aff=es2'
    end
  end
end
