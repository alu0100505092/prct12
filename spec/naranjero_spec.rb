#!/usr/bin/env ruby
# encoding: utf-8

require 'spec_helper'
require 'naranjero'

module Naranjero
    class Arbol
        describe Naranjero::Arbol do
            
            before :each do 
                
                #@naranjo=Arbol.new({:altura => 0,:edad => 0,:produccion => 0})
                @naranjo=Arbol.new()
            end
            context "Arbol de Naranjas"  do
                
                it "debe existir haber un arbol de naranjas plantado" do
                    
                    expect(@naranjo).instance_of?(Arbol)
                    
                end
                
                it "Deben existir metodos que devuelva la edad del arbol" do
                
                    expect(@naranjo.altura).to eq(0)
                    
                
                end
                
                
                
                
            end 
            
            
            
        end 
        
    
    
    
    end 
    
end 

