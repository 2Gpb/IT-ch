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
            static let topPadding: CGFloat = 20.0
            static let horizontalPadding: CGFloat = 16.0
            static let spacing: CGFloat = 16.0
            static let subLabelLineSpacing: CGFloat = 5.0
            
            static let mainLabel = "Введите код подтверждения"
            static let subLabel = "Мы отправили код на "
        }
        
        enum CodeLogin {
            static let spacing: CGFloat = 32.0
        }
        
        enum CodeLoginFields {
            static let spacing: CGFloat = 12.0
        }
        
        enum IncorrectCode {
            static let text = "Неверный код, попробуйте снова"
            static let font = ITCHFont.bodySRegular.swiftUIFont
            static let color = ITCHColor.red50.swiftUIColor
        }
        
        enum GetCodeButton {
            static let defaultText = "Получить новый код"
            static let loadingText = "Получить новый код через: "
            static let bottomPadding: CGFloat = 16.0
            static let bottomPaddingWithLoading: CGFloat = 26.0
            static let height: CGFloat = 48.0
            static let font = ITCHFont.bodyMMedium.swiftUIFont
            static let activeColor = ITCHColor.blue60.swiftUIColor
            static let inactiveColor = ITCHColor.base60.swiftUIColor
            static let topPaddingWhenLoading: CGFloat = 32.0
            static let topPaddingDefault: CGFloat = 16.0
        }
        
        enum NavigationBar {
            static let height: CGFloat = 56.0
            static let leadingPadding: CGFloat = 16.0
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
        
            VStack {
                navigationBar
                codeLogin
                newCodeButton
            }
        }
        .onAppear {
            isFocused = true
        }
    }
    
    // MARK: - Subviews
    private var navigationBar: some View {
        HStack {
            Button(
                action: {
                    isFocused = false
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                        dismiss()
                    }
                }, label: {
                    ITCHImage.chevronLeft24.swiftUIImage
                }
            )
            
            Spacer()
        }
        .frame(height: Constant.NavigationBar.height)
        .padding(.leading, Constant.NavigationBar.leadingPadding)
    }
    
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
                        .foregroundStyle(
                            viewModel.isFreeze
                            ? Constant.GetCodeButton.inactiveColor
                            : Constant.GetCodeButton.activeColor
                        )
                    }
                )
                .frame(height: Constant.GetCodeButton.height)
                
                .disabled(viewModel.isFreeze)
            }
        }
        .padding(
            .top, viewModel.isLoading
            ? Constant.GetCodeButton.topPaddingWhenLoading
            : Constant.GetCodeButton.topPaddingDefault
        )
    }
}

// MARK: - Preview
#Preview {
    ITCHEnterCodeView(viewModel: ITCHEnterCodeViewModel(onNext: {}))
}
