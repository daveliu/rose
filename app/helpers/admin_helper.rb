module AdminHelper
  def current_admin
    @current_admin
  end

  def menu_image(image, align)
    "<img src='/images/admin/public/#{image}' width='18' height='18' border='0' align='#{align}' />"
  end

  def get_eq_options(obj)
    [["请选择", ""]] + obj.map {|o| [o.value, o.id] }
  end
end
