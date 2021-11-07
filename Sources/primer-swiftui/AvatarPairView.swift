import SwiftUI

public struct AvatarPairView: View {
    @State public var parent: AvatarView.ViewModel
    @State public var child: AvatarView.ViewModel

    public var body: some View {
        ZStack(alignment: .bottomTrailing) {
            AvatarView(viewModel: parent)
            AvatarView(
                viewModel: AvatarView.ViewModel(
                    square: child.square,
                    alt: child.alt,
                    url: child.url,
                    size: parent.size / 2
                ))
                .offset(x: parent.size * 0.15, y: parent.size * 0.09)
        }
    }
}

struct AvatarPairView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarPairView(
            parent: AvatarView.ViewModel(
                square: false,
                alt: nil,
                url: URL(string: "https://github.com/iron-ham.png?size=\(CGFloat(20).avatarQuerySize)"),
                size: 20
            ),
            child: AvatarView.ViewModel(
                square: false,
                alt: nil,
                url: URL(string: "https://github.com/rnystrom.png?size=\(CGFloat(20).avatarQuerySize)"),
                size: 20
            )
        ).previewLayout(.sizeThatFits)
    }
}
