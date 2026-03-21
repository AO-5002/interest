import Foundation

// MARK: - Dummy Profile Media

let dummyAvatars: [ProfileMedia] = [
    ProfileMedia(id: UUID(uuidString: "bb111111-1111-1111-1111-111111111111")!, profileId: UUID(uuidString: "11111111-1111-1111-1111-111111111111")!, s3Key: "media/avatars/andres.jpg"),
    ProfileMedia(id: UUID(uuidString: "bb222222-2222-2222-2222-222222222222")!, profileId: UUID(uuidString: "22222222-2222-2222-2222-222222222222")!, s3Key: "media/avatars/jay.jpg"),
    ProfileMedia(id: UUID(uuidString: "bb333333-3333-3333-3333-333333333333")!, profileId: UUID(uuidString: "33333333-3333-3333-3333-333333333333")!, s3Key: "media/avatars/rod.jpg")
]

let dummyBanners: [ProfileMedia] = [
    ProfileMedia(id: UUID(uuidString: "cc111111-1111-1111-1111-111111111111")!, profileId: UUID(uuidString: "11111111-1111-1111-1111-111111111111")!, s3Key: "media/banners/andres-banner.jpg"),
    ProfileMedia(id: UUID(uuidString: "cc222222-2222-2222-2222-222222222222")!, profileId: UUID(uuidString: "22222222-2222-2222-2222-222222222222")!, s3Key: "media/banners/jay-banner.jpg")
]

// MARK: - Dummy Profiles

let dummyProfileSummaries: [ProfileSummary] = [
    ProfileSummary(id: UUID(uuidString: "11111111-1111-1111-1111-111111111111")!, handle: "@lofiandres", name: "Andres", avatar: dummyAvatars[0], banner: dummyBanners[0]),
    ProfileSummary(id: UUID(uuidString: "22222222-2222-2222-2222-222222222222")!, handle: "@beatsbyjay", name: "Jay", avatar: dummyAvatars[1], banner: dummyBanners[1]),
    ProfileSummary(id: UUID(uuidString: "33333333-3333-3333-3333-333333333333")!, handle: "@solarrod", name: "Rod", avatar: dummyAvatars[2], banner: nil),
    ProfileSummary(id: UUID(uuidString: "44444444-4444-4444-4444-444444444444")!, handle: "@ukgmike", name: "Mike", avatar: nil, banner: nil),
    ProfileSummary(id: UUID(uuidString: "55555555-5555-5555-5555-555555555555")!, handle: "@deepcutsara", name: "Sara", avatar: nil, banner: nil),
    ProfileSummary(id: UUID(uuidString: "66666666-6666-6666-6666-666666666666")!, handle: "@preston", name: "Preston", avatar: nil, banner: nil)
]

// MARK: - Post -> Tag mapping (now [String])

private let postTagMap: [UUID: [String]] = [
    UUID(uuidString: "a1b2c3d4-e5f6-7890-abcd-ef1234567890")!: ["Lo-Fi"],
    UUID(uuidString: "b2c3d4e5-f6a7-8901-bcde-f12345678901")!: ["808"],
    UUID(uuidString: "c3d4e5f6-a7b8-9012-cdef-123456789012")!: ["Ambient"],
    UUID(uuidString: "d4e5f6a7-b8c9-0123-defa-234567890123")!: ["UKG"],
    UUID(uuidString: "e5f6a7b8-c9d0-1234-efab-345678901234")!: ["Dark"],
    UUID(uuidString: "f6a7b8c9-d0e1-2345-fabc-456789012345")!: ["Bass"]
]

// MARK: - Post -> Thumbnail mapping

private let postThumbnailMap: [UUID: String] = [
    UUID(uuidString: "a1b2c3d4-e5f6-7890-abcd-ef1234567890")!: "media/thumbnails/late-night-vibes.jpg",
    UUID(uuidString: "b2c3d4e5-f6a7-8901-bcde-f12345678901")!: "media/thumbnails/808s-heartbreak-demo.jpg",
    UUID(uuidString: "c3d4e5f6-a7b8-9012-cdef-123456789012")!: "media/thumbnails/sunrise-sessions-vol1.jpg",
    UUID(uuidString: "d4e5f6a7-b8c9-0123-defa-234567890123")!: "media/thumbnails/ukg-experiment-3.jpg",
    UUID(uuidString: "e5f6a7b8-c9d0-1234-efab-345678901234")!: "media/thumbnails/midnight-frequencies.jpg",
    UUID(uuidString: "f6a7b8c9-d0e1-2345-fabc-456789012345")!: "media/thumbnails/bass-theory-vol2.jpg"
]

