import SwiftUI

public struct AvatarStackView: View {
    /// Child avatar views
    @State public var avatars: [AvatarView.ViewModel]

    @State private var isSpread: Bool = false

    public var body: some View {
        ZStack {
            ForEach(Array(zip(avatars.indices, avatars)), id: \.0) { index, viewModel in
                AvatarView(viewModel: viewModel)
                    .stackOffset(size: viewModel.size, currentIndex: index, isSpread: isSpread)
                    .stackIndex(currentIndex: index, totalCount: avatars.count)
                    .onTapGesture {
                        withAnimation(.easeIn) {
                            isSpread.toggle()
                        }
                    }
            }
        }
    }
}

struct AvatarStackView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarStackView(
            avatars: [
                AvatarView.ViewModel(
                    square: false,
                    alt: nil,
                    url: URL(string: "https://github.com/rnystrom.png?size=\(CGFloat(20).avatarQuerySize)"),
                    size: 80
                ),
                AvatarView.ViewModel(
                    square: false,
                    alt: nil,
                    url: URL(string: "https://github.com/eliperkins.png?size=\(CGFloat(20).avatarQuerySize)"),
                    size: 80
                ),
                AvatarView.ViewModel(
                    square: false,
                    alt: nil,
                    url: URL(string: "https://github.com/nplasterer.png?size=\(CGFloat(20).avatarQuerySize)"),
                    size: 80
                ),
                AvatarView.ViewModel(
                    square: false,
                    alt: nil,
                    url: URL(string: "https://github.com/mxie.png?size=\(CGFloat(20).avatarQuerySize)"),
                    size: 80
                ),
            ]
        ).previewLayout(.sizeThatFits)
    }
}

private extension View {
    func stackIndex(currentIndex: Int, totalCount: Int) -> some View {
        AnyView(zIndex(Double(totalCount - currentIndex)))
    }

    func stackOffset(size: CGFloat, currentIndex: Int, isSpread: Bool) -> some View {
        let coreMulitplier: CGFloat = isSpread ? size * 1.1 : 0.55 * size
        let divisor = isSpread ? 1 : CGFloat(currentIndex + 1)
        let reducedMultiplier: CGFloat = coreMulitplier / divisor

        return offset(
            x: reducedMultiplier * CGFloat(currentIndex),
            y: 0
        )
    }
}
