#!/usr/bin/env ruby
# encoding: utf-8
require 'monitor'
require 'naranjero/arbol'
Thread.abort_on_exception = true
module Naranjero
    attr_reader :naranjero
    class Recolector < Arbol
        def initialize(mutex,cv,naranjero)
            @mutex=mutex
            @cv=cv
            @naranjero=naranjero
        
        end
        
        
        def cosechar
            
            recoger = Thread.new do
                if(@naranjero.edad == EdadMuerte)
                    "Cosecha:recoger de naranjas termina"
                    
                else
                    dormir= rand(0..4)
                    puts "Durmiendo al recolector por #{dormir}\n"
                    sleep(dormir)
                    puts "Despertando al recolector despues de dormir #{dormir}\n"
                    @mutex.synchronize do 
                        @naranjero.recolectar_una
                        if(@naranjero.edad < EdadMuerte)
                            @cv.wait(@mutex)
                        end
                    end
                end
                        
                        
            end      
            
            
            
            crecer = Thread.new do
                if(@naranjero.edad == EdadMuerte)
                    "Cosecha:crecer de naranjas termina"
                    
                else
                    dormir= rand(0..4)
                    puts "Durmiendo el crecimiento por #{dormir}\n"
                    sleep(dormir)
                    puts "Despertando al crecimiento despues de dormir #{dormir}\n"
                    @mutex.synchronize do 
                        @naranjero.uno_mas
                        puts "Ha crecido el arbol, es un año mas viejo"
                        @cv.signal
                    end
                end
                
                
            end
            
               [recoger,crecer]
                  
        end
        
        
        
        
        
    end
end