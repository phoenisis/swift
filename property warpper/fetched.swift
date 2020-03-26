import CoreData

@propertyWrapper
class Fetched<Object: NSManagedObject>: NSObject, NSFetchedResultsControllerDelegate {
    private var _fetchedResultsController: NSFetchedResultsController<Object>?
    var wrappedValue: [Object] = []
    
    init(context: NSManagedObjectContext = CoreDataService.context, sortDescriptiors: [NSSortDescriptor] = [], predicate: NSPredicate? = nil) {
        super.init()
        // Setup a fetch request
        let fetchRequest = NSFetchRequest<Object>(entityName: Object.entity().name!)
        fetchRequest.sortDescriptors = sortDescriptiors
        fetchRequest.predicate = predicate
        let fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        fetchedResultsController.delegate = self
        // Perform an initial fetch
        try? fetchedResultsController.performFetch()
        self.wrappedValue = fetchedResultsController.fetchedObjects ?? []
        // Store the fetched results controller
        self._fetchedResultsController = fetchedResultsController
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        self.wrappedValue = controller.fetchedObjects as? [Object] ?? []
    }
}

// Usage
@Fetched()
var coffees: [Coffee]