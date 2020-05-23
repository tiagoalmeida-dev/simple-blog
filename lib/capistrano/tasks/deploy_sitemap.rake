after :deploy, "deploy:sitemap"

namespace :deploy do
  desc "Add new sitemap"
  task :sitemap do
    on roles(:web) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, "sitemap:clean"
          execute :rake, "sitemap:refresh"
        end
      end
    end
  end
end