import sys, time, threading

#twirl_sequence = "/-\\|/-\\|/-\\|/-\\|\\-/|\\-/|\\-/|\\-/|"
#twirl_sequence = "v<^>" *4 + "^<v>" *4
#twirl_sequence = "dqpb" *4 + "pqdb" *4
twirl_sequence = ".oO°Oo."

def spin_cursor():
    while True:
        for cursor in twirl_sequence:
            sys.stdout.write(cursor)
            sys.stdout.flush()
            time.sleep(0.1) # adjust this to change the speed
            sys.stdout.write('\b')
            if done:
                return

# start the spinner in a separate thread
done = False
spin_thread = threading.Thread(target=spin_cursor)
spin_thread.start()

# do some more work in the main thread, or just sleep:
time.sleep(3)

# tell the spinner to stop, and wait for it to do so;
# this will clear the last cursor before the program moves on
done = True
spin_thread.join()

# continue with other tasks
sys.stdout.write("all done\n")
