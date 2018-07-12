heroku-cheatsheet
===================

A cheatsheet on the usage of heroku.
# first download and install the heroku toolbelt - https://toolbelt.heroku.com/
heroku create app-name                            # create app
git add .                                         # add
git commit -m "init heroku deployment"            # commit
git push heroku master                            # push master branch live to heroku!
heroku addons:create heroku-postgresql:hobby-dev  # create db on heroku for free
heroku pg:info                                    # pg info 
heroku pg:psql                                    # for psql access
heroku logs                                       # displays messages from terminal (good for debugging)
heroku run rake db:migrate                        # run db:migrate task
heroku restart                                    # restart your heroku server after you push changes