//
//  ViewController.swift
//  NewCollectionView
//
//  Created by User-G04 on 9/8/22.
//

import UIKit



final class ViewController: UIViewController {
    
    // MARK: - Data source configurations
    
    private lazy var myDataSource: UICollectionViewDiffableDataSource<Int, Device> = {
        let deviceCell = UICollectionView.CellRegistration<UICollectionViewListCell, Device> { cell, indexPath, model in
            var listContentConfiguration = UIListContentConfiguration.cell()
            listContentConfiguration.text = model.title
            listContentConfiguration.image = UIImage(systemName: model.imageName)
            cell.contentConfiguration = listContentConfiguration
        }
        
        let myDataSource = UICollectionViewDiffableDataSource<Int, Device>(collectionView: newCollectionView) { collectionView, indexPath, model in
            return collectionView.dequeueConfiguredReusableCell(using: deviceCell, for: indexPath, item: model)
        }
        
        return myDataSource
    }()
    
    // MARK: - Setup New Collection View
    
    private lazy var newCollectionView: UICollectionView = {

        let configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        snapshotSave()
    }
    
    // MARK: - Functions
    
    private func setupCollectionView() {
        
        view.addSubview(newCollectionView)
        
        NSLayoutConstraint.activate([
            newCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            newCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            newCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            newCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func snapshotSave() {
        
        var snapshot = myDataSource.snapshot()
        snapshot.appendSections([0, 1])
        snapshot.appendItems(device, toSection: 0)
        snapshot.appendItems(device2, toSection: 1)
        myDataSource.apply(snapshot)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            snapshot.appendItems([.init(title: "New Device", imageName: "appletv")], toSection: 0)
            self.myDataSource.apply(snapshot)
        }
    }


}

