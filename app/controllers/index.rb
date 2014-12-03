# Workout Pages

get '/workouts' do
  @workouts = Workout.all
  erb :'workouts/all'
end

get '/workout/new' do
  erb :'workouts/_new'
end

post '/workouts' do
  @workout = Workout.create(params[:workout])

  if request.xhr?
    erb :'workouts/_list_item', locals: {workout: @workout}, layout: false
  else
    redirect to("/workout/new")
  end
end

get '/workout/:name' do |name|
  @workout = Workout.find_by(name: name)
  erb :'workouts/show'
end

delete '/workout/:name' do |name|
  @workout = Workout.find_by(name: name)
  @workout.destroy
  redirect to('/workouts')
end

# delete '/workouts' do
#   @workout = Workout.find_by(params[:workout])
#   if request.xhr?
#     erb :'workouts/_delete', locals: {workout: @workout}, layout: false
#   else
#     # @workout.destroy
#     redirect to("/workouts")
#   end
# end

# Exercise Pages

get '/exercises' do
  @exercises = Exercise.all
  erb :'exercises/all'
end

get '/exercise/new' do
  erb :'exercises/_new'
end

post '/exercises' do
  @exercise = Exercise.create(params[:exercise])

  if request.xhr?
    erb :'exercises/_list_item', locals: {exercise: @exercise}, layout: false
  else
    redirect to("/exercise/new")
  end
end

get '/exercise/:name' do |name|
  @exercise = Exercise.find_by(name: name)
  erb :'exercises/show'
end

# User Pages
get '/:name' do
  erb :user
end
