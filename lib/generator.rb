# frozen_string_literal: true
require "jekyll"

module Jekyll
  
  # Injects front matter defaults to set default category/sub-category values
  class CategorizePagesGenerator < Jekyll::Generator
    # priority :high
    safe true

    def log(*args)
      puts args
    end

    def get_collection(name)
      @site.collections[name] ? @site.collections[name].docs : []
    end

    def add_to_frontmatter(item)
      item.data["category"] = @category # i.data is the front matter header
      item.data["sub_category"] = @sub_category
    end

    
    def isValid?(item)
        folders_to_categorize = @site.data["pagerrr_folders_to_categorize"] || []
        puts folders_to_categorize
        # all_categories.include?(page[:n])
        path = item.relative_path.split('/')
        # category = path[0].sub(/^_/, '') # Remove first letter if underscore
        @category = path[1] if path[1] != "index.md"
        @sub_category = path[2] if path[2] != "index.md"
        file = path[3] if path[3] != "index.md"
        # puts '^^^^^^^^^^^^^'
        # puts @category
        # puts @sub_category

      return folders_to_categorize.include?(@category)
    end



    def generate(site)
      puts "RAN!"
      # @site = site
      # # The collections to add category/sub category front matter values
      # collections = ["pages"] # TODO: Move this variable to _config/_data

      # for c in collections
      #   for item in get_collection(c)
      #     valid_category = isValid?(item)
      #     if valid_category
      #       add_to_frontmatter(item)
      #     end
      #   end
      # end

    end

  end
end
