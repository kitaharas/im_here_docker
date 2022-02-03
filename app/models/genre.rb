class Genre < ActiveHash::Base
  include ActiveHash::Associations


  has_many :events

  self.data = [
    {id: 1, genre_title: 'Talk'},
    {id: 2, genre_title: 'Learning'},
    {id: 3, genre_title: 'Game'},
    {id: 4, genre_title: 'Music'},
    {id: 5, genre_title: 'Culture'},
    {id: 6, genre_title: 'Exercise'}
  ]

end
