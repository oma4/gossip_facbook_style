class GossipController < ApplicationController
  
  def new
  	Gossip.new
  end
  def create
    anonymous=User.new(first_name:"Anonymous", last_name:"unknown",age: 99,description: "unknown",email:"unknown#{rand(1000)}@mail.com",city_id:City.all.sample.id)
    anonymous.save
  	@gossip=Gossip.new(title: params[:gossip_title], content: params[:gossip_content], user_id: anonymous.id)
    if @gossip.save
      render 'index'
    else
      anonymous.destroy
      render 'new'
    end
  end

  def show
     @comments = Comment.all
    @gossip = Gossip.find(params[:id])
  end

  def index
    @gossips = Gossip.all
  end

  def edit
tag    # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
  end

  def update

    def update 
    @gossip = Gossip.find(params[:id])
    if @gossip.update('title' => params[:title], 'content' => params[:content], 'user_id' => @gossip.user_id)
      flash[:success] = "Potin créé !"
      redirect_to @gossip
    else
      flash[:notice] = "Un problème est survenu !"
      render :edit
    end
  end


    # Méthode qui met à jour le potin à partir du contenu du formulaire de edit.html.erb, soumis par l'utilisateur
    # pour info, le contenu de ce formulaire sera accessible dans le hash params
    # Une fois la modification faite, on redirige généralement vers la méthode show (pour afficher le potin modifié)
  end
end
