//
//  UIImageView+DownloadImage.swift
//  AppStore
//
//  Created by Isaac Ballas on 2019-10-16.
//  Copyright © 2019 Isaacballas. All rights reserved.
//

import UIKit

extension UIImageView {
    func loadImage(url: URL) -> URLSessionDownloadTask {
        let session = URLSession.shared
        // After getting a reference to the shared URLSession, create the download task.
        let downloadTask = session.downloadTask(with: url) { [weak self] (url, response, error) in
            // Inside completion handler, error handle, and the URL points to a local file rather than internet address.
            if error == nil, let url = url, let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                // with the local URL load the file into a Data object, and then create an image from that. Put the image where it should be (UIImageView) do this on the main thread.
                DispatchQueue.main.async {
                    if let weakSelf = self {
                        weakSelf.image = image
                    }
                }
            }
        }
        downloadTask.resume()
        return downloadTask
    }
}
