#!/usr/bin/env ruby
# encoding: utf-8

module Naranjero

    class Arbol
        
        attr_reader :altura, :edad, :produccion
        
        
        CrecimientoAlAnho=2
        EdadEmpiezaCuaje=2
        EdadMuerte=10
        ProduccionAnualBase=20
        def initialize
            # @altura=args[:altura]
            # @edad=args[:edad]
            # @produccion=args[:produccion]
            @altura=0
            @edad=0
            @produccion=0
        end
        
        
        def uno_mas
            if(@edad == EdadMuerte)
                @altura=0
                "El arbol esta muerto, murio a la edad #{@edad} anhos"
             else
                @edad += 1
                @altura += CrecimientoAlAnho
                produccion()
             end
        end
        
        
        def produccion
            if(@edad >= EdadEmpiezaCuaje)    
                @produccion= rand(@edad..EdadMuerte) * @edad*ProduccionAnualBase
            end
        end
        
        def recolectar_una
            if(@edad == EdadMuerte)
                "El arbol esta muerto, no tiene naranjas :(, lo siento."
            elsif(@produccion > 0)
                @produccion -= 1
                "ÑUM ÑUM ÑUM, Que rica estaba!"
            else
                "No hay naranjas disponibles, vuelve mas tarde"
            end
            
            
            
        end
        
        
    end
    
    
    
    
end
