//
//  ITCHEnterCodeView.swift
//  ITCHAuthorization
//
//  Created by Peter on 20.05.2025.
//

import SwiftUI
import ITCHUIComponents

struct ITCHEnterCodeView: View {
    // MARK: - Constants
    private enum Constant {
        enum CodeLoginText {
            static let topPadding = 20.0
            static let horizontalPadding = 16.0
            static let spacing = 16.0
            static let mainLabel = "Введите код подтверждения"
            static let subLabel = "Мы отправили код на"
            static let subLabelLineSpacing = 5.0
        }
        
        enum CodeLogin {
            static let spacing = 32.0
        }
        
        enum CodeLoginFields {
            static let spacing = 12.0
        }
        
        enum IncorrectCode {
            static let text = "Неверный код, попробуйте снова"
        }
        
        enum GetCodeButton {
            static let defaultText = "Получить новый код"
            static let loadingText = "Получить новый код через: "
            static let bottomPadding = 16.0
            static let bottomPaddingWithLoading = 26.0
        }
    }
    
    // MARK: - Properties
    @Environment(\.dismiss) private var dismiss
    @StateObject var viewModel: ITCHEnterCodeViewModel
    @FocusState var isFocused: Bool
    
    // MARK: - Body
    var body: some View {
        ZStack(alignment: .top) {
            ITCHColor.backgroundGray.swiftUIColor
                .ignoresSafeArea()
        
            VStack(spacing: 0) {
                HStack {
                    Button(
                        action: {
                            dismiss()
                        }, label: {
                            ITCHImage.chevronLeft24.swiftUIImage
                        }
                    )
                    
                    Spacer()
                }
                .frame(height: 56)
                .padding(.leading, 16)
                
                codeLogin
                
                newCodeButton
            }
        }
        .onAppear {
            isFocused = true
            
        }
    }
    
    // MARK: - Subviews
    private var codeLogin: some View {
        VStack(spacing: Constant.CodeLogin.spacing) {
            codeLoginText
            codeLoginFields
        }
    }
    
    private var codeLoginText: some View {
        VStack(spacing: Constant.CodeLoginText.spacing) {
            Text(Constant.CodeLoginText.mainLabel)
                .font(ITCHFont.header4.swiftUIFont)
                .foregroundStyle(ITCHColor.base0.swiftUIColor)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(Constant.CodeLoginText.subLabel + "example@mail.ru")
                .font(ITCHFont.bodyMRegular.swiftUIFont)
                .foregroundStyle(ITCHColor.base0.swiftUIColor)
                .lineSpacing(Constant.CodeLoginText.subLabelLineSpacing)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(.top, Constant.CodeLoginText.topPadding)
        .padding(.horizontal, Constant.CodeLoginText.horizontalPadding)
    }

    private var codeLoginFields: some View {
        VStack(spacing: Constant.CodeLoginFields.spacing) {
            ITCHCodeView(
                code: $viewModel.code,
                isError: $viewModel.isCodeIncorrect,
                isFocused: $isFocused,
                length: viewModel.codeLenght
            )
            
            if viewModel.shownErrorMessage {
                Text(Constant.IncorrectCode.text)
                    .font(ITCHFont.bodySRegular.swiftUIFont)
                    .foregroundStyle(ITCHColor.red50.swiftUIColor)
            }
        }
        .onTapGesture {
            isFocused = true
        }
    }

    private var newCodeButton: some View {
        ZStack {
            if viewModel.isLoading {
                ITCHLoaderView()
            } else {
                Button(
                    action: {
                        viewModel.newCodeAction()
                    }, label: {
                        Text(viewModel.isFreeze ? Constant.GetCodeButton.loadingText + viewModel.timeRemaining :
                                Constant.GetCodeButton.defaultText)
                        .font(ITCHFont.bodyMMedium.swiftUIFont)
                        .foregroundStyle(viewModel.isFreeze ? ITCHColor.base60.swiftUIColor : ITCHColor.blue60.swiftUIColor)
                    }
                )
                .frame(height: 48)
                
                .disabled(viewModel.isFreeze)
            }
        }
        .padding(.top, viewModel.isLoading ? 32 : 16)
    }
}

// MARK: - Preview
#Preview {
    ITCHEnterCodeView(viewModel: ITCHEnterCodeViewModel(onNext: {}))
}
