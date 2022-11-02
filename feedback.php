<?php include 'db_connect.php' ?>
<div class="col-lg-12">
    <div class="card card-outline card-primary">
        <div class="card-body">
            <div class="d-flex w-100 px-1 py-2 justify-content-center align-items-center">
                <?php
                $status_arr = array("Item Accepted by Courier","Collected","Shipped","In-Transit","Arrived At Destination","Out for Delivery","Ready to Pickup","Delivered","Picked-up","Unsuccessfull Delivery Attempt"); ?>

                <form id="submit-feedback">
                    <label for="Customer Name">Customer Name</label><br>
                    <input type="text" id="name" name="name"><br><br>
                    <label for="email">Email</label><br>
                    <input type="text" id="email" name="email"><br><br>
                    <label for="feedback">Customer Feedback</label><br>
                    <textarea rows="10" cols="40" id="feedback" name="feedback" value="Enter your detailed feedback here"></textarea><br><br>
                    <button id="Submit Feedback" onclick="submitFeedback()">Submit Feedback</button>
                </form>


            </div>
        </div>
    </div>

<script>
    function submitFeedback() {
        alert("Thank you for your feedback");
    }

</script>