# Design Patterns on iOS using Swift (2/2)


## The Adapter Pattern

> An Adapter allows classes with incompatible interfaces to work together. It wraps itself around an object and exposes a standard interface to interact with that object.

~~~swift
protocol HorizontalScrollerViewDelegate: class {
  // inform the delegate that the view at <index> has been selected
  func horizontalScrollerView(_ horizontalScrollerView: HorizontalScrollerView, didSelectViewAt index: Int)
}
~~~

## The Observer Pattern

> In the Observer pattern, one object notifies other objects of any state changes. The objects involved don't need to know about one another - thus encouraging a decoupled design. This pattern's most often used to notify interested objects when a property has changed.

### Notifications

> Not be be confused with Push or Local notifications, Notifications are based on a subscribe-and-publish model that allows an object (the publisher) to send messages to other objects (subscribers/listeners). The publisher never needs to know anything about the subscribers.

~~~swift
extension Notification.Name {
  static let BLDownloadImage = Notification.Name("BLDownloadImageNotification")
}
~~~

~~~swift
NotificationCenter.default.post(name: .BLDownloadImage, object: self, userInfo: ["imageView": coverImageView, "coverUrl" : coverUrl])
~~~

~~~swift
NotificationCenter.default.addObserver(self, selector: #selector(downloadImage(with:)), name: .BLDownloadImage, object: nil)
~~~


### Key-Value Observing (KVO)

> In KVO, an object can ask to be notified of any changes to a specific property; either its own or that of another object.

~~~swift
private var valueObservation: NSKeyValueObservation!
~~~

~~~swift
valueObservation = coverImageView.observe(\.image, options: [.new]) { [unowned self] observed, change in
  if change.newValue is UIImage {
      self.indicatorView.stopAnimating()
  }
}
~~~


## The Memento Pattern

> The memento pattern captures and externalizes an object's internal state. In other words, it saves your stuff somewhere. Later on, this externalized state can be restored without violating encapsulation; that is, private data remains private.

~~~swift
func application(_ application: UIApplication, shouldSaveApplicationState coder: NSCoder) -> Bool {
  return true
}

func application(_ application: UIApplication, shouldRestoreApplicationState coder: NSCoder) -> Bool {
  return true
}
~~~

~~~swift
static let IndexRestorationKey = "currentAlbumIndex"
~~~

~~~swift
override func encodeRestorableState(with coder: NSCoder) {
  coder.encode(currentAlbumIndex, forKey: Constants.IndexRestorationKey)
  super.encodeRestorableState(with: coder)
}

override func decodeRestorableState(with coder: NSCoder) {
  super.decodeRestorableState(with: coder)
  currentAlbumIndex = coder.decodeInteger(forKey: Constants.IndexRestorationKey)
  showDataForAlbum(at: currentAlbumIndex)
  horizontalScrollerView.reload()
}
~~~

~~~swift
override func viewDidAppear(_ animated: Bool) {
  super.viewDidAppear(animated)
  horizontalScrollerView.scrollToView(at: currentAlbumIndex, animated: false)
}
~~~

## Archiving and Serialization

> One of Apple's specialized implementations of the Memento pattern can be achieved through archiving and serialization. Before Swift 4, to serialize and archive your custom types you'd have to jump through a number of steps. For class types you'd need to subclass NSObject and conform to NSCoding protocol.

~~~swift
struct Album: Codable {
  let title : String
  let artist : String
  let genre : String
  let coverUrl : String
  let year : String
}
~~~

~~~swift
private var documents: URL {
  return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
}

private enum Filenames {
  static let Albums = "albums.json"
}

func saveAlbums() {
  let url = documents.appendingPathComponent(Filenames.Albums)
  let encoder = JSONEncoder()
  guard let encodedData = try? encoder.encode(albums) else {
    return
  }
  try? encodedData.write(to: url)
}
~~~

~~~swift
let savedURL = documents.appendingPathComponent(Filenames.Albums)
var data = try? Data(contentsOf: savedURL)
if data == nil, let bundleURL = Bundle.main.url(forResource: Filenames.Albums, withExtension: nil) {
  data = try? Data(contentsOf: bundleURL)
}

if let albumData = data,
  let decodedAlbums = try? JSONDecoder().decode([Album].self, from: albumData) {
  albums = decodedAlbums
  saveAlbums()
}
~~~
