Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  root to: 'mains#index'
  resources :items do
    collection do
      get 'file_upload'
      put 'file_read'
    end
  end
  resources :stocks do
    collection do
      get 'file_upload'
      put 'file_read'
    end
  end
  resources :categorires do
    collection do
      get 'file_upload'
      put 'file_read'
    end
  end
  resources :item_category_relations do
    collection do
      get 'file_upload'
      put 'file_read'
    end
  end

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
