class Area < ActiveHash::Base

  self.data = [
               {id: 0, name: '--'}, {id: 1, name: '福井市'}, {id: 2, name: '敦賀市'}, 
               {id: 3, name: '小浜市'}, {id: 4, name: '大野市'}, {id: 5, name: '勝山市'}, 
               {id: 6, name: '鯖江市'}, {id: 7, name: 'あわら市'}, {id: 8, name: '越前市'}, 
               {id: 9, name: '坂井市'}, {id: 10, name: '永平寺町'}, {id: 11, name: '池田町'}, 
               {id: 12, name: '南越前町'}, {id: 13, name: '越前町'}, {id: 14, name: '美浜町'}, 
               {id: 15, name: '高浜町'}, {id: 16, name: 'おおい町'}, {id: 17, name: '若狭町'}, 
              ]

  include ActiveHash::Associations
  has_many :users
end