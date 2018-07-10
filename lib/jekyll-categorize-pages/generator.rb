# frozen_string_literal: true

module JekyllCategorizePages

  # Injects front matter defaults to set default category/sub-category values
  class CategorizePageGenerator < Jekyll::Generator
    attr_accessor :site

    # priority :high
    safe true
    
    def initialize(site)
      @site = site
    end

    def get_collection(name)
      @site.collections[name] ? @site.collections[name].docs : []
    end

    def add_category_and_sub_category(item, values)
      # puts "adding: #{item.relative_path}"
      # puts "values: #{values}"

      item.data["category"] = values[:category] # i.data is the front matter header
      item.data["sub_category"] = values[:sub_category]
    end

    def add_category_only(item, values)
      # puts "adding: #{item.relative_path}"
      # puts "values: #{values}"
      item.data["category"] = values[:category]
      # item.data["sub_category"] = values[:sub_category].slice(0, values[:sub_category].length - 3)
    end

    
    def isValid?(item)
      all_categories = @site.data["all_categories"] || [] # sub folders inside collection
      path = item.relative_path.split('/')

      category = path[1] if path[1] != "index.md"
      
      # ignore index.md pages
      if path.include?("index.md")
        return false
      end

      # if category folder has no sub categories
      if path.length == 3
        # puts "path: #{path}"
        # puts "length: #{path.length}"
        header_values = get_header_values_to_add(item)
        add_category_only(item, header_values)
        return false
      end

      return all_categories.include?(category)
    end


    def get_header_values_to_add(item)
      all_categories = @site.data["all_categories"] || [] # sub folders inside collection
      # puts "-----------------------"
      # puts "all_categories: #{all_categories}"
      # puts "item.relative_path: #{item.relative_path}"

      path = item.relative_path.split('/')
      category = path[1] if path[1] != "index.md"
      # puts "@category: #{@category}"
      sub_category = path[2] if path[2] != "index.md"
      # puts "@sub_category: #{@sub_category}"
      file = path[3] if path[3] != "index.md"
      # puts "file: #{file}"

      return {
        :category => category,
        :sub_category => sub_category,
        :file => file
      }
    end

    def generate(site)
      @site = site
      # The collections to add category/sub category front matter values
      collections = ["pages"] # TODO: Move this variable to _config/_data

      for c in collections
        for item in get_collection(c)
          valid_category = isValid?(item)
          if valid_category
            header_values = get_header_values_to_add(item)
            # puts "header_values: #{header_values}"
            add_category_and_sub_category(item, header_values)
          end
        end
      end
    end

  end
end
