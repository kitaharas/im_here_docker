class Feel < ActiveHash::Base
  include ActiveHash::Associations


  has_many :events

  self.data = [
    {id: 1, feel_title: 'わいわい楽しく'},
    {id: 2, feel_title: '1 on 1'},
    {id: 3, feel_title: 'イージーリスニング'},
    {id: 4, feel_title: '趣味を見つける'},
    {id: 5, feel_title: '学びを深める'},
    {id: 6, feel_title: '忍者モード'}
  ]

end
