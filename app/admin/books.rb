ActiveAdmin.register Book do
  permit_params :title, :author, :image, :genre, :year, :publisher
end
