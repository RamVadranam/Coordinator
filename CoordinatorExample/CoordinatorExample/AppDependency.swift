//
//  AppDependency.swift
//  CoordinatorExample
//
//  Created by Aleksandar Vacić on 10.5.17..
//  Copyright © 2017. Radiant Tap. All rights reserved.
//

import Foundation

//	Dependency carrier through the app,
//	injected into every Coordinator and UIViewController
//	Protocol composition approach: http://merowing.info/2017/04/using-protocol-compositon-for-dependency-injection/

struct AppDependency: UsesNetwork, UsesKeychain, UsesPersistance, UsesWebService, UsesDataManager, UsesAccountManager, UsesCartManager {
	let networkProvider: Network
	let apiProvider: WebService

	let keychainProvider: Keychain

	var persistanceProvider: RTCoreDataStack
	var dataManager: DataManager

	var accountManager: AccountManager
	var cartManager: CartManager

	//	dummy init, for simpler demo
	init() {
		self.networkProvider = Network()
		self.apiProvider = WebService()
		self.keychainProvider = Keychain()
		self.persistanceProvider = RTCoreDataStack()
		self.dataManager = DataManager()
		self.accountManager = AccountManager()
		self.cartManager = CartManager()
	}
}


protocol Dependable: class {
	var dependencies: AppDependency? { get set }
}
