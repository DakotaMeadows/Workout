get '/' do

  erb :homepage
end

# Workout Pages

get '/workouts' do
  if current_user
    @workouts = Workout.all
    erb :'workouts/all'
  else
    redirect to ('/')
  end
end

get '/workout/new' do
  if current_user
    erb :'workouts/_new'
  else
    redirect to ('/')
  end
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
  if current_user
    @workout = Workout.find_by(name: name)
    @session = Session.find_by(workout_id: @workout.id)
    erb :'workouts/show'
  else
    redirect to ('/')
  end
end

post '/workout/:name' do |name|
  @workout = Workout.find_by(name: name)
  @exercise = Exercise.find_by(params[:exercise])
  Session.create(workout_id: @workout.id, exercise_id: @exercise.id)
  if request.xhr?
    erb :'/workouts/_add_exercise', layout: false
  else
    redirect to ("/workout/#{@workout.name}")
  end
end

delete '/workout/:name' do |name|
  @workout = Workout.find_by(name: name)
  @workout.destroy
  redirect to('/workouts')
end

delete '/workouts' do
  if request.xhr?
    @workout.destroy
    # erb :'workouts/_delete', locals: {workout: @workout}, layout: false
    # erb :'workouts/all', layout: false
  else
    # @workout.destroy
    redirect to("/workouts")
  end
end

# Exercise Pages

get '/exercises' do
  if current_user
    @exercises = Exercise.all
    erb :'exercises/all'
  else
    redirect to ('/')
  end
end

get '/exercise/new' do
  if current_user
      erb :'exercises/_new'
  else
    redirect to ('/')
  end
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
  if current_user
    @exercise = Exercise.find_by(name: name)
    erb :'exercises/show'
  else
    redirect to ('/')
  end
end

delete '/exercise/:name' do |name|
  @exercise = Exercise.find_by(name: name)
  @exercise.destroy
  redirect to('/exercises')
end

# User Pages
get '/:name' do |name|
  if current_user
    @user = User.find_by(name: name)
    erb :'users/user'
  else
    redirect to ('/')
  end
end

post '/:name' do |name|
  @user = User.find_by(name: name)
  if params[:title]
    @workout = Workout.create(name: params[:title], category: params[:type], description: "#{DateTime.now}")
    @exercises = Exercise.where(category: @workout.category)
    @how_many = params[:times].to_i
    @exercises.sort_by{rand}[0..(@how_many - 1)].each do |exercise|
      Session.create(exercise_id: exercise.id, workout_id: @workout.id)
    end
    Schedule.create(user_id: @user.id, workout_id: @workout.id)
    if request.xhr?
      Schedule.create(user_id: @user.id, workout_id: @workout.id)
      erb :'users/_add_workout', layout: false
    else
      redirect to ("/#{@user.name}")
    end
  else
    @workout = Workout.find_by(params[:workout])
    Schedule.create(user_id: @user.id, workout_id: @workout.id)
    if request.xhr?
      erb :'users/_add_workout', layout: false
    else
      redirect to ("/#{@user.name}")
    end
  end
end
