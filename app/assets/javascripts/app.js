angular.module('miClinica', ['ui.router', 'templates'])
.config([
'$stateProvider',
'$urlRouterProvider',
function($stateProvider, $urlRouterProvider) {

  $stateProvider
    .state('home', {
      url: '/home',
      templateUrl: 'home/_home.html',
      controller: 'MainCtrl'
    })
  .state('clinics', {
    url: '/clinics/{id}',
    templateUrl: 'clinics/_clinics.html',
    controller: 'ClinicsCtrl'
  });

  $urlRouterProvider.otherwise('home');
}])

.factory('clinics', [function(){
  var o = {
    clinics: []
  };
  return o;
}])
.controller('ClinicsCtrl', [
'$scope',
'$stateParams',
'clinics',
function($scope, $stateParams, clinics){

  $scope.clinic = clinics.clinics[$stateParams.id];
  $scope.clinic.reviews = [];
  
  $scope.addReview = function(){
    if($scope.body === '') { return; }
    $scope.clinic.reviews.push({
    body: $scope.body,
    author: 'user',
    upvotes: 0
    });
    $scope.body = '';
  };
  
  $scope.incrementUpvotes = function(review){
      review.upvotes += 1;
  };
}])
.controller('MainCtrl', [
  '$scope',
  'clinics',
  function($scope, clinics){
  
    $scope.clinics = clinics.clinics;

    $scope.addClinic = function (){
      if($scope.title === '') { return; }
      $scope.clinics.push({
        title: $scope.title,
        category: $scope.category,
        street: $scope.street,
        city: $scope.city,
        zip: $scope.zip,
        areaServed: $scope.areaServed,
        openHours: $scope.openHours,
        phone: $scope.phone,
        languages: $scope.languages,
        payScale: $scope.payScale,
        link: $scope.link,
        upvotes: 0
        });
    /*  $scope.title = '';
      $scope.link = '';
      $scope.payScale = '';
      $scope.languages = '';
      $scope.phone = '';
      $scope.openHours = '';
      $scope.areaServed = '';
      $scope.zip = '';
      $scope.city = '';
      $scope.street = '';
      $scope.category = '';*/
    };
    
    $scope.incrementUpvotes = function(clinic) {
      clinic.upvotes += 1;
    };
  }]);