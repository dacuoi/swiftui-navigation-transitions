import SwiftUI
@_spi(Advanced) import SwiftUIIntrospect

extension View {
	@MainActor
	public func navigationTransition(
		_ transition: AnyNavigationTransition,
		interactivity: AnyNavigationTransition.Interactivity = .default,
		maxWidthTouch: CGFloat = 0
	) -> some View {
		self.introspect(
			.navigationView(style: .stack),
			on: .iOS(.v13...), .tvOS(.v13...), .visionOS(.v1...),
			scope: [.receiver, .ancestor]
		) { controller in
			controller.setNavigationTransition(transition, interactivity: interactivity, maxWidthTouch: maxWidthTouch)
		}
	}
}
