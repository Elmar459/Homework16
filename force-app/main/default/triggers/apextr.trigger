// Task 1. Trigger Creation
trigger apextr on Account (before insert) {
    
        
        // Task 3. Bulk Safety
        
        try{
            // Task 2. Business Rule
            for(Account acc : Trigger.new) {
                if(acc.name == null || acc.name.length()<5) {
                    acc.addError('Account Name must be at least 5 characters long.');
        }
                else {
                    acc.name = acc.name + ' - Verified';
        }
            }
            insert Trigger.new;
        } catch(DmlException e) {
            System.debug('Error: ' + e.getMessage());
        }
    }
