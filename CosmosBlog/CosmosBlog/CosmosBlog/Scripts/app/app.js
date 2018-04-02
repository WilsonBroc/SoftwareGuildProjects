$(document)
    .ready(function () {
        // formatting and displaying trending story in #trending div
        var showTrendingStory = function(trendingStory) {
            
            var result = $('#trending').clone();
            return result.html('<center><img class="img-thumbnail img-responsive" id="trendingImage" src="' + trendingStory.image.thumbnail.contentUrl + '"></center><br/><a id="trendingNews" target="_blank" href=' +
                trendingStory.url +
                '>' +
                trendingStory.name +
                '</a>');          
        };

        // settings for ajax call
        var settings = {
            "async": true,
            "crossDomain": true,
            "url":
                "https://bingapis.azure-api.net/api/v5/news/search?q=space&count=4&offset=0&mkt=en-us&safeSearch=Moderate",
            "method": "GET",
            "headers": {
                "accept": "application/json",
                "ocp-apim-subscription-key": "8d844778a9cb4ffca51e32db35e55047",
                "cache-control": "no-cache",
                "postman-token": "a27c6b12-de28-d982-9335-9f755f646f02"
            }
        }

        // ajax call to get trending news stories from Bing News
        $.ajax(settings)
            .done(function(response) {
                console.log(response);
                $.each(response.value,
                    function(i, item) {
                        var trendingStory = showTrendingStory(item);
                        $('#trending').append(trendingStory);
                    });
            });

        //$('#btnShowAddCategory')
        //    .click(function() {
        //        $('#addCategoryModal').modal('show');
        //        $('#categoryName').val('');               
        //    });

        //var categoryPath = '/api/categoryapi/';

        //$('#btnSaveCategory')
        //    .click(function(e) {
        //        if ($('#addCategoryForm').valid()) {
        //            e.preventDefault();

        //            var category = {};

        //            category.CategoryName = $('#categoryName').val();

        //            $.post(categoryPath, category)
        //                .done(function() {
        //                    $('##categoryList select option').append(category.CategoryName);
        //                    $('#addCategoryModal').modal('hide');
        //                })
        //                .fail(function(jqXhr, status, err) {
        //                    alert(status + ' - ' + err);
        //                });
        //        }
        //    });

    });