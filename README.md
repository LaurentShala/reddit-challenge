# Coding Challenge
[Hacker News](https://news.ycombinator.com) is a website where users submit content (via links or plain text) as posts. Other users can upvote posts, and posts are ranked on the front page based on their votes and age.

The goal is to create a basic iOS application that lists Hacker News front-page posts.
- Each row should contain the title and author of the post.
- Tapping a row should open the URL attached to the post in a basic web view.
- If time permits, add some form of input to allow the user to search posts by keyword.

Feel free to create the application whichever way you'd like. Feel free to use open source libraries.

## Getting Started

This repository contains two starter projects. Pick the one you're most comfortable with; both are set up and ready to run.

| Project | Open | Minimum iOS |
| --- | --- | --- |
| UIKit | `CodingChallengeUIKit/CodingChallenge.xcodeproj` | 16.4 |
| SwiftUI | `CodingChallengeSwiftUI/CodingChallenge.xcodeproj` | 27.0 |

Open the `.xcodeproj`, select the `CodingChallenge` scheme and an iPhone simulator, and run. No additional setup is needed.

```
├── CodingChallengeUIKit/     # UIKit starter project (code-only, no storyboards)
├── CodingChallengeSwiftUI/   # SwiftUI starter project
└── NetworkKit/               # Shared networking Swift package used by both projects
```

> **Note:** Open only the `.xcodeproj`. Don't open `NetworkKit/Package.swift` in a separate Xcode window at the same time, or the project will fail to resolve the package. You can browse and edit `NetworkKit` from the project navigator under **Package Dependencies**.

## Network Service Usage

A simple networking implementation has been provided in the `NetworkKit` Swift package, which both projects already depend on. Import it in any file that needs it.

- `Endpoint.home` fetches the front page.
- `Endpoint.search(query:)` searches stories by keyword.

Each request returns a `Page`, whose `posts` are `Post` values with a `title`, `author`, and `url`.

#### Using callbacks:
```swift
import NetworkKit

let service = NetworkService()

service.execute(endpoint: .home) { result in
    switch result {
        case .success(let response):
            print(response.posts)
        case .failure:
            print("error!!!!")
    }
}
```

#### Using async/await:
```swift
import NetworkKit

let service = NetworkService()

do {
    let page = try await service.execute(endpoint: .home)
    print(page.posts)
} catch {
    print("There was an error: \(error)")
}
```
