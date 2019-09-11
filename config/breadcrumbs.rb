crumb :root do
  link "メルカリ", root_path(:root)
end

crumb :show do
  link 'マイページ', user_path(current_user)
  parent :root
end

crumb :profile do 
  link "プロフィール",users_path(:profile)
  parent :show
end

crumb :logout do 
  link "ログアウト",users_path(:logout)
  parent :show
end

crumb :edit do 
  link "本人情報の登録",users_path(:edit)
  parent :show
end

crumb :payment do 
  link "支払い方法", payment_cards_path(:payment)
  parent :show
end

crumb :add do 
  link "クレジットカード情報入力",users_path(:add)
  parent :payment
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).