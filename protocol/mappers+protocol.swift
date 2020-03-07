//
//  Mappers.swift
//  Utils
//
//  Created by Quentin Yann PIDOUX on 07/02/2020.
//  Copyright © 2019 Utils. All rights reserved.
//

protocol DomainModelMapper {
    associatedtype Model
    associatedtype Domain

    func fromModel(model: Model) throws -> Domain
    func toModel(domain: Domain) throws -> Model
}


protocol ModelMapper {
	associatedtype Model
    associatedtype Dest
	
	func fromModel(_ model: Model) throws -> Dest
	func fromModel(_ model: [Model]) throws -> [Dest]
}

/// To mapper
extension ModelMapper {
	func toModel(_ dest: Dest) throws -> Model {
		fatalError("Methode not implemented")
	}
}

/// Array mappers
extension ModelMapper {
	func fromModel(_ model: [Model]) throws -> [Dest] {
		return try model.map { (item) -> Dest in
			try fromModel(item)
		}
	}
	
	func toModel(_ dest: [Dest]) throws -> [Model] {
		return try dest.map({ (item) -> Model in
			try toModel(item)
		})
	}
}
