#!/usr/bin/env ruby
# encoding: utf-8
require 'thread'
require 'naranjero/arbol'
Thread.abort_on_exception = true
module Naranjero
    attr_reader :naranjero
    class Recolector < Arbol
        def initialize(mutex,cv,naranjero)
            @mutex=mutex
            @cv=cv
            @naranjero=naranjero
            @hilos=[]
            @queue= SizedQueue.new 30
        
        end
        
        
        # def cosechar
            
        #     recoger = Thread.new do
        #         if(@naranjero.edad == EdadMuerte)
        #             "Cosecha:recoger de naranjas termina"
                    
        #         else
        #             dormir= rand(0..4)
        #             puts "Durmiendo al recolector por #{dormir}\n"
        #             sleep(dormir)
        #             puts "Despertando al recolector despues de dormir #{dormir}\n"
        #             @mutex.synchronize do 
        #                 @naranjero.recolectar_una
        #                 if(@naranjero.edad < EdadMuerte)
        #                     @cv.wait(@mutex)
        #                 end
        #             end
        #         end
                        
                        
        #     end      
            
            
            
        #     crecer = Thread.new do
        #         if(@naranjero.edad == EdadMuerte)
        #             "Cosecha:crecer de naranjas termina"
                    
        #         else
        #             dormir= rand(0..4)
        #             puts "Durmiendo el crecimiento por #{dormir}\n"
        #             sleep(dormir)
        #             puts "Despertando al crecimiento despues de dormir #{dormir}\n"
        #             @mutex.synchronize do 
        #                 @naranjero.uno_mas
        #                 puts "Ha crecido el arbol, es un año mas viejo"
        #                 @cv.signal
        #             end
        #         end
                
                
        #     end
            
        #       [recoger,crecer]
                  
        # end
        
        def cosechar
            
               crecer
               recoger
           
        end
        
        def recoger
            10.times do |i|
                @hilos << Thread.new do
                    
                    if(@naranjero.edad == EdadMuerte)
                         "Cosecha:recoger de naranjas termina"
                        
                    else
                        dormir= rand(0..4)
                        
                        say "Durmiendo al recolector por #{dormir}\n"
                        #sleep(dormir)
                        say "Despertando al recolector despues de dormir #{dormir}\n"
                        
                        # @mutex.synchronize do 
                        #     @naranjero.recolectar_una
                        #     if(@naranjero.edad < EdadMuerte)
                        #         @cv.wait(@mutex)
                        #     end
                        # end
                        
                        @queue << i
                        
                        say @naranjero.recolectar_una
                        
                    end
                end      
            end
        end
        
        
        def crecer
            10.times do
                @hilos << Thread.new do
                    
                    if(@naranjero.edad == EdadMuerte)
                        "Cosecha:crecer de naranjas termina"
                        
                    else
                        dormir= rand(0..4)
                        say "Durmiendo el crecimiento por #{dormir}\n"
                        #sleep(dormir)
                        say "Despertando al crecimiento despues de dormir #{dormir}\n"
                        # @mutex.synchronize do 
                        #     @naranjero.uno_mas
                        #     puts "Ha crecido el arbol, es un año mas viejo"
                        #     @cv.signal
                        # end
                        
                        @queue.pop
                        
                        say @naranjero.uno_mas
                        
                    end
                end
            end
        end
        
        
         def say this
            @mutex.synchronize do
            puts this
            end
        end 
        
        
         def kill
            @hilos.each &:kill
        end 
        
    end
end