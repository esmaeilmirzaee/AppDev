//
//  AlbumViewController.swift
//  AppDev
//
//  Created by Esmaeil MIRZAEE on 2020-04-16.
//  Copyright © 2020 TheBeaver. All rights reserved.
//

import UIKit

class AlbumViewController: UIViewController {

    var playlistTableView: UITableView!
    var songs: [Song] = [Song]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Songs"
        
        view.backgroundColor = .white
        
        createSongs()
        setupViews()
        setupConstraints()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func createSongs() {
        let song1 = Song(name: "Gang Related", artist: "Logic", album: "Under Pressure", imageName: "underpressure", isFavourite: false)
        let song2 = Song(name: "Walk On Water (ft. Beyonce)",artist: "Eminem", album: "Revival", imageName: "revival" ,isFavourite: false)
        let song3 = Song(name: "Camila", artist: "Camila Cabello", album: "Havana", imageName: "havana", isFavourite: false)
        let song4 = Song(name: "First Day Out", artist: "Tee Grizzley", album: "My Moment", imageName: "mymoment", isFavourite: false)
        let song5 = Song(name: "Liability", artist: "Lorde", album: "Melodrama", imageName: "melodrama", isFavourite: false)
        let song6 = Song(name: "Honeymoon Avenue", artist: "Ariana Grande", album: "Yours Truly", imageName: "yourstruly", isFavourite: false)
        let song7 = Song(name: "Mercy", artist: "Shawn Mendes", album: "Illuminate", imageName: "illuminate", isFavourite: false)
        let song8 = Song(name: "One Call Away", artist: "Charlie Puth", album: "Nine Track Mind", imageName: "ninetrackmind", isFavourite: false)
        let song9 = Song(name: "Midnight Train", artist: "Sam Smith", album: "The Thrill Of It All", imageName: "thrillofitall", isFavourite: false)
        let song10 = Song(name: "Finesse", artist: "Bruno Mars", album: "24k Magic", imageName: "24kmagic", isFavourite: false)
        
        songs = [song1, song2, song3, song4, song5, song6, song7, song8, song9, song10]
    }
    
    func setupViews() {
        playlistTableView = UITableView()
        playlistTableView.register(PlayListTableViewCell.self, forCellReuseIdentifier: "playlistCellID")
        playlistTableView.backgroundColor = .white
        playlistTableView.separatorStyle = .none
        playlistTableView.delegate = self
        playlistTableView.dataSource = self
        view.addSubview(playlistTableView)
    }
    
    func setupConstraints() {
        playlistTableView.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp.top)
            make.left.equalTo(view.snp.left)
            make.right.equalTo(view.snp.right)
            make.bottom.equalTo(view.snp.bottom)
        }
    }
}

extension AlbumViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playlistCellID", for: indexPath) as! PlayListTableViewCell
        let song = songs[indexPath.row]
        cell.row = indexPath.row
        cell.configure(for: song)
        cell.playlistCellDelegate = self
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}

extension AlbumViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let song = songs[indexPath.row]
        let detailVC = DetailViewController()
        detailVC.row = indexPath.row
        detailVC.song = song
        detailVC.songDelegate = self
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension AlbumViewController: SongDelegate {
    func changedSong(row: Int, song: Song) {
        songs[row] = song
        playlistTableView.reloadData()
    }
}

extension AlbumViewController: PlaylistCellDelegate {
    func favouriteButtonTapped(row: Int) {
        let song = songs[row]
        if (!song.isFavourite) {
            song.isFavourite = true
            if let storedFavourites = userDefaults.data(forKey: "favourites"),
                var favourites = try? decoder.decode([Song].self, from: storedFavourites) {
                favourites.append(song)
                
                if let encodedFavourites = try? encoder.encode(favourites) {
                    userDefaults.set(encodedFavourites, forKey: "favourites")
                }
            } else {
                let favourites = [song]
                
                if let encodedFavourites = try? encoder.encode(favourites) {
                    userDefaults.set(encodedFavourites, forKey: "favourites")
                }
            }
        } else {
            song.isFavourite = false
            if let storedFavourites = userDefaults.data(forKey: "favourites"),
                var favourites = try? decoder.decode([Song].self, from: storedFavourites) {
                favourites.removeAll(where: { $0.name == song.name && $0.artist == song.artist })
                
                if let encodedFavourites = try? encoder.encode(favourites) {
                    userDefaults.set(encodedFavourites, forKey: "favourites")
                }
            }
        }
    }
}
