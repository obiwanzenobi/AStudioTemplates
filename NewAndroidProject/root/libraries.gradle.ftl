class Libraries extends Expando{}

project.ext.libraries = new Libraries()

String supportLibraryVersion = "25.3.0"
String espressoVersion = "2.2.2"
String daggerVersion = "2.10"
String retrofitVersion = "2.2.0"

def libs = project.ext.libraries

libs.espresso = "com.android.support.test.espresso:espresso-core:$espressoVersion"
libs.testRunner = 'com.android.support.test:runner:0.5'
libs.testRules = 'com.android.support.test:rules:0.5'

libs.junit = 'junit:junit:4.12'
libs.junitParamsRunner = 'pl.pragmatists:JUnitParams:1.0.6'
libs.mockito = "org.mockito:mockito-core:1.10.19"
libs.robolectric = "org.robolectric:robolectric:3.3.2"

libs.supportAppcompat = "com.android.support:appcompat-v7:$supportLibraryVersion";
libs.supportAnnotations = "com.android.support:support-annotations:$supportLibraryVersion";
libs.supportDesign = "com.android.support:design:$supportLibraryVersion"
libs.recyclerView = "com.android.support:recyclerview-v7:$supportLibraryVersion"
libs.design = "com.android.support:design:$supportLibraryVersion"
libs.constraintLayout = 'com.android.support.constraint:constraint-layout:1.0.2'

libs.dagger = "com.google.dagger:dagger:$daggerVersion"
libs.daggerCompiler = "com.google.dagger:dagger-compiler:$daggerVersion"
libs.javaxAnnotationJsr250w = 'javax.annotation:jsr250-api:1.0'

libs.autoValue = 'com.google.auto.value:auto-value:1.2'
libs.autoValueGson = 'com.ryanharter.auto.value:auto-value-gson:0.4.6'

libs.rxJava = 'io.reactivex.rxjava2:rxjava:2.0.9'
libs.rxAndroid = 'io.reactivex.rxjava2:rxandroid:2.0.1'

libs.gson = 'com.google.code.gson:gson:2.8.0'
libs.retrofit = "com.squareup.retrofit2:retrofit:$retrofitVersion"
libs.retrofitGson = "com.squareup.retrofit2:converter-gson:$retrofitVersion"
libs.retrofitRx = "com.squareup.retrofit2:adapter-rxjava2:$retrofitVersion"

libs.timber = 'com.jakewharton.timber:timber:4.5.1'
libs.eventbus = 'org.greenrobot:eventbus:3.0.0'