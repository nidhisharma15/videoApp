//
//  DataResource.swift
//  VideoApp
//
//  Created by Nidhi.sharma3 on 08/11/21.
//

import Foundation

struct DataResource
{
    func getData(completionHandler: @escaping (DataResponse?) -> ()) {
//TODO:  Replace the api url with the one shared in assignment
        let dataApiUrl = URL(string: "https://6189739cd0821900178d79c9.mockapi.io/truckList/trucklist")!

        URLSession.shared.dataTask(with: dataApiUrl) { (data, response, error) in

            if(error == nil && data != nil)
            {
                do {
                    let result = try JSONDecoder().decode(DataResponse.self, from: data!)

                    completionHandler(result)

                } catch let error {
                    debugPrint(error)
                }
            }

        }.resume()


    }
}
