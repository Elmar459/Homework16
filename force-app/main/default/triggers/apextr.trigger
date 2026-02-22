// Task 1. Trigger Creation

trigger apextr on Account (before insert) {

    // Task 2. Business Rule
    
    for(Account acc : Trigger.new) {
        if(acc.name != null && acc.name.length()<5) {
            acc.addError('Account Name must be at least 5 characters long.');
        }
        else {
            acc.name = acc.name + ' - Verified';
        }
        
        // Task 3. Bulk Safety
        
        try{
            // Simulate a potential exception for demonstration
            if(acc.name.contains('Error')) {
                throw new DmlException('Simulated exception for testing bulk safety.');
            }
        } catch(DmlException e) {
            acc.addError('An error occurred: ' + e.getMessage());
        }
    }
}