(function ($) {
    $(document).ready(function () {
        $('#tableExpenses').prepend('<thead>' +    //change to correct markup
                                     '<tr>' +
                                       '<th>Expense</th>' +
                                       '<th>Amount</th>' +
                                       '<th>Category</th>' +
                                       '<th>Percentage of Salary</th>' +
                                     '</tr>' +
                                    '</thead>');
        $('.error').css("display", "none"); //hide the error block
        var observer = new MutationObserver(function (mutants) {
            for (var l = 0; l < mutants.length; l++) { //for each change
                //initialize
                var $errorParent = $(mutants[l].target).parent(),
                    areAnyVis = false,
                    curChild = $errorParent.children(":first-child");
                for (var i = 0; i < $errorParent.children().length; i++) { //for each child item
                    if (curChild.css("visibility") == "visible") { // if it gets set to visible 
                        areAnyVis = true;
                        $errorParent.css("display", "block"); //change the display of elements
                        curChild.css('display', 'inline');
                    } else {
                        curChild.css('display', 'none'); //else if its hidden, don't display element
                    }
                    curChild = curChild.next(); //go to next child through parent div
                }
                if (!areAnyVis) //if all are not visibile 
                    $errorParent.css("display", "none"); // change to not display parent
            }
        });

        //This sets up listener of style element change for each element
        var temp = document.getElementById("reqSalaryInput");
        observer.observe(temp, { attributes: true, attributeFilter: ['style'] });
        var temp = document.getElementById("regExSalaryInput");
        observer.observe(temp, { attributes: true, attributeFilter: ['style'] });
        var temp = document.getElementById("reqDdlExpenseCategory");
        observer.observe(temp, { attributes: true, attributeFilter: ['style'] });
        var temp = document.getElementById("reqExpenseNameInput");
        observer.observe(temp, { attributes: true, attributeFilter: ['style'] });
        var temp = document.getElementById("reqExpenseAmountInput");
        observer.observe(temp, { attributes: true, attributeFilter: ['style'] });
        var temp = document.getElementById("regExExpenseAmountInput");
        observer.observe(temp, { attributes: true, attributeFilter: ['style'] });
    });
})(jQuery);