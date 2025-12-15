module ApplicationHelper
  def input_classes
    "block shadow-sm rounded-md border px-3 py-2 mt-2 w-full"
  end

  def blue_btn_classes
    "w-full sm:w-auto rounded-md px-3.5 py-2.5 bg-blue-600 hover:bg-blue-500 text-white inline-block font-medium cursor-pointer"
  end

  def gray_btn_classes
    "w-full sm:w-auto text-center mt-2 sm:mt-0 sm:ml-2 rounded-md px-3.5 py-2.5 bg-gray-100 hover:bg-gray-50 inline-block font-medium"
  end

  def error_class(item, field)
    {
      "border-gray-400 focus:outline-blue-600": item.errors[field].none?,
      "border-red-400 focus:outline-red-600": item.errors[field].any?
    }
  end
end
