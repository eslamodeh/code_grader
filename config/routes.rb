Rails.application.routes.draw do
  devise_for :instructors, skip: :registrations
  devise_scope :instructor do
    resource :registration,
      only: [:new, :create, :edit, :update],
      path: "instructors",
      path_names: { new: "sign_up" },
      controller: "devise/registrations",
      as: :instructor_registration do
        get :cancel
      end
  end
  
  devise_for :students, skip: [:registrations]
  devise_scope :student do
    resource :registration,
      only: [:new, :create, :edit, :update],
      path: "students",
      path_names: { new: "sign_up" },
      controller: "devise/registrations",
      as: :student_registration do
        get :cancel
      end
  end
  
  # Instructor

  resources :instructors, controller: "instructors/instructors"
  namespace :instructors do
    resources :courses do
      resources :works do
        resources :submissions
      end
    end
  end

  # Student

  resources :students, controller: "students/students"
  namespace :students do
    resources :courses do
      resources :works do
        resources :submissions
      end
    end
  end

  root "home#index"
end
