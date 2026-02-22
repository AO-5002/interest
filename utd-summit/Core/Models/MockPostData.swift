import Foundation

// MARK: - Dummy Profiles

let dummyProfileSummaries: [ProfileSummary] = [
    ProfileSummary(
        id: UUID(uuidString: "11111111-1111-1111-1111-111111111111")!,
        handle: "@lofiandres",
        name: "Andres",
        avatar: nil
    ),
    ProfileSummary(
        id: UUID(uuidString: "22222222-2222-2222-2222-222222222222")!,
        handle: "@beatsbyjay",
        name: "Jay",
        avatar: nil
    ),
    ProfileSummary(
        id: UUID(uuidString: "33333333-3333-3333-3333-333333333333")!,
        handle: "@solarrod",
        name: "Rod",
        avatar: nil
    ),
    ProfileSummary(
        id: UUID(uuidString: "44444444-4444-4444-4444-444444444444")!,
        handle: "@ukgmike",
        name: "Mike",
        avatar: nil
    ),
    ProfileSummary(
        id: UUID(uuidString: "55555555-5555-5555-5555-555555555555")!,
        handle: "@deepcutsara",
        name: "Sara",
        avatar: nil
    ),
    ProfileSummary(
        id: UUID(uuidString: "66666666-6666-6666-6666-666666666666")!,
        handle: "@wavemakerluis",
        name: "Luis",
        avatar: nil
    )
]

// MARK: - Raw Dummy Data

let dummyPosts: [Post] = [
    Post(
        id: UUID(uuidString: "a1b2c3d4-e5f6-7890-abcd-ef1234567890")!,
        title: "Late Night Vibes",
        type: .rough,
        createdAt: "2026-02-01 22:30",
        updatedAt: "2026-02-01 22:30",
        profileId: UUID(uuidString: "11111111-1111-1111-1111-111111111111")!
    ),
    Post(
        id: UUID(uuidString: "b2c3d4e5-f6a7-8901-bcde-f12345678901")!,
        title: "808s & Heartbreak Demo",
        type: .rough,
        createdAt: "2026-02-05 14:15",
        updatedAt: "2026-02-06 09:00",
        profileId: UUID(uuidString: "22222222-2222-2222-2222-222222222222")!
    ),
    Post(
        id: UUID(uuidString: "c3d4e5f6-a7b8-9012-cdef-123456789012")!,
        title: "Sunrise Sessions Vol. 1",
        type: .polished,
        createdAt: "2026-02-10 07:45",
        updatedAt: "2026-02-11 12:00",
        profileId: UUID(uuidString: "33333333-3333-3333-3333-333333333333")!
    ),
    Post(
        id: UUID(uuidString: "d4e5f6a7-b8c9-0123-defa-234567890123")!,
        title: "UKG Experiment #3",
        type: .polished,
        createdAt: "2026-02-15 19:00",
        updatedAt: "2026-02-15 21:30",
        profileId: UUID(uuidString: "44444444-4444-4444-4444-444444444444")!
    ),
    Post(
        id: UUID(uuidString: "e5f6a7b8-c9d0-1234-efab-345678901234")!,
        title: "Midnight Frequencies",
        type: .rough,
        createdAt: "2026-02-17 23:00",
        updatedAt: "2026-02-17 23:00",
        profileId: UUID(uuidString: "55555555-5555-5555-5555-555555555555")!
    ),
    Post(
        id: UUID(uuidString: "f6a7b8c9-d0e1-2345-fabc-456789012345")!,
        title: "Bass Theory Vol. 2",
        type: .polished,
        createdAt: "2026-02-19 16:45",
        updatedAt: "2026-02-20 10:00",
        profileId: UUID(uuidString: "66666666-6666-6666-6666-666666666666")!
    )
]

let dummyPostMedia: [PostMedia] = [
    PostMedia(
        id: UUID(uuidString: "aa111111-1111-1111-1111-111111111111")!,
        postId: UUID(uuidString: "a1b2c3d4-e5f6-7890-abcd-ef1234567890")!,
        s3Key: "media/thumbnails/late-night-vibes.jpg"
    ),
    PostMedia(
        id: UUID(uuidString: "aa222222-2222-2222-2222-222222222222")!,
        postId: UUID(uuidString: "b2c3d4e5-f6a7-8901-bcde-f12345678901")!,
        s3Key: "media/thumbnails/808s-heartbreak-demo.jpg"
    ),
    PostMedia(
        id: UUID(uuidString: "aa333333-3333-3333-3333-333333333333")!,
        postId: UUID(uuidString: "c3d4e5f6-a7b8-9012-cdef-123456789012")!,
        s3Key: "media/thumbnails/sunrise-sessions-vol1.jpg"
    ),
    PostMedia(
        id: UUID(uuidString: "aa444444-4444-4444-4444-444444444444")!,
        postId: UUID(uuidString: "d4e5f6a7-b8c9-0123-defa-234567890123")!,
        s3Key: "media/thumbnails/ukg-experiment-3.jpg"
    ),
    PostMedia(
        id: UUID(uuidString: "aa555555-5555-5555-5555-555555555555")!,
        postId: UUID(uuidString: "e5f6a7b8-c9d0-1234-efab-345678901234")!,
        s3Key: "media/thumbnails/midnight-frequencies.jpg"
    ),
    PostMedia(
        id: UUID(uuidString: "aa666666-6666-6666-6666-666666666666")!,
        postId: UUID(uuidString: "f6a7b8c9-d0e1-2345-fabc-456789012345")!,
        s3Key: "media/thumbnails/bass-theory-vol2.jpg"
    )
]

let dummyPostTags: [PostTag] = [
    PostTag(
        postId: UUID(uuidString: "a1b2c3d4-e5f6-7890-abcd-ef1234567890")!,
        tagId: UUID(uuidString: "99999991-9999-9999-9999-999999999991")!,
        createdAt: "2026-02-01 22:30"
    ),
    PostTag(
        postId: UUID(uuidString: "b2c3d4e5-f6a7-8901-bcde-f12345678901")!,
        tagId: UUID(uuidString: "99999992-9999-9999-9999-999999999992")!,
        createdAt: "2026-02-05 14:15"
    ),
    PostTag(
        postId: UUID(uuidString: "c3d4e5f6-a7b8-9012-cdef-123456789012")!,
        tagId: UUID(uuidString: "99999993-9999-9999-9999-999999999993")!,
        createdAt: "2026-02-10 07:45"
    ),
    PostTag(
        postId: UUID(uuidString: "d4e5f6a7-b8c9-0123-defa-234567890123")!,
        tagId: UUID(uuidString: "99999994-9999-9999-9999-999999999994")!,
        createdAt: "2026-02-15 19:00"
    ),
    PostTag(
        postId: UUID(uuidString: "e5f6a7b8-c9d0-1234-efab-345678901234")!,
        tagId: UUID(uuidString: "99999995-9999-9999-9999-999999999995")!,
        createdAt: "2026-02-17 23:00"
    ),
    PostTag(
        postId: UUID(uuidString: "f6a7b8c9-d0e1-2345-fabc-456789012345")!,
        tagId: UUID(uuidString: "99999996-9999-9999-9999-999999999996")!,
        createdAt: "2026-02-19 16:45"
    )
]

// MARK: - Combined Post Items

let dummyPostItems: [PostItem] = dummyPosts.map { post in
    PostItem(
        id: post.id,
        content: post,
        thumbnail: dummyPostMedia.first { $0.postId == post.id },
        tags: dummyPostTags.filter { $0.postId == post.id },
        profile: dummyProfileSummaries.first { $0.id == post.profileId }!
    )
}
