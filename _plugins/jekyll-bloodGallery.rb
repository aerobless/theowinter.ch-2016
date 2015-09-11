#BloodGallery generates a HTML page for every photo specified in _data/photos.yaml
#Author: Theo Winter (https://github.com/aerobless)


module Jekyll
  class PhotoPage < Page
    def initialize(site, base, dir, photo_url, previous_pic, next_pic, title)
      @site = site
      @base = base
      @dir = dir
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'photo.html')
      self.data['photo_url'] = photo_url
      self.data['previous_pic'] = previous_pic
      self.data['next_pic'] = next_pic
      self.data['title'] = title
      self.data['comments'] = true
    end
  end

  class PhotoPageGenerator < Generator
    safe true

    def generate(site)
      photos = YAML::load_file('_data/photos.yaml')
      dir = site.config['photo_dir'] || 'photography'
      photos.each do |photo,details|
        #Iterate through array & return previous, current & next
        [nil, *details, nil].each_cons(3){|prev, curr, nxt|
          photo_url = curr["img"]
          title = curr["title"]
          title_stub = title.strip.gsub(' ', '-').gsub(/[^\w-]/, '') #remove non-alpha and replace spaces with hyphens
          if(prev != nil)
            previous_pic = prev["title"].strip.gsub(' ', '-').gsub(/[^\w-]/, '')
          else
            previous_pic = ""
          end
          if(nxt != nil)
            next_pic = nxt["title"].strip.gsub(' ', '-').gsub(/[^\w-]/, '')
          else
            next_pic = ""
          end
          site.pages << PhotoPage.new(site, site.source, File.join(dir, title_stub), photo_url, previous_pic, next_pic, title)
        }
      end
    end
  end
end

module TextFilter
  def toStub(input)
    input.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end
end

Liquid::Template.register_filter(TextFilter)