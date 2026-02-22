//
//  Supabase.swift
//  utd-summit
//
//  Created by Andres Ortiz Osorio on 1/29/26.
//

import Supabase
import Foundation

let client = SupabaseClient(supabaseURL: URL(string: Config.supabaseURL)!, supabaseKey: Config.supabaseAnonKey)
