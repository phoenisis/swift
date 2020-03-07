//
//  RxSwift+Observable.swift
//  Utils
//
//  Created by Quentin Yann PIDOUX on 03/06/2019.
//  Copyright © 2019 Utils. All rights reserved.
//

import RxSwift

extension Observable {
    func repeatUntil(_ block: @escaping () throws -> Bool) -> Observable {
        return Observable.deferred {
            Observable.create{ observer in
                var subscription: Disposable? = nil
                let disposable = Disposables.create {subscription?.dispose()}
                func subscribe() {
                    subscription = self.subscribe(
                        onNext: {
                            observer.on(.next($0))
                    }, onError: {
                        observer.on(.error($0))
                    }, onCompleted: {
                        do {
                            if try !block() {
                                subscribe()
                            } else {
                                observer.on(.completed)
                            }
                        } catch {
                            observer.onError(error)
                        }
                    },onDisposed: nil)
                }
                subscribe()
                return disposable
            }
        }
    }
    
    func repeatWithDelayUntil(delay: Int, _ block: @escaping () throws -> Bool) -> Observable {
        return self.delay(RxTimeInterval.seconds(delay), scheduler: ConcurrentDispatchQueueScheduler(qos: .background))
            .repeatUntil(block)
    }

}

extension PrimitiveSequence where Trait == CompletableTrait, Element == Never {
    func repeatUntil(_ block: @escaping () throws -> Bool) -> Completable {
        return Completable.deferred {
            Completable.create{ observer in
                var subscription: Disposable? = nil
                let disposable = Disposables.create {subscription?.dispose()}
                func subscribe() {
                    subscription = self.subscribe(
                        onCompleted: {
                            do {
                                if try !block() {
                                    subscribe()
                                } else {
                                    observer(.completed)
                                }
                            } catch {
                                observer(.error(error))
                            }
                    },onError: {
                        observer(.error($0))
                    })
                }
                subscribe()
                return disposable
            }
        }
    }
}

extension PrimitiveSequence where Trait == SingleTrait {
    func repeatUntil(_ block: @escaping () -> Bool) -> Single<E> {
        return Single.deferred {
            self.asObservable()
                .repeatUntil(block)
                .take(1)
                .asSingle()
        }
    }
}
