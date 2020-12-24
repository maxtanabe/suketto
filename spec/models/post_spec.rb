require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  describe '投稿の保存' do
    context '投稿の保存ができる場合' do
      it '全ての項目に指定があれば投稿は保存される' do
        expect(@post).to be_valid
      end
    end

    context '投稿の保存ができない場合' do
      it '投稿動画がないと投稿は保存できない' do
        @post.video = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Video can't be blank")
      end

      it '投稿タイトルがないと投稿は保存できない' do
        @post.title = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Title can't be blank")
      end

      it '投稿価格が空だと投稿は保存できない' do
        @post.price = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Price can't be blank")
      end

      it '投稿価格が¥500以下は保存できない' do
        @post.price = 200
        @post.valid?
        expect(@post.errors.full_messages).to include('Price is not included in the list')
      end

      it '投稿価格が¥5,000以上は保存できない' do
        @post.price = 6000
        @post.valid?
        expect(@post.errors.full_messages).to include('Price is not included in the list')
      end
    end
  end
end
