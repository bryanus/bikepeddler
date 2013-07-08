#!/bin/env ruby
# encoding: utf-8

class Post < ActiveRecord::Base
  attr_accessible :description, :price, :title, :images, :category_id, :adtype, :currency

  validates :title, :presence => true, :on => :create
  validates :price, :presence => true, :on => :create
  validates :description, :presence => true, :on => :create
  validates :adtype, :presence => true, :on => :create
  validates :category_id, :presence => true, :on => :create

  # seems to validate on form end already: validates :price, format: { with: /^\d+(.\d{1,2})?$/i }


 
  has_many :images
  belongs_to :user
  belongs_to :category

  def self.listing_types
  	adtypes = [['For Sale',0], ['Wanted',1], ['Trade',2]]
  end

  def self.currency_types
    currencies = [['$ USD',0], ['$ CAD',1], ['£ GPB',2], ['€ Euro',3]]
  end


  
end
