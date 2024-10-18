require 'net/http'
require 'json'
require 'uri'
require 'base64'

module Jekyll
  class FetchReadmeTag < Liquid::Tag
    def initialize(tag_name, repo, tokens)
      super
      @repo = repo.strip
      @token = ENV['TOKEN']  # Fetch the token from an environment variable
    end

    def render(context)
      site = context.registers[:site]
      # @logger = site.config['logger'] || Jekyll.logger

      # @logger.info "FetchReadmeTag: Starting to fetch README for repo: #{@repo}"
      
      uri = URI.parse("https://api.github.com/repos/#{@repo}/readme")
      request = Net::HTTP::Get.new(uri)
      request['Authorization'] = "token #{@token}" if @token

      response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
        http.request(request)
      end

      json = JSON.parse(response.body)

      if json["content"]
        markdown = Base64.decode64(json["content"]).force_encoding("UTF-8")
        # @logger.info "FetchReadmeTag: README content fetched successfully"
        
        fixed_markdown = fix_image_urls(markdown)
        html = Kramdown::Document.new(fixed_markdown).to_html
        final_html = fix_html_image_urls(html)
        
      else
        # @logger.error "FetchReadmeTag: README file not found."
        "Error: README file not found."
      end
    rescue => e
      # @logger.error "FetchReadmeTag Error: #{e.message}"
      "Error: #{e.message}"
    end

    private

    def fix_image_urls(markdown)
      # @logger.info "FetchReadmeTag: Fixing image URLs in Markdown"
      markdown.gsub(/!\[([^\]]*)\]\(([^\)]+)\)/) do |match|
        alt_text = $1
        url = $2.strip
        fixed_url = convert_url(url)
        # @logger.info "FetchReadmeTag: Markdown - Original URL: #{url}, Converted URL: #{fixed_url}"
        "![#{alt_text}](#{fixed_url})"
      end
    end

    def fix_html_image_urls(html)
      # @logger.info "FetchReadmeTag: Fixing image URLs in HTML"
      html.gsub(/<img[^>]*src="([^"]+)"[^>]*>/) do |match|
        full_tag = match
        url = $1
        fixed_url = convert_url(url)
        # @logger.info "FetchReadmeTag: HTML - Original URL: #{url}, Converted URL: #{fixed_url}"
        full_tag.sub(url, fixed_url)
      end
    end

    def convert_url(url)
      if url.start_with?('http://', 'https://')
        url
      else
        relative_url = url.sub(/^\//, '').sub(/^projects\/[^\/]+\//, '')
        "https://raw.githubusercontent.com/#{@repo}/main/#{relative_url}"
      end
    end
  end
end

Liquid::Template.register_tag('fetch_readme', Jekyll::FetchReadmeTag)