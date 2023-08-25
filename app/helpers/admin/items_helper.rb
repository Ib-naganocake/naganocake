module Admin::ItemsHelper

  def item_status_name(item)
    if item.is_sales
      '販売中'
    else
      '販売停止'
    end
  end
end
