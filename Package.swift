// swift-tools-version:5.3

// Copyright 2025 Google LLC.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import PackageDescription

let package = Package(
  name: "PangleAdapter",
  platforms: [.iOS(.v12)],
  products: [
    .library(
      name: "PangleAdapterTarget",
      targets: ["PangleAdapterTarget"]
    )
  ],
  dependencies: [
    .package(
      name: "PangleSDK",
      url: "https://github.com/bytedance/AdsGlobalPackage.git",
      .exact("7.9.0-release.6")
    )
  ],
  targets: [
    .target(
      name: "PangleAdapterTarget",
      dependencies: [
        .target(name: "PangleAdapter"),
        .product(name: "AdsGlobalPackage", package: "PangleSDK")
      ],
      path: "PangleAdapterTarget"
    ),
    .binaryTarget(
      name: "PangleAdapter",
      url:
        "https://dl.google.com/googleadmobadssdk/mediation/ios/pangle/PangleAdapter-7.8.5.8.1.zip",
      checksum: "2303bb4497a30bc8f884473bd2945e5913ed5f76d9d0614d32f27a2f125b2acb"
    ),
  ]
)
