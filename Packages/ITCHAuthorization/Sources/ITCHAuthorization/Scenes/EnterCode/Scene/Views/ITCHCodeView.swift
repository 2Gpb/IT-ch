//
//  ITCHCodeView.swift
//  ITCHAuthorization
//
//  Created by Peter on 20.05.2025.
//

import SwiftUI
import ITCHUIComponents

public struct ITCHCodeView: View {
    // MARK: - Constants
    private enum Constant {
        enum HidenTextField {
            static let size = CGSize(width: 0, height: 0)
            static let opacity = 0.01
        }
        
        enum InputFieldView {
            static let spacing: CGFloat = 8.0
            static let size: CGFloat = 52.0
            static let cornerRadius: CGFloat = 8.0
            static let strokeWidth: CGFloat = 1.0
            static let defaultBackground = ITCHColor.base80.swiftUIColor
            static let errorBackground = ITCHColor.red30.swiftUIColor
            static let textColor = ITCHColor.base0.swiftUIColor
            static let errorTextColor = ITCHColor.red50.swiftUIColor
            static let font = ITCHFont.header5SemiBold.swiftUIFont
        }
        
        enum Cursor {
            static let width: CGFloat = 1.5
            static let height: CGFloat = 17.0
            static let duration: Double = 0.5
            static let hiddenOpacity: Double = 0.0
            static let visibleOpacity: Double = 1.0
            static let color = ITCHColor.blue60.swiftUIColor
        }
    }
    
    // MARK: - Properties
    @Binding var code: String
    @Binding var isError: Bool
    @State private var cursorBlink = true

    private let length: Int
    var isFocused: FocusState<Bool>.Binding
    
    // MARK: - Body
    public var body: some View {
        ZStack {
            hidenTextField
            inputFieldView
        }
        .onAppear {
            code = ""
        }
    }
    
    // MARK: - Subviews
    private var hidenTextField: some View {
        TextField("", text: $code)
            .focused(isFocused)
            .keyboardType(.numberPad)
            .textContentType(.oneTimeCode)
            .foregroundStyle(.clear)
            .background(.clear)
            .opacity(Constant.HidenTextField.opacity)
            .frame(
                width: Constant.HidenTextField.size.width,
                height: Constant.HidenTextField.size.height
            )
            .onChange(of: code) { newValue in
                if newValue.count > length {
                    code = String(newValue.prefix(length))
                }
            }
    }
    
    private var inputFieldView: some View {
        HStack(spacing: Constant.InputFieldView.spacing) {
            ForEach(0..<length, id: \.self) { index in
                ZStack {
                    Text(character(at: index))
                        .font(Constant.InputFieldView.font)
                        .foregroundStyle(isError ? Constant.InputFieldView.errorTextColor : Constant.InputFieldView.textColor)
                        .frame(width: Constant.InputFieldView.size, height: Constant.InputFieldView.size)
                        .background(isError ? Constant.InputFieldView.errorBackground : Constant.InputFieldView.defaultBackground)
                        .cornerRadius(Constant.InputFieldView.cornerRadius)
                    if index == min(code.count, length),
                        isFocused.wrappedValue == true {
                        Rectangle()
                            .fill(Constant.Cursor.color)
                            .frame(width: Constant.Cursor.width, height: Constant.Cursor.height)
                            .opacity(cursorBlink ? Constant.Cursor.visibleOpacity : Constant.Cursor.hiddenOpacity)
                            .onAppear {
                                withAnimation(.easeInOut(duration: Constant.Cursor.duration).repeatForever(autoreverses: true)) {
                                    cursorBlink.toggle()
                                }
                            }
                    }
                }
            }
        }
    }
    
    // MARK: - Lifecycle
    public init(
        code: Binding<String>,
        isError: Binding<Bool>,
        isFocused: FocusState<Bool>.Binding,
        length: Int
    ) {
        _code = code
        _isError = isError
        self.isFocused = isFocused
        self.length = length
    }
    
    // MARK: - Private methods
    private func character(at index: Int) -> String {
        guard index < code.count else { return "" }
        let charIndex = code.index(code.startIndex, offsetBy: index)
        return String(code[charIndex])
    }
}

// MARK: - Preview
#Preview {
    @FocusState var isFocused: Bool
    
    ITCHCodeView(
        code: .constant(""),
        isError: .constant(false),
        isFocused: $isFocused,
        length: 4
    )
}
