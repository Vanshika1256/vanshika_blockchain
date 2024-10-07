module MyModule::FitnessTracker {

    use aptos_framework::signer;
    use aptos_framework::coin;
    use aptos_framework::aptos_coin::AptosCoin;

    /// Struct representing user fitness data.
    struct UserFitness has store, key {
        total_workouts: u64,   // Total number of workouts completed
        total_tokens_earned: u64,  // Total tokens earned by the user
    }

    /// Function to log a workout and update the total number of workouts.
    public fun log_workout(user: &signer, workout_count: u64) acquires UserFitness {
        let fitness_data = borrow_global_mut<UserFitness>(signer::address_of(user));
        fitness_data.total_workouts = fitness_data.total_workouts + workout_count;
    }

}
