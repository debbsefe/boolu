# Boolu

## Description

Boolu is a football mobile application where you can find updated football stats and scores for different leagues.

[![Codemagic build status](https://api.codemagic.io/apps/60565e55612f0df040cdb6e2/60565e55612f0df040cdb6e1/status_badge.svg)](https://codemagic.io/apps/60565e55612f0df040cdb6e2/60565e55612f0df040cdb6e1/latest_build)

## App Development info

_Folder Structure_

- core: contains all files that will be used throughout the app

  - error: exceptions and failure classes are located here
  - utils: general classes and constants used throughout the app are located here, such as app strings, app constants etc.

- feature: each feature that are available in the app are included here, and separated as folders
  - data: all calls made to the remote data/api are included here
  - domain: represents bridge between the data layer and presentation layer, here all abstractions are made before being sent to the presentation layer
  - presentation: includes all classes and methods that make up the screens/pages of the app.
