require 'sinatra'
require 'json'

sample_funding_nations = [
  {
    id: 123,
    name: "Australia",
    locale: "en_AU",
    site_prefix: "https://www.destinyrescue.org/au/",
  },
  {
    id: 234,
    name: "New Zealand",
    locale: "en_NZ",
    site_prefix: "https://www.destinyrescue.org/nz/",
  },
  {
    id: 345,
    name: "United States",
    locale: "en_US",
    site_prefix: "https://www.destinyrescue.org/us/",
  },
]

sample_users = [
  {
    id: 123,
    funding_nation: 234,
    first_name: "Matt",
    last_name: "Parlane",
    email: "matt.parlane@destinyrescue.org",
    preferences: {
      tags: ["rescue", "aftercare"],
      campaigns: [123, 234],
      notification_frequency: "<unsure>",
    },
    social: {
      facebook: {
        id: "570322084",
        name: "Matt Parlane",
        age_range: {
          min: 21,
        },
        link: "https://www.facebook.com/app_scoped_user_id/570322084/",
        picture: {
          data: {
            is_silhouette: false,
            url: "https://scontent.xx.fbcdn.net/v/t1.0-1/p50x50/11227943_10152882160747085_4840140759273003166_n.jpg?oh=dc762c6f02dd6b52362649aa9a99b6d1&oe=5934D191",
          }
        },
        timezone: 7,
        updated_time: "2016-12-27T01:06:25+0000",
        verified: true,
        devices: [
          {
            os: "Android",
          },
        ],
      },
    },
  }
]

get '/funding-nations/' do
  content_type :json
  sample_funding_nations.to_json
end

get '/funding-nations/:id' do
  content_type :json
  sample_funding_nations.select { |fn| fn[:id].to_i == params[:id].to_i }.first.to_json
end

post '/users/' do
  content_type :json
  sample_users[0].to_json
end

put '/users/:id' do
  content_type :json
  sample_users.select { |u| u[:id].to_i == params[:id].to_i }.first.to_json
end

get '/users/:id' do
  content_type :json
  sample_users.select { |u| u[:id].to_i == params[:id].to_i }.first.to_json
end
