class StaticPagesController < ApplicationController

  class Staff
    @first_name
    @last_name
    @image
    attr_accessor :first_name, :last_name, :image
    def initialize first_name, last_name, image
      @first_name = first_name
      @last_name = last_name
      @image = image
      puts @first_name
      puts @last_name
    end
  end

  def home
  end

  def help
  end

  def about
  end

  def departments
  end

  def department1
    @name = "Facilities"
    @contact = {"name"=>"Etiam et Sapien Laoreet",
                "phone"=>"(641) 306-2470",
                "email"=>"example@grinnell.edu",
                "image"=>"https://proxy.duckduckgo.com/iu/?u=https%3A%2F%2Fpng.pngtree.com%2Felement_origin_min_pic%2F16%2F11%2F22%2Fd0602bee0dc5e3ef2e3efef66cdc1c22.jpg&f=1"    }
    @description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut sollicitudin dignissim nibh vitae lobortis. Nulla vel pretium tortor, at ultricies risus. Suspendisse id consectetur eros. Integer a mi consectetur, tempor nisl quis, mollis nisl. Aliquam nec purus enim. Proin elementum consequat ex, vel vestibulum nulla. Suspendisse potenti. Donec tempus libero a consequat convallis. Nam pulvinar non tortor eu vestibulum. "
    @services = {"message":"",
                 "services"=>["Suspendisse ac euismod felis", "Integer eu libero hendrerit", "Feugiat risus vitae, laoreet risus"]}
    @staff = [Staff.new("Zander", "Oh-no", "https://proxy.duckduckgo.com/iu/?u=https%3A%2F%2Fthumbs.dreamstime.com%2Fb%2Fzander-fish-isolated-10956073.jpg&f=1"),
              Staff.new("Tran", "Le", "https://proxy.duckduckgo.com/iu/?u=https%3A%2F%2Fupload.wikimedia.org%2Fwikipedia%2Fcommons%2Fe%2Fe8%2FTule_Elk_-_Merced_National_Wildlife_Refuge_Bill_Leikam_12-03-2010.jpg&f=1"),
              Staff.new("Lyn", "Omg", "https://proxy.duckduckgo.com/iu/?u=https%3A%2F%2Ftse4.mm.bing.net%2Fth%3Fid%3DOIP.9QFRFAyGlRn1-g38mlC33gHaE7%26pid%3DApi&f=1"),
              Staff.new("John", "Lennon", "https://www.jbzoo.org/uploads/images/adoptable_animals/Otter.jpg"),
              Staff.new("Dennis", "Chan", "https://c402277.ssl.cf1.rackcdn.com/photos/806/images/hero_small/SCR_47384.jpg?1345530917")]
  end

  def department2
  end

  # def search
  #   if current_user.newUser != false
  #     current_user.newUser = false
  #     current_user.save
  #     redirect_to "/auth/register/edit"
  #   end
  # end

end