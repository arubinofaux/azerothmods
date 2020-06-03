class PageController < ApplicationController
  def home
    @mods = Mod.where(mod_type: "module").order('repo_updated_at DESC')
  end

  def tools
    @mods = Mod.where(mod_type: "tool").order('repo_updated_at DESC')
  end

  def lua
    @mods = Mod.where(mod_type: "lua-script").order('repo_updated_at DESC')
  end

  def search
    @search = params["q"]
    @mods = Mod.where("name LIKE :search OR description LIKE :search", search: "%#{@search}%")
  end
end
