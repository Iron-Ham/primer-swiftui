import SwiftUI
import SDWebImageSwiftUI

public struct AvatarView: View {

    public struct ViewModel: Identifiable {
        /// Sets the shape of the avatar to a square if true. If false, the avatar will be circular. Default `false`
        public var square: Bool = false
        /// Provide alt text when the Avatar is used without the user's name next to it.
        public var alt: String?
        /// URL of the avatar image.
        public var url: URL?
        /// Sets the width and height of the avatar.
        public var size: CGFloat

        public var id: String {
            (url?.absoluteString ?? "")
                + "\(square.description)"
                + "\(alt ?? "")"
                + "\(size.description)"
        }

        var radius: CGFloat {
            guard square else { return 0 }
            return size <= 24 ? 4 : 6
        }
    }

    @State public var viewModel: ViewModel

    public var body: some View {
        WebImage(url: viewModel.url)
            .resizable()
            .indicator(.activity)
            .transition(.fade)
            .scaledToFill()
            .avatarShape(viewModel: viewModel)
            .cornerRadius(viewModel.radius)
            .frame(width: viewModel.size, height: viewModel.size)
    }
}

struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            AvatarView(viewModel: AvatarView.ViewModel(
                square: false,
                alt: nil,
                url: URL(string: "https://github.com/iron-ham.png?size=\(CGFloat(20).avatarQuerySize)"),
                size: 20
            ))
            AvatarView(viewModel: AvatarView.ViewModel(
                square: true,
                alt: nil,
                url: URL(string: "https://github.com/iron-ham.png?size=\(CGFloat(20).avatarQuerySize)"),
                size: 20
            ))
        }.previewLayout(.sizeThatFits)
    }
}

private extension View {
    func avatarShape(viewModel: AvatarView.ViewModel) -> some View {
        if viewModel.square {
            return AnyView(
                clipShape(Rectangle()).cornerRadius(viewModel.radius )
            )
        } else {
            return AnyView(clipShape(Circle()))
        }
    }
}

extension CGFloat {
    var avatarQuerySize: Int {
        return Int(self * UIScreen.main.scale)
    }
}
