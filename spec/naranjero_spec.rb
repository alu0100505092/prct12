#!/usr/bin/env ruby
# encoding: utf-8

require 'spec_helper'
require 'naranjero'

module Naranjero
    class Arbol
        describe Naranjero::Arbol do
            
            before :each do 
                
                #@naranjo=Arbol.new({:altura => 0,:edad => 0,:produccion => 0})
                @naranjo=Arbol.new
            end
            # context "Arbol de Naranjas"  do
                
            #     it "debe existir haber un arbol de naranjas plantado" do
                    
            #         expect(@naranjo).instance_of?(Arbol)
                    
            #     end
                
            #     it "El arbol debe tener una altura, una edad y una contador de las naranjas producidas" do
                
            #         expect(@naranjo.altura).to eq(0)
            #         expect(@naranjo.edad).to eq(0)
                    
            #     end
                
            #     it "Debe existir un metodo que haga crecer el naranjero" do
            #         @naranjo.uno_mas
                    
            #         expect(@naranjo.altura).to eq(2)
            #         expect(@naranjo.edad).to eq(1)
            #     end
                
            #     it "Debe de NO producir naranjas antes de los dos años" do
                
            #         @naranjo.uno_mas
                    
            #         expect(@naranjo.edad).to eq(1)
            #         @naranjo.produccion.should == nil
            #         expect(@naranjo.produccion).to be == nil
            #     end
                
            #     it "Debe de producir naranjas a partir de los dos años" do
                
            #         @naranjo.uno_mas
            #         @naranjo.uno_mas
                   
            #         expect(@naranjo.edad).to eq(2)
            #         @naranjo.produccion.should > 0
            #         expect(@naranjo.produccion).to be > 0
            #     end
                
            #     it "Se debe poder recoger una naranja" do
            #         @naranjo.uno_mas
            #         @naranjo.uno_mas
            #         expect(@naranjo.recolectar_una).to eq("ÑUM ÑUM ÑUM, Que rica estaba la naranja!\n")
            #     end
                
            #      it "NO se debe poder recoger una naranja" do
            #         expect(@naranjo.recolectar_una).to eq("No hay naranjas disponibles, vuelve mas tarde\n")
            #     end
                
            #      it "Arbol esta muerto, no hay nada para coger" do
            #         @naranjo.uno_mas
            #         @naranjo.uno_mas
            #         @naranjo.uno_mas
            #         @naranjo.uno_mas
            #         @naranjo.uno_mas
            #         @naranjo.uno_mas
            #         @naranjo.uno_mas
            #         @naranjo.uno_mas
            #         @naranjo.uno_mas
            #         @naranjo.uno_mas
            #         expect(@naranjo.recolectar_una).to eq("El arbol esta muerto, no tiene naranjas :(, lo siento.\n")
            #     end
                
            # end
            
            context "Recolector de naranjas y crecimiento" do 
                before :each do
                    @persona=Recolector.new(Mutex.new,ConditionVariable.new,Arbol.new)
                    hilos=@persona.cosechar
                    hilos.each {|i| i.join}
                    
                end
                
                
                it "Debe haber un recolector" do
                    expect(@persona).instance_of?(Recolector)
                end
                
                
                   
                    
            end
        end 
    end 
end 

