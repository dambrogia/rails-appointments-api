module DatabaseSeeder
    module Users
        # Create Users
        def self.seed
            User.create([
                {
                    first_name: 'Monica',
                    last_name: 'Gheller',
                    email: 'monica@friends.tv',
                    password_digest: 'cleanfr34k'
                }, {
                    first_name: 'Phoebe',
                    last_name: 'Buffay-Hannigan',
                    email: 'phoebe@friends.tv',
                    password_digest: 'sm3llyc4t'
                }, {
                    first_name: 'Rachel',
                    last_name: 'Green',
                    email: 'rachel@friends.tv',
                    password_digest: 'weWereOnABreak'
                }, {
                    first_name: 'Joey',
                    last_name: 'Tribianni',
                    email: 'joey@friends.tv',
                    password_digest: 'howUdoin?'
                }, {
                    first_name: 'Ross',
                    last_name: 'Gheller',
                    email: 'ross@friends.tv',
                    password_digest: 'Mr3divorces'
                }, {
                    first_name: 'Chandler',
                    last_name: 'Bing',
                    email: 'chandman@friends.tv',
                    password_digest: 'couldiHAVEanEasierPasswd?'
                }
            ]);
        end
    end
end
