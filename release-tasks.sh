echo "Running Release Tasks"

if [ "$RAILS_ENV" == "production" ]; then
  echo "Running Migrations"
  bundle exec rails db:migrate
fi

echo "Done running release-tasks.sh"