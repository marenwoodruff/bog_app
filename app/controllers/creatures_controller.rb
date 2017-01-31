class CreaturesController < ApplicationController
    def index
        @creatures = Creature.all
    end

    def new
        @creature = Creature.new
        # remember the default behavior is to render :new
    end

    def create
        # create a new creature from `creature_params`
        creature = Creature.new(creature_params)

        # if creature saves, redirect to route that displays all creatures
        if creature.save
            redirect_to creatures_path
            # redirect_to creatures_path is equivalent to:
            # redirect_to "/creatures"
        end
    end

    # display a specific creature
    def show
        # get the creature id from the url params
        creature_id = params[:id]

        # use `creature_id` to find the creature in the database
        # and save it to an instance variable
        @creature = Creature.find_by_id(creature_id)

        # render the show view (it has access to instance variable)
        # remember the default behavior is to render :show
    end

    # show the edit creature form
    def edit
        # get the creature id from the url params
        creature_id = params[:id]

        # use `creature_id` to find the creature in the database
        # and save it to an instance variable
        @creature = Creature.find_by_id(creature_id)

        # render the edit view (it has access to instance variable)
        # remember the default behavior is to render :edit
    end

    # update a creature in the database
    def update
        # get the creature id from the url params
        creature_id = params[:id]

        # use `creature_id` to find the creature in the database
        creature = Creature.find_by_id(creature_id)

        # update the creature
        creature.update_attributes(creature_params)

        # redirect to show page for the updated creature
        redirect_to creature_path(creature)
        # redirect_to creature_path(creature) is equivalent to:
        # redirect_to "/creatures/#{creature.id}"
    end

    # delete a creature from the database
    def destroy
        # get the creature id from the url params
        creature_id = params[:id]

        # use `creature_id` to find the creature in the database
        # and save it to an instance variable
        creature = Creature.find_by_id(creature_id)

        # destroy the creature
        creature.destroy

        # redirect to creatures index
        redirect_to creatures_path
        # redirect_to creatures_path is equivalent to:
        # redirect_to "/creatures"
    end


    private
    def creature_params
      # whitelist params return whitelisted version
      params.require(:creature).permit(:name, :description) 
    end
end