// MARK: - Combined Post Items

let dummyPostItems: [PostItem] = [
    PostItem(id: UUID(uuidString: "a1b2c3d4-e5f6-7890-abcd-ef1234567890")!, title: "Late Night Vibes", abstractContent: "A lo-fi exploration of late night energy, blending soft pad textures with mellow chord progressions and subtle tape saturation. This rough draft captures a fleeting mood — intimate, hazy, and deeply introspective. Best listened to with headphones in the dark.", type: .music, thumbnailS3Key: postThumbnailMap[UUID(uuidString: "a1b2c3d4-e5f6-7890-abcd-ef1234567890")!], tags: postTagMap[UUID(uuidString: "a1b2c3d4-e5f6-7890-abcd-ef1234567890")!]!, profile: dummyProfileSummaries[0]),
    PostItem(id: UUID(uuidString: "b2c3d4e5-f6a7-8901-bcde-f12345678901")!, title: "808s & Heartbreak Demo", abstractContent: "An early-stage demo built around emotional 808 bass lines and drifting atmospheric synths. Inspired by late night sessions and unresolved feelings, this rough explores the tension between heavy low end and delicate melodic space. Still finding its final form.", type: .music, thumbnailS3Key: postThumbnailMap[UUID(uuidString: "b2c3d4e5-f6a7-8901-bcde-f12345678901")!], tags: postTagMap[UUID(uuidString: "b2c3d4e5-f6a7-8901-bcde-f12345678901")!]!, profile: dummyProfileSummaries[1]),
    PostItem(id: UUID(uuidString: "c3d4e5f6-a7b8-9012-cdef-123456789012")!, title: "Sunrise Sessions Vol. 1", abstractContent: "A fully polished morning set channeling uplifting energy through warm analog synths, airy vocal chops, and a driving yet smooth groove. Every element was carefully mixed and mastered to capture that golden hour feeling from the first drop to the last note.", type: .music, thumbnailS3Key: postThumbnailMap[UUID(uuidString: "c3d4e5f6-a7b8-9012-cdef-123456789012")!], tags: postTagMap[UUID(uuidString: "c3d4e5f6-a7b8-9012-cdef-123456789012")!]!, profile: dummyProfileSummaries[2]),
    PostItem(id: UUID(uuidString: "d4e5f6a7-b8c9-0123-defa-234567890123")!, title: "UKG Experiment #3", abstractContent: "A refined UK garage experiment pushing the boundaries of shuffled two-step rhythms and chopped vocal samples. This polished track blends classic UKG energy with modern sound design choices, featuring tight sidechain compression and crisp, punchy drum programming throughout.", type: .music, thumbnailS3Key: postThumbnailMap[UUID(uuidString: "d4e5f6a7-b8c9-0123-defa-234567890123")!], tags: postTagMap[UUID(uuidString: "d4e5f6a7-b8c9-0123-defa-234567890123")!]!, profile: dummyProfileSummaries[3]),
    PostItem(id: UUID(uuidString: "e5f6a7b8-c9d0-1234-efab-345678901234")!, title: "Midnight Frequencies", abstractContent: "A raw late-night session venturing into dark ambient territory with sub-heavy bass design and evolving noise textures. This rough sketch documents a creative experiment in building tension without a traditional structure — more of a soundscape than a song.", type: .music, thumbnailS3Key: postThumbnailMap[UUID(uuidString: "e5f6a7b8-c9d0-1234-efab-345678901234")!], tags: postTagMap[UUID(uuidString: "e5f6a7b8-c9d0-1234-efab-345678901234")!]!, profile: dummyProfileSummaries[4]),
    PostItem(id: UUID(uuidString: "f6a7b8c9-d0e1-2345-fabc-456789012345")!, title: "Bass Theory Vol. 2", abstractContent: "A polished deep dive into bass sound design, showcasing layered Serum patches, reese bass techniques, and harmonic distortion stacking. This track serves as both a musical release and a technical reference for producers interested in crafting powerful, genre-defining low end.", type: .music, thumbnailS3Key: postThumbnailMap[UUID(uuidString: "f6a7b8c9-d0e1-2345-fabc-456789012345")!], tags: postTagMap[UUID(uuidString: "f6a7b8c9-d0e1-2345-fabc-456789012345")!]!, profile: dummyProfileSummaries[5])
]
