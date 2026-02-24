// Task 1. Trigger Creation
trigger apextr on Account (before insert) {
    
        
        // Task 3. Bulk Safety
        
        try{
            // Task 2. Business Rule
            List<Account> acclist = new List<Account>([SELECT Id, Name FROM Account]);

            for(Account acc : Trigger.new) {
                if(acc.name == null || acc.name.length()<5) {
                    acc.addError('Account Name must be at least 5 characters long.');
        }
                else {
                    acc.name = acc.name + ' - Verified';
        }
            }
            insert acclist;
        } catch(DmlException e) {
            System.debug('Error: ' + e.getMessage());
        }
    }
