//
//  ITCHEnterCodeViewModel.swift
//  ITCHAuthorization
//
//  Created by Peter on 20.05.2025.
//

import Foundation

final class ITCHEnterCodeViewModel: ObservableObject {
    // MARK: - Constants
    private enum Constant {
        static let timeFormat = "%02d:%02d"
        static let freezeTimeInterval: TimeInterval = 60.0
        static let step = 1.0
    }
    
    let pushNext: () -> Void
    
    // MARK: - Fields
    let codeLenght = 4
    
    // MARK: - Properties
    @Published var isCodeIncorrect = false
    @Published var shownErrorMessage = false
    @Published var isLoading = false
    @Published var isFreeze = false
    @Published var timeRemaining = "01:00"
    @Published var code = "" {
        didSet {
            if code != oldValue && code.count == codeLenght && oldValue.count < codeLenght {
                Task { await codeEnteredAction() }
            } else if shownErrorMessage && code.count < codeLenght {
                isCodeIncorrect = false
            }
        }
    }
    
    private var freezeTimeInterval: TimeInterval = 0.0
    
    init(onNext: @escaping () -> Void) {
        self.pushNext = onNext
    }
    
    @MainActor
    func newCodeAction() {
        freezeTimeInterval = Constant.freezeTimeInterval
        isFreeze = true
        
        Task { [weak self] in
            guard let self else { return }
            
            do {
                while self.freezeTimeInterval > 0 {
                    try await Task.sleep(for: .seconds(Constant.step))
                    
                    self.freezeTimeInterval -= Constant.step
                    
                    let minutes = Int(self.freezeTimeInterval) / 60
                    let seconds = Int(self.freezeTimeInterval) % 60
                    
                    self.timeRemaining = String(format: Constant.timeFormat, minutes, seconds)
                }
                self.isFreeze = false
            } catch {
                print("⛔️ Task cancelled or failed: \(error)")
                self.isFreeze = false
            }
        }
    }
    
    // MARK: - Private methods
    @MainActor
    private func codeEnteredAction() {
        isFreeze = false
        isLoading = true
        shownErrorMessage = false
        
        Task { @MainActor [weak self] in
            guard let self else { return }
            
            /// Simulated loading
            try? await Task.sleep(for: .seconds(2))
            
            isLoading = false
            isFreeze = freezeTimeInterval > 0
            
            if code == "0000" {
                shownErrorMessage = false
                pushNext()
            } else {
                shownErrorMessage = true
                isCodeIncorrect = true
            }
        }
    }
}
