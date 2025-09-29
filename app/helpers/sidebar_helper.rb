module SidebarHelper
  def render_sidebar(user)
    return unless user

    if user.admin?
      render 'shared/sidebar/sidebar'
    elsif user.gestor?
      render 'shared/sidebar/sidebar_gestor'
    else
      render 'shared/sidebar/sidebar' 
    end
  end
end
